from django.db import models
from vendors.models import Vendor
from procurement.models import Item


class Location(models.Model):
    location_id = models.AutoField(primary_key=True)
    location_name = models.CharField(max_length=255)
    room = models.CharField(max_length=100, null=True, blank=True)
    location_type = models.CharField(max_length=100, null=True, blank=True)

    class Meta:
        db_table = 'tbl_Locations'
        verbose_name = 'Location'
        verbose_name_plural = 'Locations'

    def __str__(self):
        return self.location_name


class DockBay(models.Model):
    dock_id = models.AutoField(primary_key=True)
    dock_name = models.CharField(max_length=100, unique=True)
    location = models.CharField(max_length=255, null=True, blank=True)
    capacity = models.CharField(max_length=100, null=True, blank=True)
    status = models.CharField(max_length=50, null=True, blank=True)

    class Meta:
        db_table = 'tbl_DockBays'
        verbose_name = 'Dock Bay'
        verbose_name_plural = 'Dock Bays'

    def __str__(self):
        return self.dock_name


class FreightElevator(models.Model):
    elevator_id = models.AutoField(primary_key=True)
    elevator_name = models.CharField(max_length=100, unique=True)
    building = models.CharField(max_length=100, null=True, blank=True)
    capacity = models.CharField(max_length=100, null=True, blank=True)
    status = models.CharField(max_length=50, null=True, blank=True)

    class Meta:
        db_table = 'tbl_FreightElevators'
        verbose_name = 'Freight Elevator'
        verbose_name_plural = 'Freight Elevators'

    def __str__(self):
        return self.elevator_name


class Reservation(models.Model):
    STATUS_CHOICES = [
        ('Scheduled', 'Scheduled'),
        ('Pending', 'Pending'),
        ('Completed', 'Completed'),
        ('Cancelled', 'Cancelled'),
        ('Conflict', 'Conflict'),
    ]
    PRIORITY_CHOICES = [
        ('High', 'High'),
        ('Medium', 'Medium'),
        ('Low', 'Low'),
    ]

    reservation_id = models.AutoField(primary_key=True)
    vendor = models.ForeignKey(
        Vendor, on_delete=models.RESTRICT, db_column='VendorID'
    )
    dock = models.ForeignKey(
        DockBay, on_delete=models.RESTRICT, db_column='DockID'
    )
    start_datetime = models.DateTimeField()
    end_datetime = models.DateTimeField()
    status = models.CharField(
        max_length=50, choices=STATUS_CHOICES, null=True, blank=True
    )
    priority = models.CharField(
        max_length=50, choices=PRIORITY_CHOICES, null=True, blank=True
    )
    requires_elevator = models.BooleanField(default=False)

    class Meta:
        db_table = 'tbl_Reservations'
        verbose_name = 'Reservation'
        verbose_name_plural = 'Reservations'

    def __str__(self):
        return f'Reservation #{self.reservation_id} - {self.vendor}'


class ElevatorSchedule(models.Model):
    elevator_schedule_id = models.AutoField(primary_key=True)
    reservation = models.ForeignKey(
        Reservation, on_delete=models.CASCADE, db_column='ReservationID'
    )
    elevator = models.ForeignKey(
        FreightElevator, on_delete=models.RESTRICT, db_column='ElevatorID'
    )
    start_datetime = models.DateTimeField()
    end_datetime = models.DateTimeField()
    status = models.CharField(max_length=50, null=True, blank=True)
    trip_count = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = 'tbl_ElevatorSchedule'
        verbose_name = 'Elevator Schedule'
        verbose_name_plural = 'Elevator Schedules'

    def __str__(self):
        return f'Schedule #{self.elevator_schedule_id}'


class FFEDelivery(models.Model):
    delivery_id = models.AutoField(primary_key=True)
    item = models.ForeignKey(
        Item, on_delete=models.RESTRICT, db_column='ItemID'
    )
    reservation = models.ForeignKey(
        Reservation, on_delete=models.CASCADE, db_column='ReservationID'
    )
    vendor = models.ForeignKey(
        Vendor, on_delete=models.RESTRICT, db_column='VendorID'
    )
    delivery_status = models.CharField(max_length=50, null=True, blank=True)
    required_on_site_date = models.DateField(null=True, blank=True)
    total_installed_cost = models.DecimalField(
        max_digits=14, decimal_places=2, null=True, blank=True
    )
    variance = models.DecimalField(
        max_digits=14, decimal_places=2, null=True, blank=True
    )

    class Meta:
        db_table = 'tbl_FFE_Delivery'
        verbose_name = 'FFE Delivery'
        verbose_name_plural = 'FFE Deliveries'

    def __str__(self):
        return f'Delivery #{self.delivery_id}'


class FFEMove(models.Model):
    move_id = models.AutoField(primary_key=True)
    delivery = models.ForeignKey(
        FFEDelivery, on_delete=models.CASCADE, db_column='DeliveryID'
    )
    elevator_schedule = models.ForeignKey(
        ElevatorSchedule, on_delete=models.CASCADE,
        db_column='ElevatorScheduleID'
    )
    destination_room = models.CharField(max_length=100, null=True, blank=True)
    destination_floor = models.CharField(max_length=50, null=True, blank=True)
    move_status = models.CharField(max_length=50, null=True, blank=True)

    class Meta:
        db_table = 'tbl_FFE_Moves'
        verbose_name = 'FFE Move'
        verbose_name_plural = 'FFE Moves'

    def __str__(self):
        return f'Move #{self.move_id}'