from django import forms
from django.shortcuts import get_object_or_404
from django.forms.fields import DateField,ChoiceField, MultipleChoiceField
from django.forms.models import ModelChoiceField

#from makeOurPlanetGreatAgain.models import Auteur

'''
class AuteurAuthenticationForm(forms.ModelForm):
	nom_auteur = forms.CharField(max_length=40, label='Login')
	prenom_auteur = forms.CharField(max_length=40, label='Mot de passe')

	class Meta:
		model = Auteur
		exclude = ['nom_auteur', 'prenom_auteur', 'niveau_karma' ]

'''