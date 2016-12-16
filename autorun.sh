#!/bin/bash

#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!
#! Codename   :  rewrite                            #!
#! Author     : alinko (shutdown57)                 #!
#! Version    : v1.2                                #!
#! alinkoproject.com - linuxcode.org                #!
#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!

KAGARI_WORK_DIR="/home/kagari/kagari/"

case $1 in
	"-h" )
cat $KAGARI_WORK_DIR/help.txt > /dev/null 2>&1
    if [[ "$?" -eq "0" ]]; then
    	more $KAGARI_WORK_DIR/help.txt
    else
    	echo "[!] File $KAGARI_WORK_DIR/help.txt Was missing.."
    fi
		;;
    "--help" )
cat $KAGARI_WORK_DIR/help.txt > /dev/null 2>&1
    if [[ "$?" -eq "0" ]]; then
    	more $KAGARI_WORK_DIR/help.txt
    else
    	echo "[!] File $KAGARI_WORK_DIR/help.txt Was missing.."
    fi
        ;;
    "run" )
perl $KAGARI_WORK_DIR/kagari.pl
        ;;
    "start" )
perl $KAGARI_WORK_DIR/kagari.pl
        ;;
    "--uninstall" )
if [[ `whoami` == "root" ]]; then
	
which kagari > /dev/null 2>&1
if [[ "$?" -eq "0" ]]; then
	echo "[-] UNINSTALL   : Removing $KAGARI_WORK_DIR/kagari.pl ..."
	rm $KAGARI_WORK_DIR/kagari.pl
	sleep 1
	echo "[-] UNINSTALL   : Removing /usr/bin/kagari ..."
	rm /usr/bin/kagari
	sleep 1
	echo "[-] UNINSTALL   : Removing $KAGARI_WORK_DIR/*"
	rm $KAGARI_WORK_DIR/*
	rmdir $KAGARI_WORK_DIR
	echo "[-] UNINSTALLED.."
else
	echo "[!] Kagari not installed."
fi
else
	echo "[+] You must be root to run this command."
fi
        ;;
        *)
more $KAGARI_WORK_DIR/help.txt
esac
