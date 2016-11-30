# -*- coding:utf-8 -*-
from django.shortcuts import render,redirect,render_to_response
from .models import UserInfo
from django.contrib.auth.models import User
from django.contrib.auth import authenticate,login
from .forms import LoginForm,SignUpForm,ChPwdForm,ChEmailForm,ImageUploadForm
from dream.models import Dream,DreamComment,UserAction
from webchat.models import Chat
from webchat.forms import ChatForm
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from  PIL import Image
import time
from django.core.cache import cache
from django.core.mail import send_mail
# Create your views here.

#获取当前网站在线人数
def get_online_ips_count():
    online_ips = cache.get("online_ips",[])
    if online_ips:
        online_ips = cache.get_many(online_ips).keys()
        return len(online_ips)
    return 0

#主页
def index(request):
    return render(request,'index.html')

#用户登录
def weblogin(request):
    if request.user.is_authenticated():
        return redirect('/dream')
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username,password=password)
            login(request,user)
            return redirect('/dream')
        else:
            return render(request,'webuser/login.html',{'form':form})
    else:
        form = LoginForm()
        return render(request,'webuser/login.html',{'form':form})

#用户注册
def register(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if not form.is_valid():
            return render(request,'webuser/register.html',{'form':form})
        else:
            username = form.cleaned_data.get('username')
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password')
            user = User.objects.create_user(username=username,password=password,email=email)
            webuser = UserInfo(user=user)
            webuser.save()
            #sendemail(email)
            user = authenticate(username=username,password=password)
            login(request,user)
            return redirect('/dream')
    else:
        form = SignUpForm()
        return render(request,'webuser/register.html',{'form':form})

#发送邮件
def sendemail(email):
    print email
    send_mail('hello','Welcome to dream web','sqrt_9@163.com',[email])


#查看用户信息
def webuser(request):
    if 'id' in request.GET:
        querystring = request.GET.get('id').strip()
        if len(querystring) == 0:
            return redirect('index')
        else:
            user = User.objects.get(pk=int(querystring))
            headimg = UserInfo.objects.get(user=user).headimg
            action_list = UserAction.objects.filter(user=user).order_by('-action_time')
            #dream = Dream.objects.filter(user_id=int(querystring))
            #dreamcomment = DreamComment.objects.filter(user_id=int(querystring))
            #comment_dream_id = get_comment_dream_id(dreamcomment)
            #comment_dream = get_comment_dream(comment_dream_id)
            #if comment_dream == None:
            #    dynamic = dream
            #else:
            #    dynamic = dream|comment_dream
            return render(request,'webuser/webuser.html',locals())

#修改密码
@login_required
def chpwd(request):  
    user = request.user
    if request.method == 'POST':
        form = ChPwdForm(request.POST)
        if form.is_valid():
            new_pwd = form.cleaned_data.get('new_pwd')
            user.set_password(new_pwd)
            user.save()
            login(request,user)
            return render(request,'webuser/chpwd.html',messages.add_message(request,messages.SUCCESS,u'密码修改成功'))
    else:
        form = ChPwdForm(instance=user)
        return render(request,'webuser/chpwd.html',{'form':form})

#修改email
@login_required
def chemail(request):
    user = request.user
    if request.method == 'POST':
        form = ChEmailForm(request.POST)
        if form.is_valid():
            new_email = form.cleaned_data.get('new_email')
            user.email = new_email
            user.save(update_fields=['email'])
            return render(request,'webuser/changeemail.html',messages.add_message(request,messages.SUCCESS,u'邮箱修改成功'))
    else:
        form = ChEmailForm(instance=user)
        return render(request,'webuser/changeemail.html',{'form':form})

#上传用户头像,对用户上传图片进行了缩小处理
@login_required
def uploadheadimg(request):
    if request.method == "POST":
        form = ImageUploadForm(request.POST,request.FILES)
        if form.is_valid():
            photo = form.cleaned_data['image']
            img = Image.open(photo)
            img = img.resize((40,40),Image.ANTIALIAS)
            imgtime = request.user.username+str(time.time()).split('.')[0]
            img_last = str(photo).split('.')[-1]
            imgname = '%s.%s'%(imgtime,img_last)
            img.save('media/headimg/'+imgname)
            user = UserInfo.objects.get(user=request.user)
            user.headimg = 'headimg/'+ imgname
            user.save()
            return redirect('/webuser/?id={0}'.format(request.user.id))
    else:
        form = ImageUploadForm()
    return render(request,'webuser/upload.html',{'form':form})

#查看用户写的dream
def write_dream_list(request):
    if 'user_id' in request.GET:
        querystring = request.GET.get('user_id').strip()
        user = User.objects.get(pk=int(querystring))
        dream_list = Dream.objects.filter(user=user)
        return render(request,'webuser/writedreamlist.html',locals())
    else:
        return redirect('/dream')

#查看用户收藏的dream
def collect_dream_list(request):
    if 'user_id' in request.GET:
        querystring = request.GET.get('user_id').strip()
        user = User.objects.get(pk=int(querystring))
        dream_list = user.collectdream_set.all()
        return render(request,'webuser/collectdreamlist.html',locals())
    else:
        return redirect('/dream')
