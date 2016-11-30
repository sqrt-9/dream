#-*- coding:utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Chat(models.Model):
    sender = models.ForeignKey(User,related_name='cs')
    receiver = models.ForeignKey(User,related_name='cr')
    publish_time = models.DateTimeField(auto_now=True,null=True,blank=True)
    content = models.CharField(max_length=300,null=True,blank=True)
    already_read = models.IntegerField(choices=((0,u'未读'),(1,u'已读')),default=0)

    def __unicode__(self):
        return self.content

    

    

