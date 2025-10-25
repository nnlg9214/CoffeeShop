from django.db import models
from django.utils import timezone

# Create your models here.

class Category (models.Model) :
    name = models.CharField(max_length=225)
    description = models.TextField(null=True, blank=True)
    def __str__(self) -> str:
        return self.name

class Product(models.Model) :
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    name = models. CharField(max_length=225)
    description = models.TextField(null=True, blank=True)
    price = models.IntegerField(default=0)
    image = models.ImageField(upload_to='images/products')
    publish_date = models.DateTimeField(default=timezone.now)
    def __str__(self) -> str:
       return self.name
    

class Contact(models.Model):
    name = models.CharField(max_length=200)
    email = models.EmailField(null=True)
    subject = models.CharField(max_length=250,null=True)
    message = models.TextField(null=True)
    created = models.DateTimeField(default=timezone.now,null=True)
    def __str__(self) -> str:
        return self.name
    
class Member(models.Model):
    name = models.CharField(max_length=100,null=True)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=200,null=True)
    avatar = models.ImageField(upload_to='images/avatars', default='images/avatars/noavatar.png')
    created = models.DateTimeField(default=timezone.now,null=True)
    def __str__(self) -> str:
        return self.name
    
