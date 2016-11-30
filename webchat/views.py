from django.shortcuts import render,redirect
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from .forms import ChatForm
from django.http import Http404,HttpResponse
from .models import Chat
from dwebsocket import require_websocket,accept_websocket

# Create your views here.
'''
@login_required
def sendchat(request):
    if request.method == 'POST':
        form = ChatForm(request.POST)
        if form.is_valid():
            sender = request.user
            chat = Chat()
            chat.sender = sender
            chat.receiver = form.cleaned_data.get('receiver')
            chat.content = form.cleaned_data.get('content')
            chat.save()
            return redirect(u'/webuser/?id={0}'.format(chat.receiver.id))
        else:
            raise Http404
            return render(request,'webuser/webuser.html',locals())
    else:
        form = ChatForm()
        return render(request,'webuser/webuser.html',locals())
'''

@require_websocket
def sendmsg(request):
    message = request.websocket.wait()
    request.websocket.send(message)


@accept_websocket
def lower_case(request):
    if not request.is_websocket():
        message = request.GET['message']
        return HttpResponse(message)
    else:
        for message in request.websocket:
            request.websocket.send(message)
