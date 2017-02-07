#!/usr/bin/perl

#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!#!
#! Codename   :  rewrite                            #!
#! Author     : alinko (shutdown57)                 #!
#! Version    : v1.2
#! alinkoproject.com - linuxcode.org                #!
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
||~     _
||~    | \\
||~   _|  \\______________________________________
||~  - ______        ________________          \\_`,
||~-(_______            -=    -=      KAGARI       )
||~         `--------=============----------------'   -SHELL-BACKDOOR-FINDER
||~    $m                 -   - $n  X$m Codename :$h rewrite $b
||~    $m                -   -  $n  X$m Version  :$h 1.2 $b
||~    $m     `   . .  -  -     $n  X$m Author   :$h alinko $b
||~    $m      .*` .* ;`*,`.,   $n  X$k linuxcode.org $m dracos-linux.org $b
||~    $m       `, ,`.*.*. *    $n  X $b
||~__________$m *  * ` ^ * $b  ____________________________


\n
}
}
sub a_kagari{

	print($h."kagari:".$b."wordlistTarget".$n." >>");
	$t=<STDIN>;
	chomp($t);
	print($h."kagari:".$b."wordlistPassword".$n." >>");
	$w=<STDIN>;
	chomp($w);
	print($h."kagari:".$b."SOShell".$n." >>");
	$c=<STDIN>;
	chomp($c);
	if($t and $w and $c){
print qq{
$h [ $n+$h ] $k FILE TARGET    : $n $t
$h [ $n+$h ] $k FILE WORDLISTS : $n $w
$h [ $n+$h ] $k REGULER EXPR   : $n $c
};
print $m."[ ~ ] $n $b Loading please wait...\n\n".$n;
open(IKEH,"<$w")or die($m."CAN'T OPEN FILES -> $w".$n);
open(KIMOCHI,"<$t")or die($m."CAN'T OPEN FILES -> $t ".$n);
@netnot=split(",",<IKEH>);
@crot=split(",",<KIMOCHI>);
foreach $xt(@crot){
foreach $s(@netnot){
$target=$xt."/".$s;
$klok=strftime $m."%H".$n.":".$k."%M".$n.":".$h."%S".$n, gmtime;
my $req=HTTP::Request->new(GET=>$target);
my $ua=LWP::UserAgent->new();
$ua->timeout(30);
my $cekx=$ua->request($req);
if($cekx->content =~ /$c/){
print("[$klok] [".$h."FOUND".$n."] $target \n");
}else{
print("[$klok] [".$m."NOFUN".$n."] $target \n");
}
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
