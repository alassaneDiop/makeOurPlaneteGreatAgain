from django.shortcuts import render

# Create your views here
from projets.models import Projet

def projet(request):
 projets = Projet.objects.all()
 return render(request,"projets.html",{'projets' : projets})
