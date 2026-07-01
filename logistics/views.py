from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .models import (
    Reservation, DockBay, ElevatorSchedule,
    FreightElevator, FFEDelivery
)
from vendors.models import Vendor
from procurement.models import Item

DELIVERY_STATUS_CHOICES = [
    ('Delivered', 'Delivered'),
    ('Pending', 'Pending'),
    ('Scheduled', 'Scheduled'),
    ('Cancelled', 'Cancelled'),
]

# ─── RESERVATIONS ────────────────────────────────────────

@login_required
def reservation_list(request):
    reservations = Reservation.objects.select_related('vendor', 'dock').order_by('-start_datetime')
    status_filter = request.GET.get('status', '')
    if status_filter:
        reservations = reservations.filter(status=status_filter)
    context = {
        'reservations': reservations,
        'status_filter': status_filter,
        'status_choices': Reservation.STATUS_CHOICES,
    }
    return render(request, 'logistics/reservation_list.html', context)


@login_required
def reservation_create(request):
    vendors = Vendor.objects.filter(approved_status='Yes').order_by('vendor_name')
    docks = DockBay.objects.filter(status='Active').order_by('dock_name')
    elevators = FreightElevator.objects.filter(status='Active').order_by('elevator_name')
    if request.method == 'POST':
        try:
            reservation = Reservation.objects.create(
                vendor_id=request.POST.get('vendor'),
                dock_id=request.POST.get('dock'),
                start_datetime=request.POST.get('start_datetime'),
                end_datetime=request.POST.get('end_datetime'),
                status=request.POST.get('status'),
                priority=request.POST.get('priority'),
                requires_elevator=request.POST.get('requires_elevator') == 'on',
            )
            elevator_id = request.POST.get('elevator')
            if reservation.requires_elevator and elevator_id:
                ElevatorSchedule.objects.create(
                    reservation=reservation,
                    elevator_id=elevator_id,
                    start_datetime=request.POST.get('start_datetime'),
                    end_datetime=request.POST.get('end_datetime'),
                    status=request.POST.get('status'),
                    trip_count=1,
                )
            messages.success(request, f'Reservation #{reservation.reservation_id} created!')
            return redirect('logistics:reservation_list')
        except Exception as e:
            messages.error(request, f'Error: {str(e)}')
    context = {
        'vendors': vendors, 'docks': docks, 'elevators': elevators,
        'status_choices': Reservation.STATUS_CHOICES,
        'priority_choices': Reservation.PRIORITY_CHOICES,
    }
    return render(request, 'logistics/reservation_form.html', context)


@login_required
def reservation_edit(request, pk):
    reservation = get_object_or_404(Reservation, pk=pk)
    vendors = Vendor.objects.filter(approved_status='Yes').order_by('vendor_name')
    docks = DockBay.objects.filter(status='Active').order_by('dock_name')
    elevators = FreightElevator.objects.filter(status='Active').order_by('elevator_name')
    if request.method == 'POST':
        try:
            reservation.vendor_id = request.POST.get('vendor')
            reservation.dock_id = request.POST.get('dock')
            reservation.start_datetime = request.POST.get('start_datetime')
            reservation.end_datetime = request.POST.get('end_datetime')
            reservation.status = request.POST.get('status')
            reservation.priority = request.POST.get('priority')
            reservation.requires_elevator = request.POST.get('requires_elevator') == 'on'
            reservation.save()
            messages.success(request, f'Reservation #{pk} updated!')
            return redirect('logistics:reservation_list')
        except Exception as e:
            messages.error(request, f'Error: {str(e)}')
    context = {
        'reservation': reservation,
        'vendors': vendors, 'docks': docks, 'elevators': elevators,
        'status_choices': Reservation.STATUS_CHOICES,
        'priority_choices': Reservation.PRIORITY_CHOICES,
    }
    return render(request, 'logistics/reservation_form.html', context)


@login_required
def reservation_delete(request, pk):
    reservation = get_object_or_404(Reservation, pk=pk)
    if request.method == 'POST':
        reservation.delete()
        messages.success(request, f'Reservation #{pk} deleted.')
        return redirect('logistics:reservation_list')
    return render(request, 'logistics/reservation_confirm_delete.html', {'reservation': reservation})


# ─── DELIVERIES ──────────────────────────────────────────

@login_required
def delivery_list(request):
    deliveries = FFEDelivery.objects.select_related('item', 'vendor', 'reservation').order_by('-required_on_site_date')
    status_filter = request.GET.get('status', '')
    if status_filter:
        deliveries = deliveries.filter(delivery_status=status_filter)
    context = {
        'deliveries': deliveries,
        'status_filter': status_filter,
        'status_choices': DELIVERY_STATUS_CHOICES,
    }
    return render(request, 'logistics/delivery_list.html', context)


@login_required
def delivery_create(request):
    items = Item.objects.select_related('manufacturer').order_by('item_description')
    vendors = Vendor.objects.filter(approved_status='Yes').order_by('vendor_name')
    reservations = Reservation.objects.select_related('vendor').order_by('-start_datetime')[:20]
    if request.method == 'POST':
        try:
            delivery = FFEDelivery.objects.create(
                item_id=request.POST.get('item'),
                vendor_id=request.POST.get('vendor'),
                reservation_id=request.POST.get('reservation'),
                delivery_status=request.POST.get('delivery_status'),
                required_on_site_date=request.POST.get('required_on_site_date'),
                total_installed_cost=request.POST.get('total_installed_cost') or None,
                variance=request.POST.get('variance') or None,
            )
            messages.success(request, f'Delivery #{delivery.delivery_id} created!')
            return redirect('logistics:delivery_list')
        except Exception as e:
            messages.error(request, f'Error: {str(e)}')
    context = {
        'items': items, 'vendors': vendors, 'reservations': reservations,
        'status_choices': DELIVERY_STATUS_CHOICES,
    }
    return render(request, 'logistics/delivery_form.html', context)


@login_required
def delivery_edit(request, pk):
    delivery = get_object_or_404(FFEDelivery, pk=pk)
    items = Item.objects.select_related('manufacturer').order_by('item_description')
    vendors = Vendor.objects.filter(approved_status='Yes').order_by('vendor_name')
    reservations = Reservation.objects.select_related('vendor').order_by('-start_datetime')[:20]
    if request.method == 'POST':
        try:
            delivery.item_id = request.POST.get('item')
            delivery.vendor_id = request.POST.get('vendor')
            delivery.reservation_id = request.POST.get('reservation')
            delivery.delivery_status = request.POST.get('delivery_status')
            delivery.required_on_site_date = request.POST.get('required_on_site_date')
            delivery.total_installed_cost = request.POST.get('total_installed_cost') or None
            delivery.variance = request.POST.get('variance') or None
            delivery.save()
            messages.success(request, f'Delivery #{pk} updated!')
            return redirect('logistics:delivery_list')
        except Exception as e:
            messages.error(request, f'Error: {str(e)}')
    context = {
        'delivery': delivery, 'items': items, 'vendors': vendors,
        'reservations': reservations, 'status_choices': DELIVERY_STATUS_CHOICES,
    }
    return render(request, 'logistics/delivery_form.html', context)


@login_required
def delivery_delete(request, pk):
    delivery = get_object_or_404(FFEDelivery, pk=pk)
    if request.method == 'POST':
        delivery.delete()
        messages.success(request, f'Delivery #{pk} deleted.')
        return redirect('logistics:delivery_list')
    return render(request, 'logistics/delivery_confirm_delete.html', {'delivery': delivery})


# ─── ELEVATOR SCHEDULER ──────────────────────────────────

@login_required
def elevator_list(request):
    schedules = ElevatorSchedule.objects.select_related(
        'reservation', 'elevator', 'reservation__vendor'
    ).order_by('-start_datetime')
    status_filter = request.GET.get('status', '')
    if status_filter:
        schedules = schedules.filter(status=status_filter)
    context = {
        'schedules': schedules,
        'status_filter': status_filter,
        'status_choices': Reservation.STATUS_CHOICES,
    }
    return render(request, 'logistics/elevator_list.html', context)


@login_required
def elevator_create(request):
    reservations = Reservation.objects.select_related('vendor').order_by('-start_datetime')[:20]
    elevators = FreightElevator.objects.filter(status='Active').order_by('elevator_name')
    if request.method == 'POST':
        try:
            schedule = ElevatorSchedule.objects.create(
                reservation_id=request.POST.get('reservation'),
                elevator_id=request.POST.get('elevator'),
                start_datetime=request.POST.get('start_datetime'),
                end_datetime=request.POST.get('end_datetime'),
                status=request.POST.get('status'),
                trip_count=request.POST.get('trip_count') or 1,
            )
            messages.success(request, f'Elevator schedule #{schedule.elevator_schedule_id} created!')
            return redirect('logistics:elevator_list')
        except Exception as e:
            messages.error(request, f'Error: {str(e)}')
    context = {
        'reservations': reservations, 'elevators': elevators,
        'status_choices': Reservation.STATUS_CHOICES,
    }
    return render(request, 'logistics/elevator_form.html', context)


@login_required
def elevator_edit(request, pk):
    schedule = get_object_or_404(ElevatorSchedule, pk=pk)
    reservations = Reservation.objects.select_related('vendor').order_by('-start_datetime')[:20]
    elevators = FreightElevator.objects.filter(status='Active').order_by('elevator_name')
    if request.method == 'POST':
        try:
            schedule.reservation_id = request.POST.get('reservation')
            schedule.elevator_id = request.POST.get('elevator')
            schedule.start_datetime = request.POST.get('start_datetime')
            schedule.end_datetime = request.POST.get('end_datetime')
            schedule.status = request.POST.get('status')
            schedule.trip_count = request.POST.get('trip_count') or 1
            schedule.save()
            messages.success(request, f'Schedule #{pk} updated!')
            return redirect('logistics:elevator_list')
        except Exception as e:
            messages.error(request, f'Error: {str(e)}')
    context = {
        'schedule': schedule, 'reservations': reservations, 'elevators': elevators,
        'status_choices': Reservation.STATUS_CHOICES,
    }
    return render(request, 'logistics/elevator_form.html', context)


@login_required
def elevator_delete(request, pk):
    schedule = get_object_or_404(ElevatorSchedule, pk=pk)
    if request.method == 'POST':
        schedule.delete()
        messages.success(request, f'Schedule #{pk} deleted.')
        return redirect('logistics:elevator_list')
    return render(request, 'logistics/elevator_confirm_delete.html', {'schedule': schedule})


# ─── ALERTS ──────────────────────────────────────────────

@login_required
def alert_list(request):
    from operations.models import Alert
    alerts = Alert.objects.select_related('related_reservation').order_by('-created_date')
    status_filter = request.GET.get('status', '')
    if status_filter:
        alerts = alerts.filter(status=status_filter)
    context = {
        'alerts': alerts,
        'status_filter': status_filter,
        'open_count': Alert.objects.filter(status='Open').count(),
    }
    return render(request, 'logistics/alert_list.html', context)


@login_required
def alert_close(request, pk):
    from operations.models import Alert
    alert = get_object_or_404(Alert, pk=pk)
    if request.method == 'POST':
        alert.status = 'Closed'
        alert.save()
        messages.success(request, f'Alert #{pk} closed.')
    return redirect('logistics:alert_list')