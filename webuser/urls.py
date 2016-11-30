# -*- coding:utf8 -*-
from django.conf.urls import url
from . import views
from django.contrib.auth import views as au_view
urlpatterns = [
        url(r'^login/$',views.weblogin,name='weblogin'),  #登录
        url(r'^register/$',views.register,name='register'),  #注册
        url(r'^logout/$',au_view.logout,{'next_page':'/dream'},name='logout'), #注销登录
        url(r'^webuser/$',views.webuser,name='webuser'),    #用户信息页面
        url(r'^chpwd/$',views.chpwd,name='changepassword'), #修改密码
        url(r'^chemail/$',views.chemail,name='changeemail'),#修改邮箱
        url(r'^uploadheadimg/$',views.uploadheadimg,name='uploadheadimg'),  #上传头像
        url(r'^writedreamlist/$',views.write_dream_list,name='writedreamlist'), #查看用户写的dream
        url(r'^collectdreamlist/$',views.collect_dream_list,name='collectdreamlist'), #查看用户收藏的dream
        ]
