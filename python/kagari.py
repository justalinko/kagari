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

m="\033[1;31m"
k="\033[1;33m"
h="\033[1;32m"
b="\033[1;34m"
n="\033[0;m"

print n+"  __  _   ____   ____   ____  ____   ____  "
print m+" |  |/ ] /    | /    | /    ||    \ |    | "
print k+" |  ' / |  o  ||   __||  o  ||  D  ) |  |  "
print h+" |    \ |     ||  |  ||     ||    /  |  |  "
print b+" |     ||  _  ||  |_ ||  _  ||    \  |  |  "
print n+" |  .  ||  |  ||     ||  |  ||  .  \ |  |  "
print m+" |__|\_||__|__||___,_||__|__||__|\_||____| Python " 
print k+"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
print m+"+----===="+n+" [["+h+" Kagari Shel"+b+"l Finder - Python Version "+n
print m+" +----==="+n+" [["+h+" Codename  :"+b+" Penikung "+n
print m+"  +----=="+n+" [["+h+" Version   :"+b+" 1.8 "+n
print m+"   +----="+n+" [["+h+" Author    :"+b+" shutdown57 a.k.a alinko "+n
print "\n\n"
kagari_url=raw_input("kagari::TargetList    >>")
kagari_lsh=raw_input("kagari::WordlistShell >>")
kagari_grp=raw_input("kagari::SOSHell       >>")

respon = StringIO.StringIO()
ch 	   = pycurl.Curl()
ch.setopt(ch.URL,kagari_url)
ch.setopt(ch.FOLLOWLOCATION,1)
ch.setopt(ch.WRITEFUNCTION,respon.write)
ch.perform()
ch.close()
find_kagari = respon.getvalue()
obj_kagari = re.search(r'shell',find_kagari,re.M|re.I)
if obj_kagari:
	print "[+] Found "+obj_kagari.group()
else:
	print "[-] Not FOund"

respon.close()
