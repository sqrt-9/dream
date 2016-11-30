#-*- coding:utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from webuser.models import UserInfo
# Create your models here.

class Dream(models.Model):
    user = models.ForeignKey(User)
    publish_time = models.DateTimeField(null=True,blank=True)  #发布日期
    modify_time = models.DateTimeField(auto_now=True,null=True,blank=True) #修改日期
    short_description = models.CharField(max_length=100,null=True,blank=True) #简短描述
    content=models.TextField(max_length=5000)  #dream内容
    comment_num = models.IntegerField(default=0)    #评论数

    def __unicode__(self):
        return self.short_description

    #返回dream发布者的头像
    def headimg(self):
        headimg = UserInfo.objects.get(user_id=self.user.id).headimg 
        return headimg

#dream评论
class DreamComment(models.Model):
    dream = models.ForeignKey(Dream)    
    parent_comment = models.ForeignKey('self',blank=True,null=True,related_name='p_comment')    #父级评论，实现多级评论
    user = models.ForeignKey(User)
    content = models.CharField(max_length=1000,null=True,blank=True)
    publish_time = models.DateTimeField(auto_now=True,null=True,blank=True)

    def __unicode__(self):
        return self.content


#记录用户行为，目前只记录两个行为
class UserAction(models.Model):
    user_action=(
            (1,u'写dream'),
            (2,u'写comment'),
            )
    user = models.ForeignKey(User)
    dream = models.ForeignKey(Dream)
    comment = models.ForeignKey(DreamComment,null=True,blank=True)
    action_time = models.DateTimeField(auto_now=True,null=True,blank=True)
    action = models.IntegerField(choices=user_action,verbose_name='用户行为',null=True,blank=True)

#记录用户收藏的的dream
#考虑有没有更好的数据库设计方式
class CollectDream(models.Model):
    user = models.ForeignKey(User)
    dream = models.ForeignKey(Dream)

    

