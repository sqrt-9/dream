# -*- coding:utf8 -*-
"""myweb URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.contrib import admin
from webuser import views
from django.views.static import serve
from django.conf.urls.static import static
from . import settings

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$',views.index,name='index'),  #主页
    url(r'',include('webuser.urls')),     
    url(r'',include('dream.urls')),
    url(r'',include('webchat.urls')),
    url(r'^staticfiles/(?P<path>.*)$',serve,{'document_root':settings.STATICFILES_DIRS,'show_indexes':True}),  #静态文件路径
]
urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
