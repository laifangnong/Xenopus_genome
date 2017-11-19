# -*- coding: utf-8 -*-
from selenium import webdriver
import re
import time
import urllib2
import sys,os
import traceback
#python G:/ZGA/step_5.py G:\\ZGA\\step_4\\xs\\ter\\ter_fold_4_5_stage_4_5_fasta_500\\merge_500.fa C:\Users\ALIENWARE\Desktop\
#python step_5.py input_file output_dir
input_file=sys.argv[1]
output_dir=sys.argv[2]
print input_file,output_dir
driver=webdriver.Firefox()
driver.get('http://meme-suite.org/tools/meme-chip')
upload=driver.find_element_by_name('sequences_file')
upload.send_keys(input_file)#\\
link=driver.find_element_by_id("alphabet_custom_off") 
link.click()
#class MEME_chip_UD(self,input_fasta):
link=driver.find_element_by_id("submit_btn") 
link.click()

redirected_url = driver.current_url
tmp_file ='meme-suite.org/opal-jobs/'+str(redirected_url).split('/')[-1]+'/'+str(redirected_url).split('/')[-1]+'.tar.gz'

#opener = urllib2.build_opener()
#request=urllib2.Request(tmp_file)
#response=opener.open(request)
#response.read()
#fsize=dict(response.headers).get('content-length',0)
#print fsize
#fsize=os.path.getsize(tmp_file)
#fsize_new=99999999999
#while fsize ==fsize_new:
#	time.sleep(10)
	#redirected_url = driver.current_url
	#fsize_new = os.path.getsize(tmp_file)
	#request=urllib2.Request(tmp_file)
	#response=opener.open(request)
	#response.read()
	#fsize_new=dict(response.headers).get('content-length',0)
	#print str(redirected_url)
tmp=0
for i in range(1000):
	try:
		if tmp==0:
			redirected_url = driver.current_url
			time.sleep(10)
			tmp_url1='http://'
			tmp_url2='meme-suite.org/opal-jobs/'+str(redirected_url).split('/')[-1].split('=')[-1]
			tmp_url=tmp_url1+tmp_url2
			#print tmp_url
			req=urllib2.Request(tmp_url)
			sock=urllib2.urlopen(req)
			#print urllib2.urlopen(req),'aaa'
			htmlCode = sock.read()
			if 'Done' in htmlCode:
				print htmlCode,'bbb'
				#cmd='wget meme-suite.org/opal-jobs/'+str(redirected_url).split('/')[-1]+'/'+str(redirected_url).split('/')[-1]+'.tar.gz' +' -O '+input_file.split('.')[0]+'.tar.gz'+' -P ' +output_dir
				cmd='wget meme-suite.org/opal-jobs/'+str(redirected_url).split('/')[-1].split('=')[-1]+'/'+str(redirected_url).split('/')[-1].split('=')[-1]+'.tar.gz'
				print cmd
				print os.system(cmd)
				os.system(cmd)
				tmp+=1
			else:
				continue
		elif tmp==1:
			print('complete...^.^!')
			exit()
	#except:
	except urllib2.HTTPError,e:
		print (e.code)
		print (e.reason)
		print ('wait...')
		continue
#except Exception, e:
	#tmp=0
	#continue
    #print 'str(Exception):\t', str(Exception)
    #print 'str(e):\t\t', str(e)
    #print 'repr(e):\t', repr(e)
    #print 'e.message:\t', e.message
    #print 'traceback.print_exc():'; traceback.print_exc()
    #print 'traceback.format_exc():\n%s' % traceback.format_exc()
#redirected_url = driver.current_url#获取当前url
#u'http://meme-suite.org/info/status?service=MEMECHIP&id=appMEMECHIP_4.12.015110814924901972343400'
#meme-suite.org/opal-jobs/appMEMECHIP_4.12.015110814924901972343400/appMEMECHIP_4.12.015110814924901972343400.tar.gz
#wget meme-suite.org/opal-jobs/appMEMECHIP_4.12.015110814924901972343400/appMEMECHIP_4.12.015110814924901972343400.tar.gz -o test.tar.gz -P C:\Users\ALIENWARE\Desktop\
#driver.get(redirected_url)
#upload=driver.find_element_by_name('sequences_file')

#my_url = 'http://meme-suite.org/tools/meme-chip' 
#response = urllib2.urlopen(my_url) 
#print response.geturl()