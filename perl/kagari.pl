#!/usr/bin/perl

# +-----===== [[ Kagari Shell Finder
#  +----===== [[ Codename : Penikung
#   +---===== [[ Version  : 1.8
#    +--===== [[ Author   : shutdown57 a.k.a alinko
#     +-===== [[ linuxcode.org - github.com/alintamvanz
#

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
           /\\          
          /  \\
         ------
         |    |              __  _   ____   ____   ____  ____   ____ 
         | /\\ |             |  |/ ] /    | /    | /    ||    \\ |    |
         | || |             |  |  /|  o  ||   __||  o  ||  D  ) |  | 
        /| \\/ |\             |    \\ |     ||  |  ||     ||    /  |  | 
     | / |    | \\ |         |     ||  _  ||  |_ ||  _  ||    \\  |  | 
     |/  |  K |  \\|         |  .  ||  |  ||     ||  |  ||  .  \\ |  | 
   | /   | A  |   \\ |       |__|\\_||__|__||___._||__|__||__|\\_||____|
   |/    |  G |    \\|
   /     | A  |     \\
 |/      |  R |      \\|
 |-------| I  |-------|
         |    |	  $m +-------=======$h [[$k Kagari Shell Finder $b
         | /\\ |    $m  +------======$h [[$m Codename :$k Penikung $b
        /| || |\      $m  +-----=====$h [[$m Version  :$k 1.8 $b
      |/ | || | \\|      $m +----====$h [[$m Author   :$k shutdown57 a.k.a alinko $b
      / _| || |_ \         $m +---===$h [[$h linuxcode.org - github.com/alintamvanz $b
      |/  =||=  \\|

\n
}
}
sub a_kagari{

	print($h."kagari:".$b."wordlistTarget".$n." >>");
	$t=<STDIN>;
	chomp($t);
	print($h."kagari:".$b."wordlistShell".$n." >>");
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
open(OPENA,"<$w")or die($m."CAN'T OPEN FILES -> $w".$n);
open(OPENB,"<$t")or die($m."CAN'T OPEN FILES -> $t ".$n);
@netnot=split(",",<OPENA>);
@crot=split(",",<OPENB>);
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
