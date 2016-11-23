<?php
    /**
     * 添加php-fpm 用户sudo权限
     * visudo 注释掉 Default requiretty 一行(意思就是sudo默认需要tty终端)
     * @var string
     */
	$file  = 'log.txt';
 	// $de_json =  json_decode(file_get_contents('php://input'), TRUE);
 	$content = json_decode(file_get_contents("php://input"),TRUE);
    if ($content['ref'] == "refs/heads/dev")
	{
		$name = $content['project']['name'];
		$ssh_url = $content['project']['ssh_url'];
		$res = exec("cd /www/".$name.";sudo /usr/bin/git checkout dev;sudo /usr/bin/git pull;");
		// $res = shell_exec("ls");
		// $res = shell_exec("ls -al;whoami;sudo cat /etc/shadow 2>/www/log.txt");
		print_r($res);
	}
	
?>