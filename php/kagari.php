<?php
/**
# +-----===== [[ Kagari Shell Finder
#  +----===== [[ Codename : Penikung
#   +---===== [[ Version  : 1.8
#    +--===== [[ Author   : shutdown57 a.k.a alinko
#     +-===== [[ linuxcode.org - github.com/alintamvanz
#
*/
class kagari_run{
	public $list_url;
	public $list_shell;
	public $list_grep;

	public function kagari_curl($url,$grep){
		$curl=curl_init();
		$array_curl_kagari = array(
			CURLOPT_RETURNTRANSFER=>true,
			CURLOPT_URL=>$url,
			CURLOPT_HEADER=>false,
			CURLOPT_SSL_VERIFYPEER=>false,
			);
		curl_setopt_array($curl,$array_curl_kagari);
		$exec=curl_exec($curl);
		return preg_match("/". $grep . "/",$exec);
		curl_close($curl);
	}
	public function kagari_banner(){
		@system('clear');
echo "  __  _   ____   ____   ____  ____   ____  \n";
echo " |  |/ ] /    | /    | /    ||    \ |    | \n";
echo " |  ' / |  o  ||   __||  o  ||  D  ) |  |  \n";
echo " |    \ |     ||  |  ||     ||    /  |  |  \n";
echo " |     ||  _  ||  |_ ||  _  ||    \  |  |  \n";
echo " |  .  ||  |  ||     ||  |  ||  .  \ |  |  \n";
echo " |__|\_||__|__||___,_||__|__||__|\_||____| \n";
echo "                                           \n";
echo "+----==== [[ Kagari Shell Finder - PHP Version \n";
echo " +----=== [[ Codename  : Penikung \n";
echo "  +----== [[ Version   : 1.8 \n";
echo "   +----= [[ Author    : shutdown57 a.k.a alinko \n";
}
	public function kagari_ask(){
		echo "kagari_php::TargetFiles      >>"; $this->list_url=trim(fgets(STDIN));
		echo "kagari_php::ListBackdoorName >>"; $this->list_shell=trim(fgets(STDIN));
		echo "kagari_php::SOShell          >>"; $this->list_grep=trim(fgets(STDIN));
		if(empty($this->list_url)||
			empty($this->list_shell)||
			empty($this->list_grep))
		{
			echo "[+] Die You !!! \n";
			echo "[+] Exiting ...\n";
			@system('sleep 1');
			@system('exit 0');
		}
	}
}

$kagari = new kagari_run();

$kagari->kagari_banner();
$kagari->kagari_ask();
if(isset($kagari->list_url)
	|| isset($kagari->list_shell)
	|| isset($kagari->list_grep))
{
if(preg_match("/^http/",$kagari->list_url))
{
	$pisah_kagari = explode(",",file_get_contents($kagari->list_shell));
	foreach($pisah_kagari as $list_shell)
	{
		if($kagari->kagari_curl($kagari->list_url."/".$list_shell,$kagari->list_grep))
		{
			echo "[FOUND][+] ".$kagari->list_url."/".$list_shell."\n";
		}else{
			echo "[DNOUF][-] ".$kagari->list_url."/".$list_shell. "\n";
		}
	}
}else{
	$list_shell = explode(",",file_get_contents($kagari->list_shell));
	$list_url   = explode("\n",file_get_contents($kagari->list_url));
	foreach($list_url as $url)
	{
		foreach($list_shell as $shell)
		{
			if($kagari->kagari_curl($url."/".$shell,$kagari->list_grep))
			{
				echo "[+][FOUND] ".$url."/".$shell. "\n";
			}else{
				echo "[-][DNOUF] ".$url."/".$shell. "\n";
			}
		}
	}
}
}
