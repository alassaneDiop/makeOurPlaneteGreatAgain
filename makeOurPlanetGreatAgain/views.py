from django.views.generic import TemplateView, ListView, DetailView

from django.shortcuts import get_object_or_404, render
from django.http import HttpResponse, HttpResponseRedirect
from django.urls import reverse
from django.views import generic
from django.template import Context, RequestContext

from .forms import *
from .models import Auteur



def home(request):
	return render(request, "home.html")

def auteur_authentication(request):
	context = RequestContext(request)

	if request.method == 'POST':
		form = AuteurAuthenticationForm(request.POST)
		
		if form.is_valid():
			
			nom_auteur = request.POST.get('nom_auteur') and request.POST.get('nom_auteur') or 0
			prenom_auteur = request.POST.get('prenom_auteur') and request.POST.get('prenom_auteur') or 0
			
			if(get_auth_client(login_client, password_client) is True):
				request.session['username'] = login_client
				return HttpResponseRedirect('/')
			else:
				form = AuteurAuthenticationForm()
				return render(request, 'auteur_authentication.html', {'form': form}, context)
		else:
			print(form.errors)
	else:
		form = AuteurAuthenticationForm()
		return render(request, 'auteur_authentication.html', {'form': form}, context)