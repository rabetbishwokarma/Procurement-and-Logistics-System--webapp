from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .models import Vendor, Manufacturer


@login_required
def vendor_list(request):
    vendors = Vendor.objects.all().order_by('vendor_name')
    context = {'vendors': vendors}
    return render(request, 'vendors/vendor_list.html', context)


@login_required
def vendor_create(request):
    if request.method == 'POST':
        try:
            Vendor.objects.create(
                nys_vendor_id=request.POST.get('nys_vendor_id'),
                vendor_name=request.POST.get('vendor_name'),
                business_type=request.POST.get('business_type'),
                phone=request.POST.get('phone'),
                email=request.POST.get('email'),
                approved_status=request.POST.get('approved_status'),
                contact_name=request.POST.get('contact_name'),
            )
            messages.success(request, 'Vendor created successfully!')
            return redirect('vendors:vendor_list')
        except Exception as e:
            messages.error(request, f'Error: {str(e)}')
    return render(request, 'vendors/vendor_form.html')


@login_required
def vendor_edit(request, pk):
    vendor = get_object_or_404(Vendor, pk=pk)
    if request.method == 'POST':
        try:
            vendor.vendor_name = request.POST.get('vendor_name')
            vendor.business_type = request.POST.get('business_type')
            vendor.phone = request.POST.get('phone')
            vendor.email = request.POST.get('email')
            vendor.approved_status = request.POST.get('approved_status')
            vendor.contact_name = request.POST.get('contact_name')
            vendor.save()
            messages.success(request, 'Vendor updated successfully!')
            return redirect('vendors:vendor_list')
        except Exception as e:
            messages.error(request, f'Error: {str(e)}')
    return render(request, 'vendors/vendor_form.html', {'vendor': vendor})


@login_required
def vendor_delete(request, pk):
    vendor = get_object_or_404(Vendor, pk=pk)
    if request.method == 'POST':
        vendor.delete()
        messages.success(request, 'Vendor deleted.')
        return redirect('vendors:vendor_list')
    return render(request, 'vendors/vendor_confirm_delete.html', {'vendor': vendor})