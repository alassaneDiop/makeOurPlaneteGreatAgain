import re

from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login


from django.http import HttpResponse, HttpResponseRedirect

# Create your views here.

@login_required
def login_profil(request):
	return HttpResponseRedirect('/')