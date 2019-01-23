#!/usr/bin/env python
# -*- coding: utf-8 -*- 

from django.utils import timezone

from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login

from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect

from django.template import Context, RequestContext
from django.template.loader import get_template

from django.views import generic
from django.views.generic import ListView

from projets.forms import ProjetForm, EvaluationForm
from django.db.models import Sum
from projets.models import Projet, Financement, Evaluation, Like
from profils.models import Profil

import decimal,datetime


#@login_required
class IndexView(generic.ListView):
	template_name = 'index_projet.html'
	context_object_name = 'last_project'
	
	def get_queryset(self):
		"""Renvoie le dernier projet ajouté"""
		projet = Projet.objects.filter(financement_est_aquis=True).order_by('-date_acquis_finance').last()
		return projet

class AllProjectView(generic.ListView):
	template_name = 'all_project.html'
	context_object_name = 'projects'
	
	def get_queryset(self):
		return Projet.objects.all().order_by('-date_ajout_projet')

@login_required
def project_info(request, id_projet):
	project=get_object_or_404(Projet, pk=id_projet)
	sum_finance = project.financement_set.aggregate(Sum('montant_finance'))
	sum_collecte = sum_finance['montant_finance__sum']
	likes = Like.objects.all()
	if request.method == 'POST':
		if "id_eval" in request.POST:
			id_eval = request.POST.get('id_eval')
			evaluation = Evaluation.objects.get(pk = id_eval)
			user = request.user
			try:
			    existe_like = Like.objects.get(evaluation_id = id_eval,like_authenticate_user_id = user)
			except Like.DoesNotExist:
			    existe_like = None

			if existe_like is None:
				# Save Like
				#evaluation = Evaluation.objects.get(pk = id_eval)
				like = Like()
				like.evaluation = evaluation
				like.like_authenticate_user = user
				like.save()
			#Mise à jour du profil evaluateur
			count_all_evaluation_for_user = evaluation.evaluateur.evaluation_set.count()
			if count_all_evaluation_for_user > 1:
				#evaluation = Evaluation.objects.get(pk = id_eval)
				all_evaluations_for_user = evaluation.evaluateur.evaluation_set.all()
				sum_like = 0
				for evaluation in all_evaluations_for_user:
					sum_like += evaluation.like_set.count()

				if sum_like > 1:
					user_evaluateur_profil = Profil.objects.get(user = evaluation.evaluateur)
					user_evaluateur_profil.is_evaluateur_profil = True
					user_evaluateur_profil.save()
				return render(request,"info_project.html", {'sum_like':sum_like,'project':project,'sum_finance': sum_collecte,'sum_requis': project.finance_requis_projet})
			else:
				return render(request,"info_project.html", {'project':project,'sum_finance': sum_collecte,'sum_requis': project.finance_requis_projet})		
		







		elif "donnation" in request.POST:
			donnation = request.POST.get('donnation')
			try:
				finnancement_user = Financement.objects.get(financeur_id = request.user.id, projet_id = id_projet)
			except Financement.DoesNotExist:
				finnancement_user = None
			if finnancement_user is None:
				# Save financement
				finnancement = Financement()
				finnancement.projet = project
				finnancement.financeur = request.user
				finnancement.montant_finance = donnation
				finnancement.save()
				# update profil pour confirmer que l'utilisateur à bien le profil financeur maintenant
				profil_user = Profil.objects.get(user = request.user)
				profil_user.is_financeur_profil = True
				profil_user.save()
			else: 
				finnancement_user.montant_finance = finnancement_user.montant_finance + decimal.Decimal(donnation)
				finnancement_user.date_finance = datetime.datetime.now()
				finnancement_user.save()
			return render(request,"info_project.html", {'project':project,'donnation':donnation,'sum_finance': sum_collecte,'sum_requis': project.finance_requis_projet})
			#return render(request,"info_project.html", {'project':project,'finnancement_user':finnancement_user})
		else:
			return render(request,"info_project.html", {'project':project,'sum_finance': sum_collecte,'sum_requis': project.finance_requis_projet})
	else:
		return render(request,"info_project.html", {'project':project,'sum_finance': sum_collecte,'sum_requis': project.finance_requis_projet})

	# project=get_object_or_404(Projet, pk=id_projet)
	# sum_finance = project.financement_set.aggregate(Sum('montant_finance'))
	# sum_collecte = sum_finance['montant_finance__sum']
	# return render(request,"info_project.html",
	# 	{'project':project,
	# 	'sum_finance': sum_collecte,
	# 	'sum_requis': project.finance_requis_projet
	# 	})

@login_required
def add_evaluation(request, id_projet):
	context = RequestContext(request)
	
	project = get_object_or_404(Projet, pk=id_projet)

	if request.method == 'POST':
		form = EvaluationForm(request.POST)
		
		if form.is_valid():
			user_evaluateur = request.user
			evaluation_user = Profil.objects.get(user = user_evaluateur)
			
			evaluation = form.save(commit=False)
			evaluation.commentaire = request.POST.get('commentaire') and request.POST.get('commentaire') or 0
			if evaluation_user.is_evaluateur_profil:
				evaluation.note_evaluation = request.POST.get('note_evaluation') and request.POST.get('note_evaluation') or 0
			else:
				evaluation.note_evaluation = 0
			evaluation.projet = project
			evaluation.evaluateur = request.user

			# Enregistrer la nouvelle instance de notre model.
			evaluation.save()
			return HttpResponseRedirect('/projets/%s/detail_projet/'%id_projet)
		else:
			print(form.errors)
	else:
		if request.user.is_authenticated:
			form = EvaluationForm()
			return render(request, 'evaluation_edit.html', {'form':form,'project': project}, context)	
		else:
			return HttpResponseRedirect('/account/authentication')

@login_required
def add_projet(request):
	context = RequestContext(request)
	
	if request.method == 'POST':
		form = ProjetForm(request.POST)
		
		if form.is_valid():
			projet = form.save(commit=False)
			projet.titre_projet = request.POST.get('titre_projet') and request.POST.get('titre_projet') or 0
			projet.finance_requis_projet = request.POST.get('finance_requis_projet') and request.POST.get('finance_requis_projet') or 0
			projet.description_projet = request.POST.get('description_projet') and request.POST.get('description_projet') or 0

			projet.auteur_projet = request.user

			# Enregistrer la nouvelle instance de notre model.
			projet.save()
			return HttpResponseRedirect('/projets/all/')
	else:
		form = ProjetForm()
		if request.user.is_authenticated:
			return render(request, 'new_projet.html', {'form': form}, context)
		else:
			return HttpResponseRedirect('/account/authentication')

@login_required
def projet_is_financed(request, id_projet):
	context = RequestContext(request)
	project = get_object_or_404(Projet, pk=id_projet)


def cheick_level_for_eval(auth_user):
    if auth_user.evaluation_set.count() > 2:
    	evaluations = auth_user.evaluation_set.all()
    	sum_like = 0
    	for evaluation in evaluations:
    		sum_like += evaluation.like_set.count()

    	if sum_like >= 2:
        	return True
    	else:
        	return False


