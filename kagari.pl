#!/usr/bin/perl

#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!
#! c0ded by : shutdown57                            #!
#! alinkoproject.com - linuxcode.org                #!
#! license : http://alinkoproject.com/license.txt   #!
#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!

use HTTP::Request;
use LWP::UserAgent;
use LWP::Simple;
use POSIX qw(strftime);

#warna
$m="\033[1;31m";
$h="\033[1;32m";
$b="\033[1;34m";
$k="\033[1;33m";
$n="\033[1;0m";
sub a_banner{
	system('clear');
	print qq{$b
    #    #   ##    ####    ##   #####  # 
    #   #   #  #  #    #  #  #  #    # # 
    ####   #    # #      #    # #    # # 
    #  #   ###### #  ### ###### #####  #$n 
    #   #  #    # #    # #    # #   #  # 
    #    # #    #  ####  #    # #    # #$m
+----------------------------------------------+
|  +----------------------------------------+  |
|  |   $h   ~[ SHELL BACKDOOR FINDER ]~   $n    |  |
| $b | Script by : shutdown57 ~ linuxcode.org | $n |
|  |       $k  copyright (c) 2016       $n      |  |
|  +----------------------------------------+  |
+----------------------------------------------+
\n
}
}
sub a_kagari{

	print($h."kagari:".$b."target".$n." >>");
	$t=<STDIN>;
	chomp($t);
	if($t !~ "/^http:|^https:/"){
		$t="http://".$t;
	}
	print($h."kagari:".$b."wordlist".$n." >>");
	$w=<STDIN>;
	chomp($w);
	print($h."kagari:".$b."SOShell".$n." >>");
	$c=<STDIN>;
	chomp($c);
	if($t and $w and $c){
print qq{
$h [ $n+$h ] $k TARGET    : $n $t
$h [ $n+$h ] $k WORDLISTS : $n $w
$h [ $n+$h ] $k SOSHELL   : $n $c
};
print $m."[ ~ ] $n $b Loading please wait...\n\n".$n;
open(IKEH,"<$w")or die($m."CAN'T OPEN FILES -> $w".$n);
@netnot=split(",",<IKEH>);
foreach $s(@netnot){
$target=$t."/".$s;
$klok=strftime $m."%H".$n.":".$k."%M".$n.":".$h."%S".$n, gmtime;
my $req=HTTP::Request->new(GET=>$target);
my $ua=LWP::UserAgent->new();
$ua->timeout(30);
my $cekx=$ua->request($req);
if($cekx->content =~ /$c/){
print("[$klok] [".$h."FOUND".$n."] $target \n");
}else{
print("[$klok] [".$m."NFUND".$n."] $target \n");
}
}  
print("Do You Want Exit? y/n :".$m);
$jwb=<STDIN>;
chomp($jwb);
if($jwb eq "N" or $jwb eq "n"){
a_banner();
a_kagari();
}else{
print $m."[  EXIT ] $h Exiting program...\n ~> $b Thanks For Using~ $n \n";
system('exit');
}
}else{
print($m."[".$n."!!".$m."] $n Die  You!\n\n");
}
}
a_banner();
a_kagari();