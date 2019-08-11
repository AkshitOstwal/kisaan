from django import forms
from django.core import validators

from .models import User
from django.contrib.auth import get_user_model


class SignupForm(forms.ModelForm):

    first_name = forms.CharField(
        max_length=254,
        widget=forms.TextInput(attrs={'id':'inputFirstname', 'class':'form-control form-control-rounded', 'placeholder':'First Name'})
    )

    last_name = forms.CharField(
        max_length=254,
        widget=forms.TextInput(attrs={'id':'inputLastname', 'class':'form-control form-control-rounded', 'placeholder':'Last Name'})
    )

    email = forms.EmailField(
        max_length=254,
        widget=forms.EmailInput(attrs={'id':'login_email', 'class':'form-control form-control-rounded', 'placeholder':'Your Email'})
    )
    password = forms.CharField(
        max_length=254,
        widget=forms.PasswordInput(attrs={'id':'login_password', 'class':'form-control form-control-rounded', 'placeholder':'New Password'})
    )

    class Meta():
        model = get_user_model()
        fields = ('first_name','last_name','email','password')
