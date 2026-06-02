from django.db import models
from vendors.models import Vendor, Manufacturer

class Contract(models.Model):
    contract_id = models.CharField(max_length=50, primary_key=True)
    manufacturer = models.ForeignKey(
        Manufacturer, on_delete=models.RESTRICT, db_column='ManufacturerID'
    )
    contract_name = models.CharField(max_length=255)
    start_date = models.DateField(null=True, blank=True)
    end_date = models.DateField(null=True, blank=True)
    warranty = models.CharField(max_length=255, null=True, blank=True)
    comments = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'tbl_Contracts'
        verbose_name = 'Contract'
        verbose_name_plural = 'Contracts'

    def __str__(self):
        return self.contract_name


class Item(models.Model):
    item_id = models.AutoField(primary_key=True)
    item_description = models.CharField(max_length=255)
    category = models.CharField(max_length=100, null=True, blank=True)
    manufacturer = models.ForeignKey(
        Manufacturer, on_delete=models.RESTRICT, db_column='ManufacturerID'
    )
    contract = models.ForeignKey(
        Contract, on_delete=models.RESTRICT, db_column='ContractID'
    )
    model = models.CharField(max_length=100, null=True, blank=True)
    finish_size = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        db_table = 'tbl_Items'
        verbose_name = 'Item'
        verbose_name_plural = 'Items'

    def __str__(self):
        return self.item_description


class Order(models.Model):
    order_id = models.AutoField(primary_key=True)
    item = models.ForeignKey(
        Item, on_delete=models.RESTRICT, db_column='ItemID'
    )
    vendor = models.ForeignKey(
        Vendor, on_delete=models.RESTRICT, db_column='VendorID'
    )
    quantity = models.IntegerField(null=True, blank=True)
    fiscal_year = models.SmallIntegerField(null=True, blank=True)
    quote_amount = models.DecimalField(
        max_digits=14, decimal_places=2, null=True, blank=True
    )
    list_price = models.DecimalField(
        max_digits=14, decimal_places=2, null=True, blank=True
    )
    discount = models.DecimalField(
        max_digits=10, decimal_places=4, null=True, blank=True
    )

    class Meta:
        db_table = 'tbl_Orders'
        verbose_name = 'Order'
        verbose_name_plural = 'Orders'

    def __str__(self):
        return f'Order #{self.order_id} - {self.item}'