from django.contrib import admin

from django.db import models
from django.contrib.auth.models import User

from profils.models import *

# Register your models here.

class ProfilAdmin(admin.ModelAdmin):
	list_display = ('user','is_auteur_profil', 'is_evaluateur_profil', 'is_financeur_profil', 'adress_profil')

admin.site.register(Profil, ProfilAdmin)