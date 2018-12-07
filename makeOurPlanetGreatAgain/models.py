from django.db import models


class Auteur(models.Model):
	nom_auteur = models.CharField('Nom ', max_length=40)
	prenom_auteur = models.CharField('Prenom ', max_length=40)
	niveau_karma = models.IntegerField("Niveau karma")