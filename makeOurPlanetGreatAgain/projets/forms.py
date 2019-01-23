# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import sys
from django import forms
from django.forms.fields import DateField,ChoiceField
from django.forms.models import ModelChoiceField

from projets.models import Projet, Financement, Evaluation

#reload(sys)
#sys.setdefaultencoding('utf-8')

class EvaluationForm(forms.ModelForm):
	note_evaluation = forms.IntegerField(label= 'Note du projet', required=True, widget=forms.NumberInput, min_value = 0, max_value = 5)
	commentaire = forms.CharField(label='Avis sur le projet', required=True, widget=forms.Textarea)
	
	class Meta:
		model = Evaluation
		exclude = ['projet', 'evaluateur', 'date_evaluation']

class ProjetForm(forms.ModelForm):
	titre_projet = forms.CharField(label = 'Titre du projet ', required=True)
	finance_requis_projet = forms.DecimalField(label = 'Financement réquis', required=True, widget=forms.NumberInput)
	description_projet = forms.CharField(label = 'Description ', required=True, widget=forms.Textarea(attrs={'rows':7, 'cols':66}))

	class Meta:
		model = Projet
		exclude = ['auteur_projet', 'date_ajout_projet', 'financement_est_aquis', 'date_acquis_finance']