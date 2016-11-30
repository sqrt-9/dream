# -*- coding:utf8 -*-
from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.core.mail import send_mail

# Create your models here.

class UserInfo(models.Model):
    user = models.OneToOneField(User)   
    register_day = models.DateTimeField(auto_now=True,blank=True)
    headimg = models.ImageField(upload_to='./headimg/',default='default.jpg') #有默认头像

    def __unicode__(self):
        return self.user.username

#本来思路是在注册用户时通过signals来实现邮件发送，但是在修改头像时，Webuser.save()也会出发signals，暂时没解决
'''
def sendemail(sender,**kwargs):
    #print kwargs
    if "instance" in kwargs:
        obj = kwargs.get("instance")            
        print obj.email
        send_mail('hello','Welcome to dream web','sqrt_9@163.com',[obj.email])
post_save.connect(sendemail,sender=Webuser)
'''        
        

