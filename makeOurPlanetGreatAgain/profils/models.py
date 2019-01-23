#!/usr/bin/env python
# -*- coding: utf-8 -*- 

from django.db import models
from django.contrib.auth.models import User

from django.db.models.signals import post_save
from django.dispatch import receiver

# Create your models here.
class Profil(models.Model):
    user = models.OneToOneField(User, related_name='utilisateur', on_delete=models.CASCADE)
    adress_profil = models.CharField(max_length=30, blank=True)
    is_auteur_profil = models.BooleanField("Est un auteur", blank=False, default=True)
    is_evaluateur_profil = models.BooleanField("Est un évaluateur", blank=False, default=False)
    is_financeur_profil = models.BooleanField("Est un financeur", blank=False, default=False)

    def __str__(self):
    	return self.user.username
