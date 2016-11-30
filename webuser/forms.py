#-*- coding: UTF-8 -*-
from django import forms
from django.contrib.auth.models import User
from django.contrib import auth

class LoginForm(forms.ModelForm):
    username = forms.CharField(widget=forms.TextInput(attrs={"class":"form-control"}),max_length=30,required=True,label=u'昵称',error_messages={'required':u'取个名字^_^'})
    password = forms.CharField(widget=forms.PasswordInput(attrs={"class":"form-control"}),label=u'密码',error_messages={'required':u'密码是必须滴'},required=True)

    class Meta:
        model = User
        fields = ['username','password']
        exculde = ['last_login','date_joined','email','confirm_password']
        
    def __init__(self,*args,**kwargs):
        super(LoginForm,self).__init__(*args,**kwargs)

    #表单提交时验证用户名和密码是否正确
    def clean(self):
        #super(LoginForm,self).clean()
        username = self.cleaned_data.get('username')
        password = self.cleaned_data.get('password')
        if username and password:
            self.user_cache = auth.authenticate(username=username,password=password)
            if  self.user_cache is None:
                self._errors['username'] = self.error_class([u'好像不对啊！'])
        return self.cleaned_data

class SignUpForm(forms.ModelForm):
    username = forms.CharField(widget=forms.TextInput(attrs={"class":"form-control"}),max_length=30,label=u'昵称',required=True,help_text='')
    password =  forms.CharField(widget=forms.PasswordInput(attrs={"class":"form-control"}),label=u'密码',required=True)
    confirm_password = forms.CharField(widget=forms.PasswordInput(attrs={"class":"form-control"}),label=u'确认密码',required=True)
    email = forms.EmailField(widget=forms.EmailInput(attrs={"class":"form-control"}),max_length=75,label=u'邮箱',required=True)
    
    class Meta:
        model =User
        exclude = ['last_login','date_joined']
        fields = ['username','password','confirm_password','email']

    def __init__(self,*args,**kwargs):
        super(SignUpForm,self).__init__(*args,**kwargs)
            
    def clean(self):
        super(SignUpForm,self).clean()
        password = self.cleaned_data.get('password')
        confirm_password = self.cleaned_data.get('confirm_password')
        if password and password != confirm_password:
            self._errors['password'] = self.error_class([u'密码不匹配'])
        return self.cleaned_data

class ChPwdForm(forms.ModelForm):
    id = forms.CharField(widget=forms.HiddenInput()) #用户的id
    old_pwd = forms.CharField(widget=forms.PasswordInput(attrs={}),label=u'旧密码',required=True)
    new_pwd = forms.CharField(widget=forms.PasswordInput(),label=u'新密码',required=True)
    confirm_pwd = forms.CharField(widget=forms.PasswordInput(),label=u'确认新密码',required=True)

    class Meta:
        model = User
        fields = ['id','old_pwd','new_pwd','confirm_pwd']

    def clean(self):
        super(ChPwdForm,self).clean()
        old_pwd = self.cleaned_data.get('old_pwd')
        new_pwd = self.cleaned_data.get('new_pwd')
        confirm_pwd = self.cleaned_data.get('confirm_pwd')
        id = self.cleaned_data.get('id')
        user = User.objects.get(pk=id)
        if not user.check_password(old_pwd):
            self._errors['old_pwd'] = self.error_class([u'旧密码不对'])
        if new_pwd and new_pwd != confirm_pwd:
            self._errors['new_pwd'] = self.error_class([u'密码不一致']) 
        return self.cleaned_data

class ChEmailForm(forms.ModelForm):
    id = forms.CharField(widget=forms.HiddenInput())
    old_email = forms.CharField(widget=forms.EmailInput(attrs={'class':'form-control'}),label=u'旧邮箱',required=True)
    new_email = forms.CharField(widget=forms.EmailInput(attrs={'class':'form-control'}),label=u'新邮箱',required=True)

    class Meta:
        model = User
        fields= ['id','old_email','new_email']
        
    def clean(self):
        super(ChEmailForm,self).clean()
        old_email = self.cleaned_data.get('old_email')
        new_email= self.cleaned_data.get('new_email')
        id = self.cleaned_data.get('id')
        user = User.objects.get(pk=id)
        if not old_email == user.email:
            self._errors['old_email'] = self.error_class([u'旧邮箱不对'])
        return self.cleaned_data

class ImageUploadForm(forms.Form):
    image = forms.ImageField()
