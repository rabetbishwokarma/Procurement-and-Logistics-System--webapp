from django.urls import path
from . import views

app_name = 'logistics'

urlpatterns = [
    # Reservations
    path('reservations/', views.reservation_list, name='reservation_list'),
    path('reservations/new/', views.reservation_create, name='reservation_create'),
    path('reservations/<int:pk>/edit/', views.reservation_edit, name='reservation_edit'),
    path('reservations/<int:pk>/delete/', views.reservation_delete, name='reservation_delete'),

    # Deliveries
    path('deliveries/', views.delivery_list, name='delivery_list'),
    path('deliveries/new/', views.delivery_create, name='delivery_create'),
    path('deliveries/<int:pk>/edit/', views.delivery_edit, name='delivery_edit'),
    path('deliveries/<int:pk>/delete/', views.delivery_delete, name='delivery_delete'),

    # Elevator Scheduler
    path('elevators/', views.elevator_list, name='elevator_list'),
    path('elevators/new/', views.elevator_create, name='elevator_create'),
    path('elevators/<int:pk>/edit/', views.elevator_edit, name='elevator_edit'),
    path('elevators/<int:pk>/delete/', views.elevator_delete, name='elevator_delete'),

    # Alerts
    path('alerts/', views.alert_list, name='alert_list'),
    path('alerts/<int:pk>/close/', views.alert_close, name='alert_close'),
]