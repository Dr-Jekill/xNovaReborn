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

define('INSIDE', true );
define('LOBBY', true );

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



$template->assign_vars(array(
	'user5' 	=> $USER['username'],
	'accounts'	=> get_accounts(),
	'servers'	=> server_list()
));

$template->show('lobby/lobby.tpl');


function get_accounts(){
	global $db;

	$cuentas = $db->query("SELECT u.`username`, u.`universe`, u.`ally_name`, u.`id` as u_id, s.`total_rank`, un.`uni_name` as u_name, un.`fleet_speed`, un.`resource_multiplier` FROM ".USERS." as u, ".STATPOINTS." as s, ".CONFIG." as un WHERE u.`id`=s.`id_owner` AND u.`universe`=un.`uni` AND email='".$_SESSION['email']."'");
	$accounts = array();

	while($account_data = $db->fetch_array($cuentas)){
		$accounts[$account_data['universe']]	= $account_data;
		$accounts[$account_data['universe']]['category']	= category($account_data['fleet_speed'], $account_data['resource_multiplier']);
	}

	return $accounts;
}

function server_list(){
	global $db;
	$cuentas = $db->query("SELECT u.`username`, un.`uni` as u_id FROM ".USERS." as u, ".CONFIG." as un WHERE u.`universe`=un.`uni` AND u.email='".$_SESSION['email']."'");

	$and = "";

	while($account_data = $db->fetch_array($cuentas)){
		$and .= "AND uni!=".$account_data['u_id']." ";
	}


	$servidores = $db->query("SELECT `uni_name`, `uni`, `fleet_speed`, `resource_multiplier`, `server_created` FROM ".CONFIG." WHERE game_disable=0 ".$and);

	$servers = array();

	while($server_data = $db->fetch_array($servidores)){
		$servers[$server_data['uni']]	= $server_data;

		$servers[$server_data['uni']]['category']	= category($server_data['fleet_speed'], $server_data['resource_multiplier']);
		$servers[$server_data['uni']]['days']	= get_days($server_data['server_created']);
	}

	return $servers;
}

function category($fleet, $resources){
	$fleet = $fleet / 2500;
	if($fleet > $resources){
		$return = 'agresivo';
	}elseif($fleet < $resources){
		$return = 'pacifivo';
	}else{
		$return = 'equilibrado';
	}

	return $return;
}

function get_days($day){
	$time = TIMESTAMP - $day;

	$days = ((($time / 60) / 60) / 24);

	return floor($days);
}


include_once(ROOT_PATH . 'includes/pages/class.ShowLobbyPage.php');

$lobby = new ShowLobbyPage;

$transaction = request_var('transaction', '');
switch ($transaction) {
	case 'login':
		$user = $_SESSION['email'];
		$universe = request_var('universe', '');

		$acc = $db->uniquequery("SELECT `username`,`password`,`universe` FROM ".USERS." WHERE email='".$user."' AND universe='".$universe."' ");
		if($acc){
			$lobby->login($acc['username'], $acc['password'], $acc['universe']);

		}

	break;
	case 'register':
		$user = $_SESSION['email'];
		$universe = request_var('universe', '');

		$acc = $db->uniquequery("SELECT `username`,`password` FROM ".ACCOUNTS." WHERE email='".$user."'");

		if($acc){
			$lobby->register($acc['username'], $acc['password'], $universe);
		}
	break;
}