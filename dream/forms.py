#-*- coding:utf-8 -*-
from django import forms
from .models import Dream,DreamComment

class DreamForm(forms.ModelForm):
    short_description = forms.CharField(widget=forms.TextInput(attrs={}),max_length=100,label=u'简短描述')
    content = forms.CharField(widget=forms.Textarea(attrs={}),max_length=5000,label=u'具体详情')
    class Meta:
        model = Dream
        fields = ['short_description','content']

class CommentForm(forms.ModelForm):
    parent_comment = forms.ModelChoiceField(widget=forms.HiddenInput(),queryset=DreamComment.objects.all())
    dream = forms.ModelChoiceField(widget=forms.HiddenInput(attrs={'id':'id_dream'}),queryset=Dream.objects.all())
    content = forms.CharField(widget=forms.TextInput(attrs={'id':"id_content"}),max_length=1000)

    class Meta:
        model = DreamComment
        fields = ['dream','content']
