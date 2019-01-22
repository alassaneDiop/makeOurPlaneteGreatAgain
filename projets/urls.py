from django.conf.urls import url

from . import views
from projets.views import *

urlpatterns = [
    #url(r'^$',projet, name = "projets"),
    url(r'^$', views.IndexView.as_view(), name='index_projet'),
    url(r'all/$', views.AllProjectView.as_view(), name='all_project'),
    url(r'new/$', add_projet, name='new_project'),
    #url(r'^produits/(?P<id_produit>[0-9]+)/$', produit_info, name="produit_info"),
    url(r'(?P<id_projet>[0-9]+)/detail_projet/$', project_info, name="project_info"),
    url(r'(?P<id_projet>[0-9]+)/evaluation/$', add_evaluation, name="add_evaluation"),
]
