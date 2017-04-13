#!/usr/bin/python
# +-----===== [[ Kagari Shell Finder
#  +----===== [[ Codename : Penikung
#   +---===== [[ Version  : 1.8
#    +--===== [[ Author   : shutdown57 a.k.a alinko
#     +-===== [[ linuxcode.org - github.com/alintamvanz
#
import os
import re
import pycurl
import StringIO
import string

m="\033[1;31m"
k="\033[1;33m"
h="\033[1;32m"
b="\033[1;34m"
n="\033[0;m"
def file_get_contents_kagari(file):
	with open(file) as f:
		return f.read()

print b+'''
           /\\          
          /  \\
         ------
         |    |              __  _   ____   ____   ____  ____   ____ 
         | /\\ |             |  |/ ] /    | /    | /    ||    \\ |    |
         | || |             |  |  /|  o  ||   __||  o  ||  D  ) |  | 
        /| \\/ |\            |    \\ |     ||  |  ||     ||    /  |  | PythonEdition
     | / |    | \\ |         |     ||  _  ||  |_ ||  _  ||    \\  |  | 
     |/  |  K |  \\|         |  .  ||  |  ||     ||  |  ||  .  \\ |  | 
   | /   | A  |   \\ |       |__|\\_||__|__||___._||__|__||__|\\_||____| DOT PEYE
   |/    |  G |    \\|
   /     | A  |     \\
 |/      |  R |      \\|
 |-------| I  |-------|
         |    |	  '''+m+''' +-------======='''+h+''' [['''+k+''' Kagari Shell Finder '''+b+'''
         | /\\ |    '''+m+'''  +------======'''+h+''' [['''+m+''' Codename :'''+k+''' Penikung '''+b+'''
        /| || |\      '''+m+'''  +-----====='''+h+''' [['''+m+''' Version  :'''+k+''' 1.8 '''+b+'''
      |/ | || | \\|      '''+m+''' +----===='''+h+''' [['''+m+''' Author   :'''+k+''' shutdown57 a.k.a alinko '''+b+'''
      / _| || |_ \         '''+m+''' +---==='''+h+''' [['''+h+''' linuxcode.org - github.com/alintamvanz '''+b+'''
      |/  =||=  \\|

\n
'''+n
print "\n\n"
kagari_url=raw_input("kagari::TargetList    >>")
kagari_lsh=raw_input("kagari::WordlistShell >>")
kagari_grp=raw_input("kagari::SOSHell       >>")
def kagari_curl(url):
	respon = StringIO.StringIO()
	ch 	   = pycurl.Curl()
	ch.setopt(ch.URL,url)
	ch.setopt(ch.FOLLOWLOCATION,1)
	ch.setopt(ch.WRITEFUNCTION,respon.write)
	ch.perform()
	ch.close()
	find_kagari = respon.getvalue()
	obj_kagari = re.search(r''+kagari_grp+'',find_kagari,re.M|re.I)
	if obj_kagari:
		print "[+][FOUND]["+obj_kagari.group()+"] -> "+url
	else:
		print "[-][DNUOF] -> "+url
	
	respon.close()

if not kagari_url or not kagari_grp or not kagari_lsh:
	print "[+] Die You !!!"
	print "Exiting ..."
	os.system('sleep 2')
	clear
	os.system('exit 0')
else:
	text_url = file_get_contents_kagari(kagari_url)
	text_list = file_get_contents_kagari(kagari_lsh)
	url = text_url.split("\n")
	ist = text_list.split("\n") 
	for ori in url:
		for li in ist:
			target = ori+"/"+li
			kagari_curl(target)
