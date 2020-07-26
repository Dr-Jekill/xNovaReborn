<?php

/**
 _  \_/ |\ | /¯¯\ \  / /\    |¯¯) |_¯ \  / /¯¯\ |  |   |´¯|¯` | /¯¯\ |\ |5
 ¯  /¯\ | \| \__/  \/ /--\   |¯¯\ |__  \/  \__/ |__ \_/   |   | \__/ | \|Core.
 * @author: Copyright (C) 2011 by Brayan Narvaez (Prinick) developer of xNova Revolution
 * @author web: http://www.bnarvaez.com
 * @link: http://www.xnovarev.com

 * @package 2Moons
 * @author Slaver <slaver7@gmail.com>
 * @copyright 2009 Lucky <douglas@crockford.com> (XGProyecto)
 * @copyright 2011 Slaver <slaver7@gmail.com> (Fork/2Moons)
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 1.3 (2011-01-21)
 * @link http://code.google.com/p/2moons/

 * Please do not remove the credits
*/
 
if (isset($_GET['action']) && $_GET['action'] == 'keepalive')
{
	header('Content-Type: image/gif');
	exit("\x47\x49\x46\x38\x39\x61\x01\x00\x01\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x21\xF9\x04\x01\x00\x00\x00\x00\x2C\x00\x00\x00\x00\x01\x00\x01\x00\x00\x02\x02\x44\x01\x00\x3B");
}

define('INSIDE', true );
define('LOGIN', true );

define('ROOT_PATH', str_replace('\\', '/',dirname(__FILE__)).'/');

if(!file_exists(ROOT_PATH.'includes/config.php')) {
	header('Location: install.php?lang=es');
	exit;
}

require(ROOT_PATH . 'includes/common.php');
	
$template	= new template();
$template->cache = false;
$THEME->isHome();
$page = request_var('page', '');
$mode = request_var('mode', '');

switch ($page) {
	case 'lostpassword': 
		if ($mode == "send") {
			$USERmail = request_var('email', '');
			$Universe = request_var('universe', 0);
			$ExistMail = $db->uniquequery("SELECT `username` FROM ".USERS." WHERE `email` = '".$db->sql_escape($USERmail)."' AND `universe` = '".$Universe."';");
			if (empty($ExistMail['username'])) {
				$template->message($LNG['mail_not_exist'], "index.php?page=lostpassword&lang=".$LANG->getUser(), 3, true);
			} else {
				$Caracters = "aazertyuiopqsdfghjklmwxcvbnAZERTYUIOPQSDFGHJKLMWXCVBN1234567890";
				$Count = strlen($Caracters);
				$Taille = 8;
				$NewPass = "";
				for($i = 0; $i < $Taille; $i ++) {
					$CaracterBoucle = rand ( 0, $Count - 1 );
					$NewPass .= substr ( $Caracters, $CaracterBoucle, 1 );
				}

				$MailRAW		= file_get_contents("./language/".$CONF['lang']."/email/email_lost_password.txt");
				$MailContent	= sprintf($MailRAW, $ExistMail['username'], $CONF['game_name'], $NewPass, "http://".$_SERVER['SERVER_NAME'].$_SERVER["PHP_SELF"]);			
			
				$Mail			= MailSend($USERmail, $ExistMail['username'], $LNG['mail_title'], $MailContent);
				
				if(true === true)
				{
					$db->query("UPDATE ".USERS." SET `password` ='" . md5($NewPass) . "' WHERE `username` = '".$ExistMail['username']."' AND `universe` = '".$Universe."';");
					$template->message($LNG['mail_sended'], "./?lang=".$LANG->getUser(), 5, false);
				} else {
					$template->message($LNG['mail_sended_fail'], "./?lang=".$LANG->getUser(), 5, true);
				}
			
			}
		} else {
			$AvailableUnis[$CONF['uni']]	= $CONF['uni_name'].($CONF['game_disable'] == 1 ? $LNG['uni_closed'] : '');
			$Query	= $db->query("SELECT `uni`, `game_disable`, `uni_name` FROM ".CONFIG." WHERE `uni` != '".$UNI."' ORDER BY `uni` ASC;");
			while($Unis	= $db->fetch_array($Query)) {
				$AvailableUnis[$Unis['uni']]	= $Unis['uni_name'].($Unis['game_disable'] == 1 ? $LNG['uni_closed'] : '');
			}
			ksort($AvailableUnis);
			$year = date('Y');
			$asd = "xNova Reborn";
			$template->assign_vars(array(
				'email'				=> $LNG['email'],
				'uni_reg'			=> $LNG['uni_reg'],
				'send'				=> $LNG['send'],
				'AvailableUnis'		=> $AvailableUnis,
				'chose_a_uni'		=> $LNG['chose_a_uni'],
				'lost_pass_title'	=> $LNG['lost_pass_title'],
				'year'		=> $year,
				'asd'	=> $asd,				
			));
			$template->show('lostpassword.tpl');
		}
		break;
	case 'reg' :
		$status = false;
		$error = '';

		if ($CONF['reg_closed'] == 1){
			$year = date('Y');
			$asd = "xNova Reborn";
			$template->assign_vars(array(
				'closed'	=> $LNG['reg_closed'],
				'info'		=> $LNG['info'],
				'year' 		=> $year,
				'asd' 		=> $asd,
			));
			$template->show('registry_closed.tpl');
			exit;
		}
		switch ($mode) {
			case 'send' :
				$UserPass 	= request_var('passwordR', '');
				$UserName 	= request_var('character', '', UTF8_SUPPORT);
				$UserEmail 	= request_var('email', '');
				$agbrules 	= request_var('rgt', '');
				$UserLang 	= request_var('lang', 'es');
					
				$Exist['valid'] = $db->uniquequery("SELECT username, email FROM ".ACCOUNTS." WHERE (username = '".$db->sql_escape($UserName)."' OR email = '".$db->sql_escape($UserEmail)."');");
				
				$error	   .= !ValidateAddress($UserEmail) ? $LNG['invalid_mail_adress'] : '';
				$error	   .= empty($UserName) ? $LNG['empty_user_field'] : '';			
				$error	   .= !isset($UserPass{5}) ? $LNG['password_lenght_error'] : '';										
				$error	   .= $agbrules != 'on' ? sprintf($LNG['terms_and_conditions'], $LANG->getUser()) : '';
				$error    .= (isset($Exist['valid']['username']) && ($UserName == $Exist['valid']['username'])) ? $LNG['user_already_exists'] : '';
				$error    .= (isset($Exist['valid']['email'])) && ($UserEmail == $Exist['valid']['email']) ? $LNG['mail_already_exists'] : '';
				
				if (!CheckName($UserName))
					$error .= (UTF8_SUPPORT) ? $LNG['user_field_no_space'] : $LNG['user_field_no_alphanumeric'];					
								
				if (!empty($error)) {
					send_for_ajax($error, $status);
				}
				
				$md5newpass = md5($UserPass);

				$SQL = "INSERT INTO ".ACCOUNTS." SET ";
				$SQL .= "`username` = '".$db->sql_escape($UserName)."', ";
				$SQL .= "`email` = '".$db->sql_escape($UserEmail)."', ";
				$SQL .= "`password` = '".$md5newpass."' ";
				$db->query($SQL);
				$NewUser = $db->GetInsertID();

				session_start();
				$SESSION       	= new Session();
				$SESSION->CreateTempSession($NewUser, $UserName, $UserEmail);

				echo json_encode(array(
					'error' => '',
					'status' => true
				));
							
			break;
		}
		break;
	case 'agb' :
		$template->assign_vars(array(
			'agb'				=> $LNG['agb'],
			'agb_overview'		=> $LNG['agb_overview'],
		));
		$template->show('index_agb.tpl');
		break;
	case 'rules' :
		$template->assign_vars(array(
			'rules'				=> $LNG['rules'],
			'rules_overview'	=> $LNG['rules_overview'],
			'rules_info1'		=> sprintf($LNG['rules_info1'], $CONF['forum_url']),
			'rules_info2'		=> $LNG['rules_info2'],
		));
		$template->show('index_rules.tpl');
	break;
	case "banneds":
		$query			= $db->query("SELECT * FROM ".BANNED." ORDER BY `id`;");
		$PrangerList	= array();

		while($u = $db->fetch_array($query))
		{
			$PrangerList[]	= array(
				'player'	=> $u['who'],
				'theme'		=> $u['theme'],
				'from'		=> date(TDFORMAT,$u['time']),
				'to'		=> date(TDFORMAT,$u['longer']),
				'admin'		=> $u['author'],
				'mail'		=> $u['email'],
				'info'		=> sprintf($LNG['bn_writemail'], $u['author']),
			);
		}

		$db->free_result($query);

		$template->assign_vars(array(	
			'PrangerList'				=> $PrangerList,
			'bn_no_players_banned'		=> $LNG['bn_no_players_banned'],
			'bn_exists'					=> $LNG['bn_exists'],
			'bn_players_banned'			=> $LNG['bn_players_banned'],
			'bn_players_banned_list'	=> $LNG['bn_players_banned_list'],
			'bn_player'					=> $LNG['bn_player'],
			'bn_reason'					=> $LNG['bn_reason'],
			'bn_from'					=> $LNG['bn_from'],
			'bn_until'					=> $LNG['bn_until'],
			'bn_by'						=> $LNG['bn_by'],
		));

		$template->show("index_banned.tpl");
	break;
	case "topkb":
		$top = $db->query("SELECT * FROM ".TOPKB." WHERE `universe` = '".$UNI."' ORDER BY gesamtunits DESC LIMIT 100;");
		while($data = $db->fetch_array($top)) {
			$TopKBList[]	= array(
				'result'	=> $data['fleetresult'],
				'time'		=> date(TDFORMAT, $data['time']),
				'units'		=> pretty_number($data['gesamtunits']),
				'rid'		=> $data['rid'],
				'attacker'	=> $data['angreifer'],
				'defender'	=> $data['defender'],
				'result'	=> $data['fleetresult'],
			);
		}
		
		$db->free_result($top);
		
		$template->assign_vars(array(	
			'tkb_units'		=> $LNG['tkb_units'],
			'tkb_datum'		=> $LNG['tkb_datum'],
			'tkb_owners'	=> $LNG['tkb_owners'],
			'tkb_platz'		=> $LNG['tkb_platz'],
			'tkb_top'		=> $LNG['tkb_top'],
			'tkb_gratz'		=> $LNG['tkb_gratz'],
			'tkb_legende'	=> $LNG['tkb_legende'],
			'tkb_gewinner'	=> $LNG['tkb_gewinner'],
			'tkb_verlierer'	=> $LNG['tkb_verlierer'],
			'TopKBList'		=> $TopKBList,
		));
		
		$template->show("index_topkb.tpl");
	break;
	case "faq":
		$LANG->includeLang(array('FAQ'));
		$template->assign_vars(array(
			'FAQList'		=> $LNG['faq'],
			'faq_overview'	=> $LNG['faq_overview'],
		));
		$template->show('index_faq.tpl');
	break;
	default :
		if ($_POST) {
			$status = false;
			$error = '';
			$luser = request_var('username', '', UTF8_SUPPORT);
			$lpass = request_var('password', '', UTF8_SUPPORT);

			$login = $db->uniquequery("SELECT `id`, `username`, `u_id`, `email` FROM ".ACCOUNTS." WHERE (`username` = '".$db->sql_escape($luser)."' OR `email` = '".$db->sql_escape($luser)."') AND `password` = '".md5($lpass)."';");
			
			if (isset($login)) {
				session_start();
				$SESSION       	= new Session();
				$SESSION->CreateTempSession($login['id'], $login['username'], $login['email']);

				$status = true;
			} else {
				$error = 'Datos incorrectos';
			}

			echo json_encode(array(
				'error' => $error,
				'status' => $status
			));
		} else {
			$AvailableUnis[$CONF['uni']]	= $CONF['uni_name'].($CONF['game_disable'] == 1 ? $LNG['uni_closed'] : '');
			$Query	= $db->query("SELECT `uni`, `game_disable`, `uni_name` FROM ".CONFIG." WHERE `uni` != '".$UNI."' ORDER BY `uni` ASC;");
			while($Unis	= $db->fetch_array($Query)) {
				$AvailableUnis[$Unis['uni']]	= $Unis['uni_name'].($Unis['game_disable'] == 1 ? $LNG['uni_closed'] : '');
			}
			ksort($AvailableUnis);
			$Code	= request_var('code', 0);
			if(!empty($Code)) {
				$template->assign_vars(array(
					'code'					=> $LNG['login_error_'.$Code],
				));
			}
			$year = date('Y');
			$asd = "xNova Reborn";
			$template->assign_vars(array(
				'AvailableUnis'			=> $AvailableUnis,
				'welcome_to'			=> $LNG['welcome_to'],
				'server_description'	=> sprintf($LNG['server_description'], $CONF['game_name']),
				'server_infos'			=> $LNG['server_infos'],
				'login'					=> $LNG['login'],
				'login_info'			=> sprintf($LNG['login_info'], $LANG->getUser()),
				'user'					=> $LNG['user'],
				'userR'					=> $LNG['userR'],
				'pass'					=> $LNG['pass'],
				'lostpassword'			=> $LNG['lostpassword'],
				'register_now'			=> $LNG['register_now'],
				'screenshots'			=> $LNG['screenshots'],
				'chose_a_uni'			=> $LNG['chose_a_uni'],
				'universe'			 	=> $LNG['universe'],
				'year'				    => $year,
				'asd'                   => $asd,
				'email_reg'				=> $LNG['email_reg'],
				'raza_reg'              => $LNG['raza_reg'],
				'raza_0'                => $LNG['raza_0'],
				'raza_1'                => $LNG['raza_1'],
			));
			$template->show('index_body.tpl');
		}
	break;
}


function send_for_ajax($error, $status){
	echo json_encode(array(
		'error' => $error,
		'status' => $status
	));
	exit;
}
?>