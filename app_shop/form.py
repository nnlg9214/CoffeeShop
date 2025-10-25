from django import forms

class ContactForm(forms.Form):
    name = forms.CharField(label='Họ và tên', max_length=200, widget=forms.TextInput(attrs={
        "class": "form-control bg-light border-0 px-4",
        "placeholder": "Họ tên",
        "style": "height: 55px;",
        }))
    email = forms.CharField(label='Email', widget=forms.EmailInput(attrs={
        "class": "form-control bg-light border-0 px-4",
        "placeholder": "Email",
        "style": "height: 55px;",
        }))
    subject = forms.CharField(label='Tiêu đề', max_length=250, widget=forms.TextInput(attrs={
        "class": "form-control bg-light border-0 px-4 py-3",
        "placeholder": "Tiêu đề",
        "style": "height: 55px;",
        }))
    message = forms. CharField(label='Nội dung', widget=forms.Textarea(attrs={
        "class":"form-control bg-light border-0 px-4 py-3",
        "rows":"4",
        "placeholder":"Nội dung"
        }))