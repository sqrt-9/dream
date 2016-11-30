#-*-coding:utf-8 -*-
from django.shortcuts import render,redirect
from django.http import HttpResponse
from .models import Dream,DreamComment,UserAction,CollectDream
from django.core.paginator import Paginator,InvalidPage,EmptyPage,PageNotAnInteger
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from .forms import DreamForm,CommentForm
from django.contrib import messages
from webuser.models import UserInfo
from django.utils import timezone
import json
from webuser.views import get_online_ips_count
# Create your views here.

#最初使用Paginator来进行分页，需要查询数据库所有数据，后来改成只需要从数据库读取当前页面需要的数据即可
def getdream(request):
    ONE_PAGE_OF_DATA = 10
    page = int(request.GET.get('page',1))
    start = (page-1)*ONE_PAGE_OF_DATA
    end = start + ONE_PAGE_OF_DATA
    dreamlist = Dream.objects.all().order_by('-publish_time')[start:end]
    dreamcounts = Dream.objects.count()
    allpage = dreamcounts / ONE_PAGE_OF_DATA
    remaindream = dreamcounts % ONE_PAGE_OF_DATA
    online_ips_count = get_online_ips_count()
    register_num = len(UserInfo.objects.all())
    if remaindream > 0:
        allpage += 1
    return render(request,"dream/dream.html",locals())

def pageup(request):
    if 'page' in request.GET:
        page = int(request.GET.get('page').strip())
        page -= 1
        return redirect('/dream?page={0}'.format(page))

def pagedown(request):
    if 'page' in request.GET:
        page = int(request.GET.get('page').strip())
        page += 1
        return redirect('/dream?page={0}'.format(page))

def searchdream(request):
    if 'search' in request.GET:
        querystring = request.GET.get('search').strip()
        if len(querystring) == 0:
            return redirect('/dream')
        else:
            dreamlist = Dream.objects.filter(content__contains=querystring)|Dream.objects.filter(short_description__contains=querystring)
        return render(request,'dream/searchresult.html',locals())

@login_required
def writedream(request):
    if request.method == 'POST':
        form = DreamForm(request.POST)
        if not form.is_valid():
            return render(request,'webuser/writedream.html',{'form':form})
        else:
            short_description = form.cleaned_data.get('short_description')
            content = form.cleaned_data.get('content')
            dream = Dream(short_description=short_description,content=content,publish_time=timezone.now())
            dream.user=request.user
            dream.save()
            action = UserAction(action=1,user=request.user,dream=dream)
            action.save()
            return render(request,'webuser/writedream.html',messages.add_message(request,messages.SUCCESS,u'发表成功'))
    else:
        form = DreamForm()
        return render(request,'webuser/writedream.html',{'form':form})

@login_required
def modifydream(request):
    short_description = request.POST.get('short_description',None)
    content = request.POST.get('content',None)
    print content
    dream_id = request.POST.get('dream_id')
    dream = Dream.objects.get(pk=dream_id)
    dream.short_description = short_description
    dream.content = content
    dream.modify_time = timezone.now()
    dream.save()
    return HttpResponse(json.dumps({"content":content,'short_description':short_description}),content_type="application/json")


@login_required
def deletedream(request):
    if 'id' in request.GET:
        querystring = request.GET.get('id').strip()
        if len(querystring) == 0:
            pass
        else:
            Dream.objects.get(pk=int(querystring)).delete()
        return redirect('/dream')

def viewdream(request):
    if 'id' in request.GET:
        querystring = request.GET.get('id').strip()
        if len(querystring) == 0:
            return redirect('dream')
        else:
            dream = Dream.objects.get(pk=int(querystring))
        form = CommentForm(initial={'dream':dream})
        commentlist = DreamComment.objects.filter(dream__id=int(querystring))
        if request.user.is_authenticated():
            collect = CollectDream.objects.filter(user=request.user,dream=dream)
        else:
            collect = None
        flag = True if collect else False
        return render(request,'dream/dreamview.html',locals())

@login_required
def writecomment(request):
    user = request.user
    if request.is_ajax():
        content = request.POST.get('content',None)
        dream_id = request.POST.get('dream_id',None)
        parent_comment_id = request.POST.get('parent_comment_id',None)
        if content:
            dream = Dream.objects.get(pk=dream_id)
            if parent_comment_id:
                parent_comment=DreamComment.objects.get(pk=parent_comment_id)
            else:
                parent_comment = None
            comment = DreamComment(content=content,dream=dream,user=user,parent_comment=parent_comment)
            comment.save()
            dream.comment_num += 1
            dream.save()
            action = UserAction(action=2,user=user,dream=dream,comment=comment)
            action.save()
            return HttpResponse(json.dumps({"content":content}),content_type="application/json")
        else:
            return HttpResponse(status=400)
    '''
    if request.method == 'POST':
        form = CommentForm(request.POST)
        if form.is_valid():
            user = request.user
            dreamcomment = DreamComment()
            dreamcomment.user = request.user
            dreamcomment.dream = form.cleaned_data.get('dream')
            dreamcomment.content = form.cleaned_data.get('content')
            dreamcomment.save()
            return HttpResponse(json.dumps(locals()))
        else:
            dream = form.cleaned_data.get('dream')
            return render(request,'dream/dreamview.html',{'form':form})
    else:
        form = CommentForm()
        return render(request,'dream/dreamview.html',{'form':form})
'''

@login_required
def collect_dream(request):
    if request.user.is_authenticated():
        user = request.user
        dreamid = request.POST.get('dream_id').strip()
        dream = Dream.objects.get(pk=int(dreamid))
        collect = CollectDream(user=user,dream=dream)
        collect.save()
        return HttpResponse(json.dumps({"collect":'success'}),content_type='application/json')

@login_required
def uncollect_dream(request):
    user = request.user
    dreamid = request.POST.get('dream_id').strip()
    dream = Dream.objects.get(pk=int(dreamid))
    uncollect = CollectDream.objects.filter(dream=dream,user=user)
    uncollect.delete()
    return HttpResponse(json.dumps({"uncollect":"success"}),content_type='application/json')
    
