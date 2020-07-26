<?php

/**
 _  \_/ |\ | /¯¯\ \  / /\    |¯¯) |_¯ |¯¯) /¯¯\ |¯¯) |\ |7
 ¯  /¯\ | \| \__/  \/ /--\   |¯¯\ |__ |__) \__/ |¯¯\ | \|Core.
 * @author: Copyright (C) 2020 by Jorge Navarrete (Jekill) developer of xNova Reborn and ParallelGames Leader
 * @link: http://www.xnovarevolution.con.ar

 * @package xNova Reborn
 * @author Jekill <jonavarrete@nauta.cu>, <jn9508@gmail.com>

 * Please do not remove the credits
*/

class ShowLobbyPage{

	public function login($user, $pass, $universe){
		global $db;

		$login = $db->uniquequery("SELECT `id`, `username`, `dpath`, `authlevel`, `id_planet` FROM ".USERS." WHERE `username` = '".$db->sql_escape($user)."' AND `universe` = '".$universe."' AND `password` = '".$pass."';");
			
		if (isset($login)) {
			session_start();
			$SESSION       	= new Session();
			$SESSION->CreateSession($login['id'], $login['username'], $login['id_planet'], $luniv, $login['authlevel'], $login['dpath']);

			redirectTo('game.php');
		}

		return $return;
	}

	public function register($user, $pass, $universe){
		global $db;

		$data = $db->uniquequery("SELECT `id`, `username`, `email`, `password` FROM ".ACCOUNTS." WHERE `username` = '".$db->sql_escape($user)."' AND `password` = '".$pass."';");

		if(!isset($data))
			redirectTo('lobby.php');

		$UserName 	= $data['username'];
		$UserPass 	= $data['password'];
		$UserMail 	= $data['email'];
		$UserIP 	= $_SERVER['REMOTE_ADDR'];
		$UserPlanet	= 'Capital';
		$UserLang 	= 'es';
		$Raza   	= request_var('raza', 0);
		$UserUni 	= $universe;

		$CONF		= $db->uniquequery("SELECT `users_amount`, `initial_fields`, `LastSettedGalaxyPos`, `LastSettedSystemPos`, `LastSettedPlanetPos`, `mail_active`, `mail_use`, `smail_path`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `smtp_ssl`, `smtp_sendmail`, `game_name`, `users_amount`, `metal_basic_income`, `crystal_basic_income`, `deuterium_basic_income`, `max_galaxy`, `max_system`, `max_planets` FROM ".CONFIG." WHERE `uni` = ".$UserUni.";");

		$SQL = "INSERT INTO " . USERS . " SET ";
		$SQL .= "`username` = '".$UserName . "', ";
		$SQL .= "`universe` = '".$UserUni . "', ";
		$SQL .= "`email` = '".$UserMail."', ";
		$SQL .= "`email_2` = '".$UserMail."', ";
		$SQL .= "`lang` = '".$UserLang."', ";
		$SQL .= "`raza` = '".$Raza."', ";
		$SQL .= "`ip_at_reg` = '".$UserIP."', ";
		$SQL .= "`id_planet` = '0', ";
		$SQL .= "`onlinetime` = '".TIMESTAMP."', ";
		$SQL .= "`register_time` = '".TIMESTAMP. "', ";
		$SQL .= "`password` = '".$UserPass."', ";
		$SQL .= "`dpath` = '".DEFAULT_THEME."', ";
		$SQL .= "`darkmatter` = '".$CONF['darkmatter_start']."', ";
		$SQL .= "`uctime`= '0';";
		$db->query($SQL);
		$NewUser = $db->GetInsertID();

		if($CONF['mail_active'] == 1) {
			$MailSubject	= sprintf($LNG['reg_mail_reg_done'], $CONF['game_name']);	
			#$MailRAW		= file_get_contents("./language/".$UserLang."/email/email_reg_done.txt");
			$MailRAW		= $LANG->getMail('email_reg_done');
			$MailContent	= sprintf($MailRAW, $UserName, $CONF['game_name'].' - '.$CONF['uni_name']);
			MailSend($UserMail, $UserName, $MailSubject, $MailContent);
		}
		$LastSettedGalaxyPos = $CONF['LastSettedGalaxyPos'];
		$LastSettedSystemPos = $CONF['LastSettedSystemPos'];
		$LastSettedPlanetPos = $CONF['LastSettedPlanetPos'];
		require_once(ROOT_PATH.'includes/functions/CreateOnePlanetRecord.php');	
		$PlanetID = false;
		
		while ($PlanetID === false) {
			$Planet = mt_rand(1, $CONF['max_planets']);
			$System = mt_rand(1, $CONF['max_system']);
							
			
			if ($LastSettedSystemPos > $CONF['max_system']) {
				$LastSettedGalaxyPos += 1;
				$LastSettedSystemPos = 1;
				$LastSettedPlanetPos = 1;
			} else {
				$LastSettedSystemPos += 1;
				$LastSettedPlanetPos = $Planet;
			}
			
			if($LastSettedGalaxyPos  > $CONF['max_galaxy'])
				$LastSettedGalaxyPos	= 1;
			
			
			$PlanetID = CreateOnePlanetRecord($LastSettedGalaxyPos, $LastSettedSystemPos, $LastSettedPlanetPos, $UserUni, $NewUser, $UserPlanet, true);
		}

		if($PlanetID){
			$SQL = "UPDATE ".USERS." SET ";
			$SQL .= "`id_planet` = '".$PlanetID."', ";
			$SQL .= "`galaxy` = '".$LastSettedGalaxyPos."', ";
			$SQL .= "`system` = '".$LastSettedSystemPos."', ";
			$SQL .= "`planet` = '".$Planet."' ";
			$SQL .= "WHERE ";
			$SQL .= "`id` = '".$NewUser."' ";
			$SQL .= "LIMIT 1;";
			$SQL .= "INSERT INTO ".STATPOINTS." (`id_owner`, `id_ally`, `stat_type`, `universe`, `tech_rank`, `tech_old_rank`, `tech_points`, `tech_count`, `build_rank`, `build_old_rank`, `build_points`, `build_count`, `defs_rank`, `defs_old_rank`, `defs_points`, `defs_count`, `fleet_rank`, `fleet_old_rank`, `fleet_points`, `fleet_count`, `total_rank`, `total_old_rank`, `total_points`, `total_count`) VALUES (".$NewUser.", 0, 1, ".$UserUni.", '".($CONF ['users_amount'] + 1)."', '".($CONF ['users_amount'] + 1)."', 0, 0, '".($CONF ['users_amount'] + 1)."', '".($CONF ['users_amount'] + 1)."', 0, 0, '".($CONF ['users_amount'] + 1)."', '".($CONF ['users_amount'] + 1)."', 0, 0, '".($CONF ['users_amount'] + 1)."', '".($CONF ['users_amount'] + 1)."', 0, 0, '".($CONF ['users_amount'] + 1)."', '".($CONF ['users_amount'] + 1)."', 0, 0);";
			$db->multi_query($SQL);
			
			$from 		= $LNG['welcome_message_from'];
			$Subject 	= $LNG['welcome_message_subject'];
			$message 	= sprintf($LNG['welcome_message_content'], $CONF['game_name']);
			SendSimpleMessage($NewUser, 1, $Time, 1, $from, $Subject, $message);
			
			update_config(array('users_amount' => $CONF['users_amount'] + 1, 'LastSettedGalaxyPos' => $LastSettedGalaxyPos, 'LastSettedSystemPos' => $LastSettedSystemPos, 'LastSettedPlanetPos' => $LastSettedPlanetPos), false, $UserUni);

			session_start();
			$SESSION       	= new Session();
			$SESSION->CreateSession($NewUser, $UserName, $PlanetID, $UserUni);

			redirectTo('game.php');
		}
	}

}