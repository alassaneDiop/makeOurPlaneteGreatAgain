from django.conf.urls import url
from .views import projet

urlpatterns = [
    url(r'^$',projet, name = "projets"),
]
