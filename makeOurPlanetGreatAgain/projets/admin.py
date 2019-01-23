from django.contrib import admin
from .models import Projet, Financement, Evaluation

# Register your models here.

class ProjetAdmin(admin.ModelAdmin):
	list_display = ('titre_projet', 'finance_requis_projet', 'auteur_projet','description_projet', 'financement_est_aquis')
	search_fields = ['titre_projet']

admin.site.register(Projet, ProjetAdmin)

#admin.site.register(Projet)

class FinancementAdmin(admin.ModelAdmin):
	list_display = ('financeur','projet','montant_finance','date_finance')
	search_fields = ['projet']

admin.site.register(Financement, FinancementAdmin)


class EvaluationAdmin(admin.ModelAdmin):
	list_display = ('projet','evaluateur','commentaire','note_evaluation', 'date_evaluation')
	search_fields = ['projet']

admin.site.register(Evaluation, EvaluationAdmin)
