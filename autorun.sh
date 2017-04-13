#!/bin/bash

# +-----===== [[ Kagari Shell Finder
#  +----===== [[ Codename : Penikung
#   +---===== [[ Version  : 1.8
#    +--===== [[ Author   : shutdown57 a.k.a alinko
#     +-===== [[ linuxcode.org - github.com/alintamvanz
#

KAGARI_WORK_DIR="/opt/kagari"

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
    "run-perl" )
perl $KAGARI_WORK_DIR/kagari2.pl
        ;;
    "run-php" )
php $KAGARI_WORK_DIR/php/kagari.php
        ;;
    "start" )
perl $KAGARI_WORK_DIR/kagari2.pl
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
