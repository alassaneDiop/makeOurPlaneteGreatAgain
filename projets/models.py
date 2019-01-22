from django.db import models

from django.contrib.auth.models import User

from django.db.models.signals import post_save
from django.dispatch import receiver

from django.core.validators import MaxValueValidator

from django.contrib.auth.models import User

# Create your models here.

class Projet(models.Model):
	auteur_projet = models.ForeignKey(User, related_name='auteur', default=1, on_delete=models.CASCADE)
	titre_projet = models.CharField('Titre du projet ', max_length=40)
	finance_requis_projet = models.DecimalField("Financement réquis", default=0.00, max_digits=10, decimal_places=2, blank=True)
	description_projet = models.TextField('Description ', max_length=4000, blank=True)
	date_ajout_projet = models.DateTimeField("Date d'ajout", auto_now_add=True, blank=True)
	financement_est_aquis = models.BooleanField("Financement déjà acquis", blank=False, default=False)
	date_acquis_finance = models.DateTimeField("Date aquisition financement", default=None, blank=True, null=True)

	def __str__(self):
		return self.titre_projet


class Financement(models.Model):
	"""docstring for Financement"""
	projet = models.ForeignKey(Projet, default=1, on_delete=models.CASCADE)
	financeur = models.ForeignKey(User, default=1, on_delete=models.CASCADE)
	montant_finance = models.DecimalField("Montant ", default=0.00, max_digits=10, decimal_places=2, blank=True)
	date_finance = models.DateTimeField("Date du don", auto_now_add=True, blank=True)


class Evaluation(models.Model):
	"""docstring for Evaluation"""
	projet = models.ForeignKey(Projet, default=1, on_delete=models.CASCADE)
	evaluateur = models.ForeignKey(User, default=1, on_delete=models.CASCADE)
	commentaire = models.TextField('Commentaire ', max_length=4000)
	note_evaluation = models.PositiveIntegerField("Note du projet", default=1, validators=[MaxValueValidator(5)])
	date_evaluation = models.DateTimeField("Date d'évaluation", auto_now_add=True, blank=True)

class Like(models.Model):
    """docstring for Like"""
    user = models.ForeignKey(User, default=1, on_delete=models.CASCADE)
    evaluation = models.ForeignKey(Evaluation, default=1, on_delete=models.CASCADE)
    date_like = models.DateTimeField("Date d'évaluation", auto_now_add=True, blank=True)