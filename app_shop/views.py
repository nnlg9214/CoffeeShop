from django.shortcuts import render, HttpResponse
from datetime import datetime
from app_shop.models import Category, Product, Contact
from app_shop.form import ContactForm

# Create your views here.
ds_danh_muc = Category.objects.all()
def trang_chu(request):
    return render(request,'index.html', {
        'ds_danh_muc':ds_danh_muc,
    })

def gioi_thieu(request):
    return render(request,'about.html', {
        'ds_danh_muc':ds_danh_muc,
    })

def lien_he(request):
    form_lienhe = ContactForm()
    thong_bao = ''
    if request.GET.get('name'):
        ho_ten = request.GET.get('name')
        email = request.GET.get('email')
        tieu_de = request.GET.get('subject')
        message = request.GET.get('message')
        Contact.objects.create(name=ho_ten, email=email, subject=tieu_de, message= message)
        
        #thông báo kết quả
        thong_bao = '''<div class="alert alert-success" role="alert">
                    Đã gửi thông tin thành công!!!!
                    </div>'''

    return render(request,'contact.html', {
        'ds_danh_muc':ds_danh_muc,
        'form_lien_he': form_lienhe,
        'thong_bao': thong_bao,
    })

def dang_ky(request):
    form_lienhe = ContactForm()
    thong_bao = ''
    if request.GET.get('name'):
        ho_ten = request.GET.get('name')
        email = request.GET.get('email')
        tieu_de = request.GET.get('subject')
        message = request.GET.get('message')
        Contact.objects.create(name=ho_ten, email=email, subject=tieu_de, message= message)
        
        #thông báo kết quả
        thong_bao = '''<div class="alert alert-success" role="alert">
                    Đã gửi thông tin thành công!!!!
                    </div>'''

    return render(request,'contact.html', {
        'ds_danh_muc':ds_danh_muc,
        'form_lien_he': form_lienhe,
        'thong_bao': thong_bao,
    })

def danh_sach_san_pham(request,danh_muc_id):
    danh_muc = Category.objects.get(id=danh_muc_id)
    ds_san_pham = Product.objects.filter(category_id=danh_muc_id)
    return render(request,'category.html', {
        'ds_danh_muc':ds_danh_muc,
        'danh_muc01':danh_muc,
        'ds_san_pham':ds_san_pham,
    })
