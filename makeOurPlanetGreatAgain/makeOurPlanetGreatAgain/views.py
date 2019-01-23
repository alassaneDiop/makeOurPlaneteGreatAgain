from django.conf import settings

from django.shortcuts import render
from django.template import Context



def about(request):
	return render(request, "about.html")


def privacyPolicy(request):
	return render (request, "privacy_policy.html")
     

