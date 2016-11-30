# -*- coding:utf-8 -*-
from django import forms
from .models import Chat
from django.contrib.auth.models import User

class ChatForm(forms.ModelForm):
    receiver = forms.ModelChoiceField(widget=forms.HiddenInput(),queryset=User.objects.all())
    content = forms.CharField(widget=forms.TextInput(attrs={}),max_length=300,label=u'想和我说什么')

    class Meta:
        model = Chat
        fields = ['receiver','content']

