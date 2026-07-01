from django.urls import path
from . import views

app_name = 'procurement'

urlpatterns = [
    path('items/', views.item_list, name='item_list'),
    path('orders/', views.order_list, name='order_list'),
    path('orders/new/', views.order_create, name='order_create'),
    path('contracts/', views.contract_list, name='contract_list'),
]