import sys
from django import forms
from django.forms.fields import DateField,ChoiceField, MultipleChoiceField
from django.forms.models import ModelChoiceField

from django.contrib.auth.models import User
from profils.models import Profil

class UserForm(forms.ModelForm):
	class Meta:
		model = User
		fields = ('first_name', 'last_name', 'email')
