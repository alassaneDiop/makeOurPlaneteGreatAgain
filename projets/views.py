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
from projets.models import Projet, Financement, Evaluation

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
	return render(request,"info_project.html",
		{'project':project,
		'sum_finance': sum_collecte,
		'sum_requis': project.finance_requis_projet
		})

@login_required
def add_evaluation(request, id_projet):
	context = RequestContext(request)
	
	project = get_object_or_404(Projet, pk=id_projet)

	if request.method == 'POST':
		form = EvaluationForm(request.POST)
		
		if form.is_valid():
			evaluation = form.save(commit=False)
			
			evaluation.note_evaluation = request.POST.get('note_evaluation') and request.POST.get('note_evaluation') or 0
			evaluation.commentaire = request.POST.get('commentaire') and request.POST.get('commentaire') or 0

			evaluation.projet = project
			evaluation.evaluateur = request.user

			# Enregistrer la nouvelle instance de notre model.
			evaluation.save()
			return HttpResponseRedirect('/projets/%s/detail_projet/'%id_projet)
		else:
			print(form.errors)
	else:
		form = EvaluationForm()
		if request.user.is_authenticated:
			return render(request, 'evaluation_edit.html', {'form': form, 'project': project}, context)
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
		return True
	else:
		return False


