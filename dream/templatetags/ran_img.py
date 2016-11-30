from django import template
import os
import random

register = template.Library()

@register.simple_tag(name='random')
def random_img():
    print os.getcwd()
    img_list = os.listdir('media/photos')
    length = len(img_list)
    return img_list[random.randint(0,length-1)]
    
