from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .models import Item, Order, Contract
from vendors.models import Vendor


@login_required
def item_list(request):
    items = Item.objects.select_related('manufacturer', 'contract').order_by('item_description')
    return render(request, 'procurement/item_list.html', {'items': items})


@login_required
def contract_list(request):
    contracts = Contract.objects.select_related('manufacturer').order_by('contract_name')
    return render(request, 'procurement/contract_list.html', {'contracts': contracts})


@login_required
def order_list(request):
    orders = Order.objects.select_related('item', 'vendor').order_by('-fiscal_year')
    return render(request, 'procurement/order_list.html', {'orders': orders})


@login_required
def order_create(request):
    items = Item.objects.all().order_by('item_description')
    vendors = Vendor.objects.filter(approved_status='Yes').order_by('vendor_name')
    if request.method == 'POST':
        try:
            order = Order.objects.create(
                item_id=request.POST.get('item'),
                vendor_id=request.POST.get('vendor'),
                quantity=request.POST.get('quantity'),
                fiscal_year=request.POST.get('fiscal_year'),
                quote_amount=request.POST.get('quote_amount') or None,
                list_price=request.POST.get('list_price') or None,
                discount=request.POST.get('discount') or None,
            )
            messages.success(request, f'Order #{order.order_id} created and saved to database!')
            return redirect('procurement:order_list')
        except Exception as e:
            messages.error(request, f'Error: {str(e)}')
    return render(request, 'procurement/order_form.html', {'items': items, 'vendors': vendors})