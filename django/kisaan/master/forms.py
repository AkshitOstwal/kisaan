from django import forms
from .models import State, Zone, District
from django.core import validators



class CreateStateForm(forms.ModelForm):
    name = forms.CharField(
        max_length=254,
        widget=forms.TextInput(attrs={'id':'name', 'class':'form-control ', 'placeholder':'name'})
    )

    statecode = forms.CharField(
        max_length=254,
        widget=forms.TextInput(attrs={'id':'statecode', 'class':'form-control ', 'placeholder':'code'})
    )

    active = forms.BooleanField(
        required = False,
        widget=forms.CheckboxInput(attrs={'id':'active', 'class':'form-control js-switch'})
    )

    class Meta():
        model = State
        fields = ('name','statecode','active')


class CreateZoneForm(forms.ModelForm):
    name = forms.CharField(
        max_length=254,
        widget=forms.TextInput(attrs={'id':'zonename', 'class':'form-control ', 'placeholder':'name'})
    )

    zonecode = forms.CharField(
        max_length=254,
        widget=forms.TextInput(attrs={'id':'zonecode', 'class':'form-control ', 'placeholder':'Zone Code'})
    )


    active = forms.BooleanField(
        required = False,
        widget=forms.CheckboxInput(attrs={'id':'activezone', 'class':'form-control js-switch'})
    )

    class Meta():
        model = Zone
        fields = ('name','zonecode','active')

class CreateDistrictForm(forms.ModelForm):
    name = forms.CharField(
        max_length=254,
        widget=forms.TextInput(attrs={'id':'districtname', 'class':'form-control ', 'placeholder':'name'})
    )

    districtcode = forms.CharField(
        max_length=254,
        widget=forms.TextInput(attrs={'id':'districtcode', 'class':'form-control ', 'placeholder':'District Code'})
    )


    active = forms.BooleanField(
        required = False,
        widget=forms.CheckboxInput(attrs={'id':'activedistrict', 'class':'form-control js-switch'})
    )

    class Meta():
        model = District
        fields = ('name','districtcode','active')
