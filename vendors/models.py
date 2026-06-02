from django.db import models

class Vendor(models.Model):
    nys_vendor_id = models.IntegerField(primary_key=True)
    vendor_name = models.CharField(max_length=255, unique=True)
    business_type = models.CharField(max_length=100, null=True, blank=True)
    phone = models.CharField(max_length=50, null=True, blank=True)
    email = models.EmailField(max_length=255, null=True, blank=True)
    approved_status = models.CharField(max_length=50, null=True, blank=True)
    contact_name = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        db_table = 'tbl_Vendors'
        verbose_name = 'Vendor'
        verbose_name_plural = 'Vendors'

    def __str__(self):
        return self.vendor_name


class Manufacturer(models.Model):
    manufacturer_id = models.AutoField(primary_key=True)
    manufacturer_name = models.CharField(max_length=255, unique=True)
    business_type = models.CharField(max_length=100, null=True, blank=True)

    class Meta:
        db_table = 'tbl_Manufacturers'
        verbose_name = 'Manufacturer'
        verbose_name_plural = 'Manufacturers'

    def __str__(self):
        return self.manufacturer_name