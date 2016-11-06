# kagari
Kagari adalah software di tullis dengan perl yang berfungsi untuk menemukan shell backdoor di suatu website
<pre>

+---------------------------+ 
| RUNNER AND INSTALLER      | 
+---------------------------+ 
root@kagari:~# git clone https://github.com/alintamvanz/kagari.git && cp kagari/kagari.pl /usr/bin/kagari && chmod+x /usr/bin/kagari && kagari

# OR

root@kagari:~#  git clone https://github.com/alintamvanz/kagari.git
root@kagari:~# cp kagari/kagari.pl /usr/bin/kagari
root@kagari:~# chmod +x /usr/bin/kagari
root@kagari:~# kagari


    #    #   ##    ####    ##   #####  # 
    #   #   #  #  #    #  #  #  #    # # 
    ####   #    # #      #    # #    # # 
    #  #   ###### #  ### ###### #####  # 
    #   #  #    # #    # #    # #   #  # 
    #    # #    #  ####  #    # #    # #
+----------------------------------------------+
|  +----------------------------------------+  |
|  |      ~[ SHELL BACKDOOR FINDER ]~       |  |
|  | Script by : shutdown57 ~ linuxcode.org |  |
|  |         copyright (c) 2016             |  |
|  +----------------------------------------+  |
+----------------------------------------------+


kagari:target:>>http://google.com (set target)
kagari:wordlists:>>wordlist_shell.txt (file wordlist shell,dipisahkan dengan "koma" (,))
kagari:SOShell:>>home|password|shell|b374k|c99 (string khusus yang ada di shell/mencirikan shell tersebut)
</pre>
