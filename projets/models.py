from django.db import models

# Create your models here.

class Projet(models.Model):
	titre_projet = models.CharField('titre ', max_length=40)
	description_projet = models.CharField('description ', max_length=400)
	objectif_collecte_projet = models.IntegerField("Objectif de la collecte")
