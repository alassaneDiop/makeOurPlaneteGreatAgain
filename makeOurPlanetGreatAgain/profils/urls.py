from django.conf.urls import url
#from .views import login_view
from .views import login_profil

urlpatterns = [
    url(r'$', login_profil, name = "authentication"),
]
