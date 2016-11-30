# -*- coding:utf8 -*-
from django.conf.urls import url
from . import views
from django.contrib.auth import views as au_view
urlpatterns = [
        url(r'^dream/$',views.getdream,name='index'),  #浏览用户写的dream
        url(r'^pageup/$',views.pageup,name='pageup'),  #转向上一页
        url(r'^pagedown/$',views.pagedown,name='pagedown'), #转向下一页
        url(r'^searchdream/$',views.searchdream,name='searchdream'), #查找dream
        url(r'^writedream/$',views.writedream,name='writedream'),   #写dream
        url(r'^dreamview/$',views.viewdream,name='viewdream'),     #查看单个dream
        url(r'^modifydream/$',views.modifydream,name='modifydream'),#修改dream
        url('^deletedream/$',views.deletedream,name='deletedream'), #删除dream
        url('^comment/$',views.writecomment,name='writedream'),   #评论
        url('^collect/$',views.collect_dream,name='collect'),     #收藏dream
        url('^uncollect/$',views.uncollect_dream,name='uncollect'),  #取消收藏dream
        ]
