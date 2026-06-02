from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from logistics.models import Reservation, ElevatorSchedule, FFEDelivery
from operations.models import Alert


@login_required
def home(request):
    # Summary counts for top cards
    total_reservations = Reservation.objects.count()
    pending_deliveries = FFEDelivery.objects.filter(
        delivery_status='Pending'
    ).count()
    elevator_schedules = ElevatorSchedule.objects.count()
    open_alerts = Alert.objects.filter(status='Open').count()

    # Today's schedule
    todays_schedule = Reservation.objects.select_related(
        'vendor', 'dock'
    ).order_by('start_datetime')[:10]

    # Open alerts for panel
    alerts = Alert.objects.filter(status='Open').order_by('-created_date')[:5]

    context = {
        'total_reservations': total_reservations,
        'pending_deliveries': pending_deliveries,
        'elevator_schedules': elevator_schedules,
        'open_alerts': open_alerts,
        'todays_schedule': todays_schedule,
        'alerts': alerts,
    }
    return render(request, 'dashboard/home.html', context)