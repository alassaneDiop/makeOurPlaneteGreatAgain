from django.contrib.syndication.views import Feed

from django.urls import reverse

from projets.models import Projet, Financement, Evaluation

class ProjectsFeed(Feed):
	title = "Les projets recents"
	description = "Brèves description des projets récemments publié et en attentes de financement"
	#description_template = "project_feed.html"
	link = "/feeds/"

	def items(self):
		return Projet.objects.order_by('-date_ajout_projet')[:9]

	def item_title(self, item):
		return item.titre_projet

	def item_description(self, item):
		return "<strong> Auteur: "+item.auteur_projet.username+"</strong> <br />"+item.description_projet[0:400]

	def item_link(self, item):
		return reverse('project_info', args=[item.pk])