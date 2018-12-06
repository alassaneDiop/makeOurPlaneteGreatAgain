from django.conf.urls import url

from karma.views import karma

urlpatterns = [
    url(r'^$', karma, name="karma"),
]
