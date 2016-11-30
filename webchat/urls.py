from django.conf.urls import url
from . import views
from django.contrib.auth import views as au_view
urlpatterns = [
        url(r'^sendchat/$',views.sendmsg,name='chat'),
        ]
