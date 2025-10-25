from django.urls import path
from app_shop.views import *

app_name = 'app_shop'
urlpatterns = [
    path('', trang_chu, name='trang-chu'),
    path('gioi-thieu/',gioi_thieu, name='gioi-thieu'),
    path('lien-he/', lien_he, name='lien-he'),
    path('dang-ky/', dang_ky, name='dang-ky'),
    path('danh-muc/<int:danh_muc_id>/', danh_sach_san_pham, name='danh-sach-san-pham'),
]