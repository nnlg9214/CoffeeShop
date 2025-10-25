from django.contrib import admin
from app_shop.models import Category, Product
# Register your models here.

# Product

#def apply_discount(model):


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    #list_display=['name','price','publish_date','category']
    list_display=['e_name','price','publish_date','category']
    search_fields = ['name','description','category__name']
    list_filter = ['category','publish_date']
    list_per_page = 10
    #Tên Tiếng Việt
    @admin.display(description='Tên Sản Phẩm')
    def e_name(self,obj):
        return ('%s' % (obj.name))

admin.site.register(Category)
#admin.site.register(Product)
