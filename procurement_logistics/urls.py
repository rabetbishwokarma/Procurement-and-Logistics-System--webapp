from django.contrib import admin
from django.urls import path, include
from django.shortcuts import redirect

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('accounts.urls')),
    path('dashboard/', include('dashboard.urls')),
    path('logistics/', include('logistics.urls')),
    path('vendors/', include('vendors.urls')),
    path('procurement/', include('procurement.urls')),
    path('', lambda request: redirect('accounts:login')),
]