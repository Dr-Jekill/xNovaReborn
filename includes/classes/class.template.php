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
 
class template
{
	function __construct()
	{	
		$this->jsscript				= array();
		$this->script				= array();
		$this->vars					= array();
		$this->cache				= false;
		$this->cachedir				= is_writable(ROOT_PATH.'cache/') ? ROOT_PATH.'cache/' : sys_get_temp_dir();
		$this->file					= '';
		$this->cachefile			= '';
		$this->phpself				= '';
		$this->Popup				= false;
		$this->Dialog				= false;
	}
	
	public function render()
	{
		global $CONF;
		require(ROOT_PATH.'includes/libs/Smarty/Smarty.class.php');
		$TMP						= new Smarty();
		$TMP->force_compile 		= false;
		$TMP->compile_dir 			= $this->cachedir;
		$TMP->caching 				= false;
		$TMP->compile_check			= true; #Set false for production!
		$TMP->template_dir 			= $this->template_dir;
		$TMP->assign($this->vars);
		$PAGE						= $TMP->fetch($this->file);
		if($this->cache && $CONF['debug'] == 0)
		{
			file_put_contents($this->cachefile, $PAGE);
		}
		return $PAGE;
	}
	
	public function isDialog() {
		$this->Dialog		= true;
	}
	
	public function getplanets()
	{
		global $USER;
		$this->UserPlanets			= SortUserPlanets($USER);
	}

	public function getmoons($id)
	{
		global $USER;
		$this->UserMoons			= SortUserMoons($USER, $id);
	}
	
	public function loadscript($script)
	{
		$this->jsscript[]			= substr($script, 0, -3);
	}
	
	public function execscript($script)
	{
		$this->script[]				= $script;
	}
		
	public function assign_vars($var = array()) 
	{		
		$this->vars	= array_merge($this->vars, $var);
	}
	
	private function Menus()
	{
		global $PLANET, $LNG, $USER, $CONF, $db, $UNI, $reslist, $resource, $ProdGrid;
		
		//PlanetMenu
		if(empty($this->UserPlanets))
			$this->getplanets();
		
		$this->loadscript("planetmenu.js");
		$this->loadscript("topnav.js");
		$this->execscript("actualizar('metal');");
		$this->execscript("actualizar('crystal');");
		$this->execscript("actualizar('deuterium');");
		$this->execscript("actualizar('norio');");
		$this->execscript("PlanetMenu();");
		$this->phpself	= "?page=".request_var('page', '')."&amp;mode=".request_var('mode', '');
		$PlanetSelect	= array();
		$Scripttime		= array();
		$cpla = 0;

		foreach($this->UserPlanets as $CurPlanetID => $PlanetQuery)
		{
			if(!empty($PlanetQuery['b_building_id']))
			{
				$QueueArray						= explode(";", $PlanetQuery['b_building_id']);
				$ActualCount					= count($QueueArray);
				for ($ID = 0; $ID < $ActualCount; $ID++)
				{
					$ListIDArray						= explode(",", $QueueArray[$ID]);
					
					if($ListIDArray[3] > TIMESTAMP)
						$Scripttime[$PlanetQuery['id']][]	= $ListIDArray[3];
				}
			}

			$derbis	= $PlanetQuery['der_metal'] > 0 || $PlanetQuery['der_crystal'] > 0 || $PlanetQuery['der_norio'] > 0 ? $this->GalaxyRowDebrix($PlanetQuery): false;

			if($PlanetQuery['planet_type']==1){
				$Planetlist[$PlanetQuery['id']]	= array(
					'url'		=> $this->phpself."&amp;cp=".$PlanetQuery['id'],
					'name'		=> $PlanetQuery['name'].(($PlanetQuery['planet_type'] == 3) ? " (".$LNG['fcm_moon'].")":""),
					'image'		=> $PlanetQuery['image'],
					's_image'		=> $PlanetQuery['image'],
					'galaxy'	=> $PlanetQuery['galaxy'],
					'system'	=> $PlanetQuery['system'],
					'planet'	=> $PlanetQuery['planet'],
					'ptype'		=> $PlanetQuery['planet_type'],
					'der_metal'		=> $PlanetQuery['der_metal'],
					'der_crystal'		=> $PlanetQuery['der_crystal'],
					'der_norio'		=> $PlanetQuery['der_norio'],
					'derbis'		=> $derbis,
					'planet_diameter'			=> pretty_number($PlanetQuery['diameter']),
					'planet_field_current' 		=> $PlanetQuery['field_current'],
					'planet_field_max' 			=> CalculateMaxPlanetFields($PlanetQuery),
					'planet_temp_min' 			=> $PlanetQuery['temp_min'],
					'planet_temp_max' 			=> $PlanetQuery['temp_max'],
					'ov_temp_unit'				=> $LNG['ov_temp_unit'],
					'ov_distance_unit'			=> $LNG['ov_distance_unit'],
				);
				$Planetlist[$PlanetQuery['id']]['moon'] = array();

				if($PlanetQuery['id_luna']!=0){

					$this->getmoons($PlanetQuery['id_luna']);

					foreach($this->UserMoons as $CurMoonID => $MoonQuery){

						$tar2 = explode("_",$MoonQuery['image']);
						$derbiss	= $MoonQuery['der_metal'] > 0 || $MoonQuery['der_crystal'] > 0 || $MoonQuery['der_norio'] > 0 ? $this->GalaxyRowDebrix($MoonQuery): false;
						
						$Planetlist[$PlanetQuery['id']]['moon']	= array(
								'id'		=> $MoonQuery['id'],
								'url'		=> $this->phpself."&amp;cp=".$MoonQuery['id'],
								'name'		=> $MoonQuery['name'],
								'image'		=> $MoonQuery['image'],
								's_image'		=> $MoonQuery['image'],
								'galaxy'	=> $MoonQuery['galaxy'],
								'system'	=> $MoonQuery['system'],
								'planet'	=> $MoonQuery['planet'],
								'ptype'		=> $MoonQuery['planet_type'],
								'der_metal'		=> $MoonQuery['der_metal'],
								'der_crystal'		=> $MoonQuery['der_crystal'],
								'der_norio'		=> $MoonQuery['der_norio'],
								'derbis'		=> $derbiss,
								'tipo'			=> $tar2[0],
								'planet_diameter'			=> pretty_number($MoonQuery['diameter']),
								'planet_field_current' 		=> $MoonQuery['field_current'],
								'planet_field_max' 			=> CalculateMaxPlanetFields($MoonQuery),
								'planet_temp_min' 			=> $MoonQuery['temp_min'],
								'planet_temp_max' 			=> $MoonQuery['temp_max'],
								'ov_temp_unit'				=> $LNG['ov_temp_unit'],
								'ov_distance_unit'			=> $LNG['ov_distance_unit'],
						);
					}
				}
				if($PlanetQuery['planet_type']==1)
					$cpla++;
				}
			/*$Planetlist[$PlanetQuery['id']]	= array(
				'url'		=> $this->phpself."&amp;cp=".$PlanetQuery['id'],
				'name'		=> $PlanetQuery['name'].(($PlanetQuery['planet_type'] == 3) ? " (".$LNG['fcm_moon'].")":""),
				'image'		=> $PlanetQuery['image'],
				'galaxy'	=> $PlanetQuery['galaxy'],
				'system'	=> $PlanetQuery['system'],
				'planet'	=> $PlanetQuery['planet'],
				'ptype'		=> $PlanetQuery['planet_type'],
			);*/
			
			$PlanetSelect[$this->phpself."&amp;cp=".$PlanetQuery['id']]	= $PlanetQuery['name'].(($PlanetQuery['planet_type'] == 3) ? " (" . $LNG['fcm_moon'] . ")":"")."&nbsp;[".$PlanetQuery['galaxy'].":".$PlanetQuery['system'].":".$PlanetQuery['planet']."]&nbsp;&nbsp;";
		}
		
			
		if($USER['urlaubs_modus'] == 1) {
			$CONF['metal_basic_income']     = 0;
			$CONF['crystal_basic_income']   = 0;
			$CONF['deuterium_basic_income'] = 0;
			$CONF['norio_basic_income'] = 0;
		}		
		
		if($PLANET['metal'] >= $PLANET["metal_max"]) {
			$cantidad_metal = colorRed(pretty_number($PLANET['metal']));
		} else {
			$cantidad_metal = pretty_number($PLANET['metal']);
		}
		if($PLANET['crystal'] >= $PLANET["crystal_max"]) {
			$cantidad_cristal = colorRed(pretty_number($PLANET['crystal']));
		} else {
			$cantidad_cristal = pretty_number($PLANET['crystal']);
		}
		if($PLANET['deuterium'] >= $PLANET["deuterium_max"]) {
			$cantidad_deuterio = colorRed(pretty_number($PLANET['deuterium']));
		} else {
			$cantidad_deuterio = pretty_number($PLANET['deuterium']);
		}
		if($PLANET['norio'] >= $PLANET["norio_max"]) {
			$cantidad_norio = colorRed(pretty_number($PLANET['norio']));
		} else {
			$cantidad_norio = pretty_number($PLANET['norio']);
		}

		$news = array();

		$db_news = $db->query("SELECT * FROM ".NEWS.""); 

		if($db->num_rows($db_news)>0){
			while ($knew = $db->fetch_array($db_news)) {
				$news[] = array(
					'name'	=> $knew['title'],
					'new'	=> $knew['text'],
					'date'	=> gmdate("d/m/Y",$knew['date']),
				);
			}
		}


		$ranki = '';
		$stats_sql	=	'SELECT DISTINCT s.*, u.id, u.username, u.ally_id, u.ally_name, u.raza FROM '.STATPOINTS.' as s
			INNER JOIN '.USERS.' as u ON u.id = s.id_owner
			WHERE s.`universe` = '.$UNI.' AND s.`stat_type` = 1 '.(($CONF['stat'] == 2)?'AND u.`authlevel` < '.$CONF['stat_level'].' ':'');

		$query = $db->query($stats_sql);
		
		while ($StatRow = $db->fetch_array($query))
		{			
			if($StatRow['username'] == $USER['username']){
				$ranki = $StatRow['total_rank'];
			}
		}
		
		$db->free_result($query);




		$energy_en	   = floor(eval($ProdGrid[4]['formule']['energy']) * ($CONF['resource_multiplier']));
		$energy_en_212 = floor(eval($ProdGrid[212]['formule']['energy']) * ($CONF['resource_multiplier']));
		$energy_en_12  = floor(eval($ProdGrid[12]['formule']['energy']) * ($CONF['resource_multiplier']));
		$energ         = ($energy_en + $energy_en_212 + $energy_en_12)*0.10;


		if($USER['geologe'] >= 1) {
			$metal_produccion    	= floor(eval($ProdGrid[1]['formule']['metal']) * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
			$porcentaje_metal = $metal_produccion * 0.10;
		} else {
			$porcentaje_metal = 0;
		}

		$metal_total		            = $PLANET['metal_perhour'] + $CONF['metal_basic_income'] * $CONF['resource_multiplier'] + $porcentaje_metal;
		
		if($USER['geologe'] >= 1) {
			$cristal_produccion =  floor(eval($ProdGrid[2]['formule']['crystal'])   * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
			$porcentaje_cristal = $cristal_produccion * 0.10;	
		} else {
			$porcentaje_crista = 0;
		}

		$en = 0;

			foreach($reslist['prod'] as $ProdID){
				$BuildLevelFactor       = $PLANET[ $resource[$ProdID]."_porcent" ];
				$BuildLevel             = $PLANET[ $resource[$ProdID] ];

				if ($ProdID < 4 or $ProdID == 7){
					if($USER['engineer'] >= 1) {
						$energy[$ProdID]	= floor(eval($ProdGrid[$ProdID]['formule']['energy'])    * ($CONF['resource_multiplier']));
						$porcentaje = $energy[$ProdID] * 0.10;
						$energy[$ProdID] = $energy[$ProdID] - $porcentaje;
					} else {
						$energy[$ProdID]	= floor(eval($ProdGrid[$ProdID]['formule']['energy'])    * ($CONF['resource_multiplier']));
					}
				$en+=$energy[$ProdID];
				}
			}
		
		
		
		$crystal_total			        = $PLANET['crystal_perhour'] + $CONF['crystal_basic_income'] * $CONF['resource_multiplier'] + $porcentaje_cristal;
		
		if($USER['geologe'] >= 1) {
			$deuterio_produccion = floor(eval($ProdGrid[3]['formule']['deuterium']) * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
			$porcentaje_deuterio = $deuterio_produccion * 0.10;
		} else {
			$porcentaje_deuterio = 0;
		}
		$deuterium_total  		        = $PLANET['deuterium_perhour'] + $CONF['deuterium_basic_income'] * $CONF['resource_multiplier'] + $porcentaje_deuterio;
		
		if($USER['geologe'] >= 1) {
			$norio_produccion =  floor(eval($ProdGrid[7]['formule']['norio'])   * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
			$porcentaje_norio = $norio_produccion * 0.10;			
		} else {
			$porcentaje_norio = 0;
		}
		$norio_total		            = $PLANET['norio_perhour'] + $CONF['norio_basic_income'] * $CONF['resource_multiplier'] + $porcentaje_norio;	
		
		if($USER['engineer'] >= 1) {
			$porcentaje_energia = $energ;			
		} else {
			$porcentaje_energia = 0;
		}
		$energy_total					= $PLANET['energy_max'] + $CONF['energy_basic_income'] * $CONF['resource_multiplier'] + $porcentaje_energia;

		$mods = array();

		$handle = opendir(ROOT_PATH . 'includes/modules');

	    while (false !== ($entry = readdir($handle))) {
	    	if($entry!='.' && $entry!='..' && $entry!='.htaccess'){
	    		include ROOT_PATH . 'includes/modules/'.$entry.'/settings.php';
	    		if($setting['module_menu']){
	    			if(isModuleActive($setting['module_link'])){
	    				$mods[] = array(
			    			'name'	=> $setting['module_name'],
			    			'link'	=> $setting['module_link'],
			    		);
	    			}
	    		}
	    	}
	    }

		closedir($handle);
		
		$this->assign_vars(array(	
			'modules'			=> $mods,
			'PlanetMenu' 		=> $Planetlist,
			'metales'				=> $cantidad_metal,
			'cristales'			=> $cantidad_cristal,
			'deuterios'			=> $cantidad_deuterio,
			'norios'			    => $cantidad_norio,
			'almacenes' => $LNG['rs_storage_capacity'],
			'show_planetmenu' 	=> $LNG['show_planetmenu'],
			'current_pid'		=> $PLANET['id'],
			'Scripttime'		=> json_encode($Scripttime),	
			'lm_overview'		=> $LNG['lm_overview'],
			'lm_buildings'		=> $LNG['lm_buildings'],
			'lm_bonus' 			=> $LNG['lm_bonus'],
			'lm_resources'		=> $LNG['lm_resources'],
			'lm_trader'			=> $LNG['lm_trader'],
			'lm_fleettrader'	=> $LNG['lm_fleettrader'],
			'lm_research'		=> $LNG['lm_research'],
			'lm_shipshard'		=> $LNG['lm_shipshard'],
			'lm_fleet'			=> $LNG['lm_fleet'],
			'lm_technology'		=> $LNG['lm_technology'],
			'lm_galaxy'			=> $LNG['lm_galaxy'],
			'lm_defenses'		=> $LNG['lm_defenses'],
			'lm_alliance'		=> $LNG['lm_alliance'],
			'lm_forums'			=> $LNG['lm_forums'],
			'lm_officiers'		=> $LNG['lm_officiers'],
			'lm_statistics' 	=> $LNG['lm_statistics'],
			'lm_records'		=> $LNG['lm_records'],
			'lm_topkb'			=> $LNG['lm_topkb'],
			'lm_search'			=> $LNG['lm_search'],
			'lm_battlesim'		=> $LNG['lm_battlesim'],
			'lm_messages'		=> $LNG['lm_messages'],
			'lm_notes'			=> $LNG['lm_notes'],
			'lm_buddylist'		=> $LNG['lm_buddylist'],
			'lm_chat'			=> $LNG['lm_chat'],
			'lm_support'		=> $LNG['lm_support'],
			'lm_faq'			=> $LNG['lm_faq'],
			'lm_options'		=> $LNG['lm_options'],
			'lm_banned'			=> $LNG['lm_banned'],
			'lm_rules'			=> $LNG['lm_rules'],
			'lm_logout'			=> $LNG['lm_logout'],
			'lm_credits'		=> $LNG['lm_credits'],			
			'new_message' 		=> $USER['new_message'],
			'forum_url'			=> $CONF['forum_url'],
			'lm_administration'	=> $LNG['lm_administration'],
			'topnav'			=> true,
			'metal'				=> $PLANET['metal'],
			'crystal'			=> $PLANET['crystal'],
			'deuterium'			=> $PLANET['deuterium'],
			'norio'			    => $PLANET['norio'],
			'metal_max_update'			=> $PLANET["metal_max"],
			'crystal_max_update'		=> $PLANET["crystal_max"],
			'deuterium_max_update' 	=> $PLANET["deuterium_max"],
			'norio_max_update' 	    => $PLANET["norio_max"],


			'energy'			=> (($PLANET["energy_max"] + $PLANET["energy_used"]) < 0) ? pretty_number($PLANET["energy_max"] + $PLANET["energy_used"]) : pretty_number($PLANET["energy_max"] + $PLANET["energy_used"]),
			'energy_maxx' => pretty_number($PLANET["energy_max"]),
			'energia' => (($PLANET["energy_max"] + $PLANET["energy_used"]) < 0) ? colorRed(pretty_number($PLANET["energy_max"] + $PLANET["energy_used"])) : pretty_number($PLANET["energy_max"] + $PLANET["energy_used"]),
			'darkmatter'		=> pretty_number($USER["darkmatter"]),
			'metal_max'			=> pretty_number($PLANET["metal_max"]),
			'crystal_max'		=> pretty_number($PLANET["crystal_max"]),
			'deuterium_max' 	=> pretty_number($PLANET["deuterium_max"]),
			'norio_max' 	    => pretty_number($PLANET["norio_max"]),
			'alt_metal_max'		=> pretty_number($PLANET["metal_max"]),
			'alt_crystal_max'	=> pretty_number($PLANET["crystal_max"]),
			'alt_deuterium_max' => pretty_number($PLANET["deuterium_max"]),
			'alt_norio_max'     => pretty_number($PLANET["norio_max"]),
			'js_metal_max'		=> floattostring($PLANET["metal_max"]),
			'js_crystal_max'	=> floattostring($PLANET["crystal_max"]),
			'js_deuterium_max' 	=> floattostring($PLANET["deuterium_max"]),
			'js_norio_max'   	=> floattostring($PLANET["norio_max"]),
			'js_metal_hr'		=> $PLANET['planet_type'] == 1 ? floattostring($PLANET['metal_perhour'] + ($CONF['metal_basic_income'] * $CONF['resource_multiplier'])) : 0,
			'js_crystal_hr'		=> $PLANET['planet_type'] == 1 ? floattostring($PLANET['crystal_perhour'] + ($CONF['crystal_basic_income'] * $CONF['resource_multiplier'])) : 0,
			'js_deuterium_hr'	=> $PLANET['planet_type'] == 1 ? floattostring($PLANET['deuterium_perhour'] + ($CONF['deuterium_basic_income'] * $CONF['resource_multiplier'])) : 0,
			'js_norio_hr'		=> $PLANET['planet_type'] == 1 ? floattostring($PLANET['norio_perhour'] + ($CONF['norio_basic_income'] * $CONF['resource_multiplier'])) : 0,
			'current_planet'	=> $this->phpself."&amp;cp=".$PLANET['id'],
			'tn_vacation_mode'	=> $LNG['tn_vacation_mode'],
			'closed'			=> $CONF['game_disable'] ? $LNG['ov_closed'] : false,
			'vacation'			=> $USER['urlaubs_modus'] ? date(TDFORMAT,$USER['urlaubs_until']) : false,
			'delete'			=> $USER['db_deaktjava'] ? sprintf($LNG['tn_delete_mode'], date(TDFORMAT, strtotime("+7 day", $USER['db_deaktjava']))) : false,
			'image'				=> $PLANET['image'],
			'settings_tnstor'	=> $USER['settings_tnstor'],
			'PlanetSelect'		=> $PlanetSelect,
			'Metal'				=> $LNG['Metal'],
			'Crystal'			=> $LNG['Crystal'],
			'Deuterium'			=> $LNG['Deuterium'],
			'Norio'			    => $LNG['Norio'],
			'Darkmatter'		=> $LNG['Darkmatter'],
			'Energy'			=> $LNG['Energy'],
			'newsbar'			=> json_encode($news),
			'is_news'					=> $CONF['OverviewNewsFrame'],
			'prod_met'				=> pretty_number($metal_total),
			'prod_cry'				=> pretty_number($crystal_total),
			'prod_nor'				=> pretty_number($norio_total),
			'prod_deu'				=> pretty_number($deuterium_total),
			'prod_ene'				=> pretty_number($energy_total),
			'red_ene'				=> shortly_number($en),
			'ranki'					=> $ranki,
			'auidio_active'			=> $CONF['game_sound'],
			'audiosource'			=> './styles/sounds/test.wav',
			'planetname'			=> $PLANET['name'],
			'local_audio_deactive'	=> (isset($_COOKIE['audio_deactive'])?true:false)
		));
	}

	public function GalaxyRowDebrix($PlanetQuery)
	{
		global $USER, $PLANET, $LNG, $pricelist, $resource;

		$GRecNeeded = min(ceil(($PlanetQuery['der_metal'] + $PlanetQuery['der_crystal']) / $pricelist[219]['capacity']), $PLANET[$resource[219]]);
		$RecNeeded 	= min(ceil(max($PlanetQuery['der_metal'] + $PlanetQuery['der_crystal'] - ($GRecNeeded * $pricelist[219]['capacity']), 0) / $pricelist[209]['capacity']), $PLANET[$resource[209]]);

		$Result = array(
			'metal'			=> pretty_number($PlanetQuery["der_metal"]),
			'crystal'		=> pretty_number($PlanetQuery["der_crystal"]),
			'RecSended'		=> $RecNeeded,			
			'GRecSended'	=> $GRecNeeded,			
			'recycle'		=> (!CheckModule(32)) ? $LNG['type_mission'][8]:false,
		);

		return $Result;
	}

	private function AdminMenu(){
		global $LNG, $db, $LANG, $CONF, $UNI, $USER;

		$AvailableUnis[$CONF['uni']]	= $CONF['game_name'].' (ID: '.$CONF['uni'].')';
		$Query	= $db->query("SELECT `uni`, `game_name` FROM ".CONFIG." WHERE `uni` != '".$UNI."' ORDER BY `uni` DESC;");
		while($Unis	= $db->fetch_array($Query)) {
			$AvailableUnis[$Unis['uni']]	= $Unis['game_name'].' (ID: '.$Unis['uni'].')';
		}
		ksort($AvailableUnis);

		$this->assign_vars(array(	
			'mu_game_info'				=> $LNG['mu_game_info'],
			'mu_settings'				=> $LNG['mu_settings'],
			'mu_ts_options'				=> $LNG['mu_ts_options'],
			'mu_fb_options'				=> $LNG['mu_fb_options'],
			'mu_module'					=> $LNG['mu_module'],
			'mu_user_logs'				=> $LNG['mu_user_logs'],
			'mu_optimize_db'			=> $LNG['mu_optimize_db'],
			'mu_stats_options'			=> $LNG['mu_stats_options'],
			'mu_chat'					=> $LNG['mu_chat'],
			'mu_update'					=> $LNG['mu_update'],
			'mu_general'				=> $LNG['mu_general'],
			'new_creator_title'			=> $LNG['new_creator_title'],
			'mu_add_delete_resources'	=> $LNG['mu_add_delete_resources'],
			'mu_ban_options'			=> $LNG['mu_ban_options'],
			'mu_users_settings'			=> $LNG['mu_users_settings'],
			'mu_tools'					=> $LNG['mu_tools'],
			'mu_manual_points_update'	=> $LNG['mu_manual_points_update'],
			'mu_global_message'			=> $LNG['mu_global_message'],
			'mu_md5_encripter'			=> $LNG['mu_md5_encripter'],
			'mu_mpu_confirmation'		=> $LNG['mu_mpu_confirmation'],
			'mu_observation'			=> $LNG['mu_observation'],
			'mu_connected'				=> $LNG['mu_connected'],
			'mu_support'				=> $LNG['mu_support'],
			'mu_vaild_users'			=> $LNG['mu_vaild_users'],
			'mu_active_planets'			=> $LNG['mu_active_planets'],
			'mu_flying_fleets'			=> $LNG['mu_flying_fleets'],
			'mu_news'					=> $LNG['mu_news'],
			'mu_user_list'				=> $LNG['mu_user_list'],
			'mu_planet_list'			=> $LNG['mu_planet_list'],
			'mu_moon_list'				=> $LNG['mu_moon_list'],
			'mu_mess_list'				=> $LNG['mu_mess_list'],
			'mu_info_account_page'		=> $LNG['mu_info_account_page'],
			'mu_multiip_page'			=> $LNG['mu_multiip'],
			'mu_search_page'			=> $LNG['mu_search_page'],
			'mu_mod_update'				=> $LNG['mu_mod_update'],
			'mu_clear_cache'			=> $LNG['mu_clear_cache'],
			'supportticks'				=> $db->countquery("SELECT COUNT(*) FROM ".SUPP." WHERE `universe` = '".$_SESSION['adminuni']."' AND (`status` = '1' OR `status` = '3');"),
			'ad_authlevel_title'		=> $LNG['ad_authlevel_title'],
			're_reset_universe'			=> $LNG['re_reset_universe'],
			'mu_universe'				=> $LNG['mu_universe'],
			'mu_moderation_page'		=> $LNG['mu_moderation_page'],
			'adm_cp_title'				=> $LNG['adm_cp_title'],
			'adm_cp_index'				=> $LNG['adm_cp_index'],
			'adm_cp_logout'				=> $LNG['adm_cp_logout'],
			'sid'						=> session_id(),
			'id'						=> $USER['id'],
			'authlevel'					=> $USER['authlevel'],
			'AvailableUnis'				=> $AvailableUnis,
			'UNI'						=> $_SESSION['adminuni'],
			'game_name'					=> $CONF['game_name'],
		));
	}
	
    private function main()
    {
		global $USER, $CONF, $LANG, $LNG, $THEME;
      
      $navegador = $_SERVER['HTTP_USER_AGENT'];
      $usa_navegador = strrpos($navegador, "MSIE");
      
      if ($usa_navegador === false) {
         $IE = false;
      } else {
         $IE = true;
      }
      
      if($IE) {
         $css_style = "formato_IE";
      } else {
         $css_style = "formato";
      }
	  
	  if($USER['raza'] == 0) {
                        $raza_tipo = $LNG['Raza_0'];
						$skin_raza = "gultra";
                } elseif ($USER['raza'] == 1) {
                        $raza_tipo = $LNG['Raza_1'];
						$skin_raza = "voltra";
                }
				
				
		if($USER['commander'] >= 1) {
			$imperio = "javascript:OpenPopup('?page=imperium','" .$LNG['lm_empire'] ."', 1024, 768);";
			$comandante_icon = "600.png";
		} else {
			$imperio = "javascript:void(0);";
			$comandante_icon = "600_off.png";
		}
		if($USER['engineer'] >= 1) {
		$ingeniero_icon = "603.png";
		} else {
		$ingeniero_icon = "603_off.png";
		}
		if($USER['admiral'] >= 1) {
		$almirante_icon = "602.png";
		} else {
		$almirante_icon = "602_off.png";
		}
		if($USER['geologe'] >= 1) {
		$geologo_icon = "601.png";	
		} else {
		$geologo_icon = "601_off.png";
		}
		if($USER['technocratic'] >= 1) {
		$tecnocrata_icon = "604.png";
		} else {
		$tecnocrata_icon = "604_off.png";
		}
      
        $this->assign_vars(array(
			'Comandante' => $comandante_icon,
			'Tecnocrata' => $tecnocrata_icon,
			'Ingeniero' => $ingeniero_icon,
			'Almirante' => $almirante_icon,
			'Geologo' => $geologo_icon,
			'comandante' => $LNG['comandante'],
			'tecnocrata' => $LNG['tecnocrata'],
			'ingeniero' => $LNG['ingeniero'],
			'almirante' => $LNG['almirante'],
			'geologo' => $LNG['geologo'],
            'title'            => $CONF['game_name'],
            'css_style'       => $css_style,
         'uni_name'         => $CONF['uni_name'],
            'dpath'				=> $THEME->getTheme(),
            'vmode'				=> $USER['urlaubs_modus'],
            'is_pmenu'			=> $USER['settings_planetmenu'],
			'authlevel'			=> $USER['authlevel'],
            'lang'    			=> $LANG->getUser(),
            'ready'    			=> $LNG['ready'],
			'date'				=> explode("|", date('Y\|n\|j\|G\|i\|s\|Z', TIMESTAMP)),
			'cron'				=> GetCrons(),
			'ga_active'			=> $CONF['ga_active'],
			'ga_key'			=> $CONF['ga_key'],
			'debug'				=> $CONF['debug'],
			'min_js'			=> $CONF['min_js'],
			'fcm_info'			=> $LNG['fcm_info'],
			'VERSION'			=> $CONF['VERSION'],
			'REV'				=> substr($CONF['VERSION'], -4),
			'Raza'                          => $LNG['Raza'],
            'Raza_tipo'        => $raza_tipo,
			'Raza_skin'      => $skin_raza,
			'imperio' => $imperio,
		));
	}
	
	private function adm_main()
	{
		global $LNG, $CONF;
		$this->assign_vars(array(
			'scripts'	=> $this->script,
			'title'		=> $CONF['game_name'].' - '.$LNG['adm_cp_title'],
			'fcm_info'	=> $LNG['fcm_info'],
			'gotoinsec'	=> false,
			'goto'		=> false,
		));
	}
	
	public function login_main()
	{
		global $USER, $CONF, $LNG, $LANG, $UNI;
		$this->assign_vars(array(
			'cappublic'			=> $CONF['cappublic'],
			'servername' 		=> $CONF['game_name'],
			'forum_url' 		=> $CONF['forum_url'],
			'fb_active'			=> $CONF['fb_on'],
			'fb_key' 			=> $CONF['fb_apikey'],
			'forum' 			=> $LNG['forum'],
			'register_closed'	=> $LNG['register_closed'],
			'fb_perm'			=> sprintf($LNG['fb_perm'], $CONF['game_name']),
			'menu_index'		=> $LNG['menu_index'],
			'menu_news'			=> $LNG['menu_news'],
			'menu_rules'		=> $LNG['menu_rules'],
			'menu_agb'			=> $LNG['menu_agb'],
			'menu_pranger'		=> $LNG['menu_pranger'],
			'menu_top100'		=> $LNG['menu_top100'],
			'menu_disclamer'	=> $LNG['menu_disclamer'],
			'music_off'			=> $LNG['music_off'],
			'music_on'			=> $LNG['music_on'],
			'game_captcha'		=> $CONF['capaktiv'],
			'reg_close'			=> $CONF['reg_closed'],
			'ga_active'			=> $CONF['ga_active'],
			'ga_key'			=> $CONF['ga_key'],
			'bgm_active'		=> $CONF['bgm_active'],
			'bgm_file'			=> $CONF['bgm_file'],
			'mail_active'		=> $CONF['mail_active'],
			'getajax'			=> request_var('getajax', 0),
			'lang'				=> $LANG->getUser(),
			'UNI'				=> $UNI,
			'langs'				=> Language::getAllowedLangs(),
		));
	}
		
	public function isPopup()
	{
		$this->Popup		= true;
	}
		
	public function show($file)
	{		
		global $USER, $PLANET, $CONF, $LNG, $db;
		
		if(!defined('INSTALL')) {
			if(defined('IN_ADMIN')) {
				$this->adm_main();
				$this->AdminMenu();	
			} elseif(defined('LOGIN')) {
				$this->login_main();	
			} elseif(defined('LOBBY')){
				$this->assign_vars(array(
				'servername' 		=> $CONF['game_name'],
				));
			}elseif(!$this->Dialog) {
				if(!defined('AJAX')) {
					$_SESSION['USER']	= $USER;
					$_SESSION['PLANET']	= $PLANET;
				}
				$this->main();
				if($this->Popup === false)
					$this->Menus();
			}
		}
		$this->assign_vars(array(
			'scripts'			=> $this->jsscript,
			'execscript'		=> implode("\n", $this->script),
		));
		
		$this->display($file);
	}
	
	public function gotoside($dest, $time = 3)
	{
		$this->assign_vars(array(
			'gotoinsec'	=> $time,
			'goto'		=> $dest,
		));
	}
	
	public function display($file)
	{
		global $THEME;
		$this->file			= $file;
		$this->template_dir	= $THEME->getTemplatePath();
		if($this->cache && $GLOBALS['CONF']['debug'] == 0)
		{
			$this->cachefile	= $this->cachedir.md5($this->template_dir.$this->file .r_implode('', $this->vars)).'.tpl.php';
			if(file_exists($this->cachefile))
				echo file_get_contents($this->cachefile);
			else
				echo $this->render();
		} else {
			echo $this->render();
		}
	}
	
	public function message($mes, $dest = false, $time = 3, $Fatal = false)
	{
		global $LNG, $THEME;
		if($Fatal)
			$this->isPopup(true);
	
		$this->assign_vars(array(
			'mes'		=> $mes,
			'fcm_info'	=> $LNG['fcm_info'],
			'Fatal'		=> $Fatal,
            'dpath'		=> $THEME->getTheme(),
		));
		
		$this->gotoside($dest, $time);
		if (defined('IN_ADMIN')) {
			$this->show('adm/error_message_body.tpl');
			exit;
		}
		$this->show('error_message_body.tpl');
	}
}

?>