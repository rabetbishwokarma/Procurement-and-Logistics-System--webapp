from django.db import models
from logistics.models import Reservation


class Alert(models.Model):
    alert_id = models.AutoField(primary_key=True)
    alert_type = models.CharField(max_length=100)
    description = models.TextField(null=True, blank=True)
    related_reservation = models.ForeignKey(
        Reservation, on_delete=models.SET_NULL,
        null=True, blank=True, db_column='RelatedReservationID'
    )
    created_date = models.DateTimeField(null=True, blank=True)
    status = models.CharField(max_length=50, null=True, blank=True)

    class Meta:
        db_table = 'tbl_Alerts'
        verbose_name = 'Alert'
        verbose_name_plural = 'Alerts'

    def __str__(self):
        return f'{self.alert_type} - {self.status}'


class Resource(models.Model):
    resource_id = models.AutoField(primary_key=True)
    reservation = models.ForeignKey(
        Reservation, on_delete=models.CASCADE, db_column='ReservationID'
    )
    staff_required = models.IntegerField(null=True, blank=True)
    forklift_required = models.BooleanField(default=False)
    elevator_operator_required = models.BooleanField(default=False)
    estimated_move_time = models.IntegerField(null=True, blank=True)

    class Meta:
        db_table = 'tbl_Resources'
        verbose_name = 'Resource'
        verbose_name_plural = 'Resources'

    def __str__(self):
        return f'Resource for Reservation #{self.reservation_id}'