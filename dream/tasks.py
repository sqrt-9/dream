from celery import task
import urllib,re,sys,os 
@task
def get_bing_backphoto():
    if (os.path.exists('./media/photos')== False):  
        os.mkdir('./media/photos')    
    for i in range(0,1000):  
        url = 'http://cn.bing.com/HPImageArchive.aspx?format=js&idx='+str(i)  +'&n=1&nc=1361089515117&FORM=HYLH1'  
        html = urllib.urlopen(url).read().decode('utf8')  
        if html == 'null':  
            print ('open & read bing error!')  
            sys.exit(-1)  
        reg = re.compile('"url":"(.*?)","urlbase"',re.S)  
        text = re.findall(reg,html)  
        print (text)
        #http://s.cn.bing.net/az/hprichbg/rb/LongJi_ZH-CN8658435963_1366x768.jpg  
        for imgurl in text:  
            right = imgurl.rindex('/')  
            name = imgurl.replace(imgurl[:right+1],'')  
            savepath = './media/photos/'+ name  
            urllib.urlretrieve(imgurl, savepath)  
            print (name + ' save success!') 

