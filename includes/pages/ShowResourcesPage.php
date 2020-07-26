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

function ShowResourcesPage()
{
	global $LNG, $ProdGrid, $resource, $reslist, $CONF, $db, $USER, $PLANET;
	
	if ($PLANET['planet_type'] == 3 || $USER['urlaubs_modus'] == 1)
	{
		$CONF['metal_basic_income']     = 0;
		$CONF['crystal_basic_income']   = 0;
		$CONF['deuterium_basic_income'] = 0;
		$CONF['norio_basic_income'] = 0;
		
		if($USER['urlaubs_modus'] == 1) {
			$PLANET['metal_proc']			= array(0);
			$PLANET['crystal_proc']			= array(0);
			$PLANET['deuterium_proc']		= array(0);
			$PLANET['deuterium_userd_proc']	= array(0);
			$PLANET['norio_proc']			= array(0);
			$PLANET['energy_max_proc']		= array(0);
			$PLANET['energy_used_proc']		= array(0);
		}
		
	}

	$SubQry               = "";

	if ($_POST && $USER['urlaubs_modus'] == 0)
	{
		foreach($_POST as $Field => $Value)
		{
			$FieldName = $Field."_porcent";
			if (isset($PLANET[$FieldName]) && in_array($Value, $reslist['procent']))
			{
				$Value                        = $Value / 10;
				$PLANET[ $FieldName ]  = $Value;
				$SubQry                      .= ", `".$FieldName."` = '".$Value."'";
			}
		}
		if(isset($SubQry))
		{
			$QryUpdatePlanet  = "UPDATE ".PLANETS." SET ";
			$QryUpdatePlanet .= "`id` = '". $PLANET['id'] ."' ";
			$QryUpdatePlanet .= $SubQry;
			$QryUpdatePlanet .= "WHERE ";
			$QryUpdatePlanet .= "`id` = '". $PLANET['id'] ."';";
			$db->query($QryUpdatePlanet);
		}
		redirectTo("game.php?page=resources&load=res");
		exit;		
	}
	
	$PlanetRess = new ResourceUpdate();
	$PlanetRess->CalcResource();
	$PlanetRess->SavePlanetToDB();

	$template	= new template();
	
	if ($PLANET['energy_max'] == 0 && $PLANET['energy_used'] > 0)
	{
		$post_porcent = 0;
	}
	elseif ($PLANET['energy_max']  > 0 && abs($PLANET['energy_used']) > $PLANET['energy_max'])
	{
		$post_porcent = floor(($PLANET['energy_max']) / ($PLANET['energy_used']*-1) * 100);
	}
	elseif ($PLANET['energy_max'] == 0 && abs($PLANET['energy_used']) > $PLANET['energy_max'])
	{
		$post_porcent = 0;
	}
	else
	{
		$post_porcent = 100;
	}

	if ($post_porcent > 100)
	{
		$post_porcent = 100;
	}
	
	$BuildTemp      = $PLANET['temp_max'];
	$BuildEnergy	= $USER[$resource[113]];
	$metal			= array();
	$crystal		= array();
	$deuterium		= array();
	$deu_en			= array();
	$norio		    = array();
	$energy			= array();
	$energy_en		= array();
	$sel = 0;
	
	foreach($reslist['prod'] as $ProdID)
	{
		//if ($PLANET[$resource[$ProdID]] > 0 && isset($ProdGrid[$ProdID]))
		//{
			$BuildLevelFactor       = $PLANET[ $resource[$ProdID]."_porcent" ];
			$BuildLevel             = $PLANET[ $resource[$ProdID] ];
			
			#METAL
			if($USER['geologe'] >= 1){
			$metal_produccion    	= floor(eval($ProdGrid[$ProdID]['formule']['metal']) * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
			$porcentaje_metal = $metal_produccion * 0.10;
			$metal[$ProdID] = $metal_produccion + $porcentaje_metal; 
			}else {
			$metal[$ProdID] = floor(eval($ProdGrid[$ProdID]['formule']['metal']) * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
			}
			
			#CRISTAL
			if($USER['geologe'] >= 1){
			$cristal_produccion =  floor(eval($ProdGrid[$ProdID]['formule']['crystal'])   * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
			$porcentaje_cristal = $cristal_produccion * 0.10;			
			$crystal[$ProdID] = $cristal_produccion + $porcentaje_cristal;
			} else {
			$crystal[$ProdID] 		= floor(eval($ProdGrid[$ProdID]['formule']['crystal'])   * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
			}
			
			#NORIO
			if($USER['geologe'] >= 1){
			$norio_produccion =  floor(eval($ProdGrid[$ProdID]['formule']['norio'])   * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
			$porcentaje_norio = $norio_produccion * 0.10;			
			$norio[$ProdID]  = $norio_produccion + $porcentaje_norio;
			}else {
			$norio[$ProdID] 		= floor(eval($ProdGrid[$ProdID]['formule']['norio'])   * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
			}
		
			if ($ProdID < 4)
			{
				if ($USER['geologe'] >= 1 ) {			
				$deuterio_produccion = floor(eval($ProdGrid[$ProdID]['formule']['deuterium']) * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
				$porcentaje_deuterio = $deuterio_produccion * 0.10;
				$deuterium[$ProdID] = $deuterio_produccion + $porcentaje_deuterio;
				} else {
				$deuterium[$ProdID]	= floor(eval($ProdGrid[$ProdID]['formule']['deuterium']) * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
				}			
			
				if($USER['engineer'] >= 1) {
				$energy[$ProdID]	= floor(eval($ProdGrid[$ProdID]['formule']['energy'])    * ($CONF['resource_multiplier']));
				$porcentaje = $energy[$ProdID] * 0.10;
				$energy[$ProdID] = $energy[$ProdID] - $porcentaje;
				} else {
				$energy[$ProdID]	= floor(eval($ProdGrid[$ProdID]['formule']['energy'])    * ($CONF['resource_multiplier']));
				}
			} else {
				if($ProdID == 12 && $PLANET['deuterium'] == 0)
					continue;
				
				$deu_en[$ProdID]	= floor(eval($ProdGrid[$ProdID]['formule']['deuterium']) * ($CONF['resource_multiplier']));
				$energy_en[$ProdID]	= floor(eval($ProdGrid[$ProdID]['formule']['energy']) * ($CONF['resource_multiplier']));
			}

			$thisdeu				= ((isset($deuterium[$ProdID])) ? $deuterium[$ProdID] : $deu_en[$ProdID]);
			$thisenergy				= ((isset($energy[$ProdID])) ? $energy[$ProdID] : $energy_en[$ProdID]);
			
			if ($USER['geologe'] >= 1) {
				$irs = "<font size=1>(+10%)</font>";
			} else {
				$irs = "";
			}
			if($sel==1){
				$sel=0;
			}else{
				$sel=1;
			}
			
			$CurrPlanetList[]	= array(
				'name'              => $resource[$ProdID],
				'type'  			=> $LNG['tech'][$ProdID],
				'id'  				=> $ProdID,
				'irs' => $irs,
				'level'     	    => ($ProdID > 200) ? $LNG['rs_amount'] : $LNG['rs_lvl'],
				'level_type'        => pretty_number($PLANET[$resource[$ProdID]]),
				'metal_type'        => colorNumber(shortly_number($metal[$ProdID])),
				'crystal_type'      => colorNumber(shortly_number($crystal[$ProdID])),
				'deuterium_type'    => colorNumber(shortly_number($thisdeu)),
				'norio_type'        => colorNumber(shortly_number($norio[$ProdID])),
				'energy_type'       => colorNumber(shortly_number($thisenergy)),
				'optionsel'			=> $PLANET[$resource[$ProdID]."_porcent"] * 10,
				'sel'			=> $sel,
			);
		//}
	}
	
	if($USER['geologe'] >= 1) {
		$geologo_icon = "601.png";	
		$geologo_active = 1;
		} else {
		$geologo_icon = "601_off.png";
		$geologo_active = 0;
		}
		if($USER['engineer'] >= 1) {
		$ingeniero_icon = "603.png";
		$ingeniero_active = 1;
		} else {
		$ingeniero_icon = "603_off.png";
		$ingeniero_active = 0;
		}
			$BuildProcMetal     = $USER[$resource[131]];
			$BuildProcCrystal   = $USER[$resource[132]];
			$BuildProcDeuterium = $USER[$resource[133]];
			$BuildProcNorium    = $USER[$resource[135]];
		
		$BuildLevel             = $USER[ $resource[122] ];
		$BuildLevelM             = (30 * $PLANET[ $resource[1]] * pow((1.1), $PLANET[ $resource[1]])) * (0.1 * $PLANET[ $resource[1]."_porcent" ]) * (1 + ($BuildProcMetal * 0.02));
		$BuildLevelC             = (20 * $PLANET[ $resource[2]] * pow((1.1), $PLANET[ $resource[2]])) * (0.1 * $PLANET[ $resource[2]."_porcent" ]) * (1 + ($BuildProcCrystal * 0.02));
		$BuildLevelD             = (10 * $PLANET[ $resource[3]] * pow((1.1), $PLANET[ $resource[3]]) * (-0.002 * $BuildTemp + 1.28) * (0.1 * $PLANET[ $resource[3]."_porcent" ])) * (1 + ($BuildProcDeuterium * 0.02));
		$BuildLevelN             = (15 * $PLANET[ $resource[7]] * pow((1.1), $PLANET[ $resource[7]])) * (0.1 * $PLANET[ $resource[7]."_porcent" ]) * (1 + ($BuildProcNorium * 0.02));
		
		
		$metal   = floor($BuildLevelM * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
		$crystal = floor($BuildLevelC * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
		$norio 	 = floor($BuildLevelN * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
		$thisdeu = floor($BuildLevelD * (0.01 * $post_porcent) * ($CONF['resource_multiplier']));
		
		$energy_en	   = floor(eval($ProdGrid[4]['formule']['energy']) * ($CONF['resource_multiplier']));
		$energy_en_212 = floor(eval($ProdGrid[212]['formule']['energy']) * ($CONF['resource_multiplier']));
		$energy_en_12  = floor(eval($ProdGrid[12]['formule']['energy']) * ($CONF['resource_multiplier']));
		$thisenergy	   = ((isset($energy[4])) ? $energy[4] : $energy_en[1]);
		$energ         = ($energy_en + $energy_en_212 + $energy_en_12)*0.10;
		
		if($BuildLevel>=1){
			$met  = $metal   * (0.10  * $BuildLevel);
			$crys = $crystal * (0.066 * $BuildLevel);
			$deu  = $thisdeu * (0.033 * $BuildLevel);
			$nor  = $norio   * (0.015 * $BuildLevel);
		}else{
			$met = 0;
			$crys = 0;
			$deu = 0;
			$nor = 0;
		}
		
		$CurrPlanetList[]	= array(
				'name'              => $resource[122],
				'type'  			=> $LNG['tech'][122],
				'id'  				=> 122,
				'irs' => $irs,
				'level'     	    => $LNG['rs_lvl'],
				'level_type'        => pretty_number($USER[$resource[122]]),
				'metal_type'        => colorNumber(shortly_number($met)),
				'crystal_type'      => colorNumber(shortly_number($crys)),
				'deuterium_type'    => colorNumber(shortly_number($deu)),
				'norio_type'        => colorNumber(shortly_number($nor)),
				'energy_type'       => '0',
				'optionsel'			=> '',
				'sel'			=> $sel,
			);
			
		if($USER['geologe'] >= 1) {
			$met = $metal * 0.10;
			$crys = $crystal * 0.10;
			$nor = $norio * 0.10;
			$deu = $thisdeu * 0.10;
		
			$CurrPlanetListC[]	= array(
					'nombre' => $LNG['geologo'],
					'imagen'     	    => $geologo_icon,
					'active'     	    => $geologo_active,
					'metal_type'        => colorNumber(shortly_number($met)),
					'crystal_type'      => colorNumber(shortly_number($crys)),
					'deuterium_type'    => colorNumber(shortly_number($deu)),
					'norio_type'        => colorNumber(shortly_number($nor)),
					'energy_type'       => '0',
					'sel'       => '0',
				);
		}else{		
			$CurrPlanetListC[]	= array(
					'nombre' => $LNG['geologo'],
					'imagen'     	    => $geologo_icon,
					'active'     	    => $geologo_active,
					'metal_type'        => '0',
					'crystal_type'      => '0',
					'deuterium_type'    => '0',
					'norio_type'        => '0',
					'energy_type'       => '0',
					'sel'       => '0',
				);
		}
		if($USER['engineer'] >= 1) {	
		
			$CurrPlanetListC[]	= array(
					'nombre' => $LNG['ingeniero'],
					'imagen'     	    => $ingeniero_icon,
					'active'     	    => $ingeniero_active,
					'metal_type'        => '0',
					'crystal_type'      => '0',
					'deuterium_type'    => '0',
					'norio_type'        => '0',
					'energy_type'       => colorNumber(shortly_number($energ)),
					'sel'       => '0',
				);
		}else{
			$CurrPlanetListC[]	= array(
					'nombre' => $LNG['ingeniero'],
					'imagen'     	    => $ingeniero_icon,
					'active'     	    => $ingeniero_active,
					'metal_type'        => '0',
					'crystal_type'      => '0',
					'deuterium_type'    => '0',
					'norio_type'        => '0',
					'energy_type'       => '0',
					'sel'       => '0',
				);
		}
	
	
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
	$energy_total					= $PLANET['energy_max'] + $CONF['energy_basic_income'] * $CONF['resource_multiplier'] - abs($PLANET['energy_used']) + $porcentaje_energia;
	
	foreach($reslist['procent'] as $procent){
		$OptionSelector[$procent]	= $procent."%";
	}
	
	if($USER['raza'] == 0) {
		$skin_raza = "gultra";
	} elseif ($USER['raza'] == 1) {
		$skin_raza = "voltra";
	} 
	
	$header_planeta = "<img src=\"styles/theme/" .$skin_raza ."/adds/recurso.jpg\" />";
	
	
	$template->assign_vars(array(	
		'CurrPlanetList'						=> $CurrPlanetList,	
		'CurrPlanetListC'						=> $CurrPlanetListC,	
		'Production_of_resources_in_the_planet'	=> str_replace('%s', $PLANET['name'], $LNG['rs_production_on_planet']),
		'metal_basic_income'    				=> $CONF['metal_basic_income']     * $CONF['resource_multiplier'],
		'crystal_basic_income'  				=> $CONF['crystal_basic_income']   * $CONF['resource_multiplier'],
		'deuterium_basic_income'				=> $CONF['deuterium_basic_income'] * $CONF['resource_multiplier'],
        'norio_basic_income'				    => $CONF['norio_basic_income'] * $CONF['resource_multiplier'],		
		'energy_basic_income'   				=> $CONF['energy_basic_income']    * $CONF['resource_multiplier'],
		'metalmax'             					=> colorNumber($PLANET['metal_max'] / 1000, pretty_number($PLANET['metal_max'] / 1000) ."k"),
		'crystalmax'          					=> colorNumber($PLANET['crystal_max'] / 1000, pretty_number($PLANET['crystal_max'] / 1000) ."k"),
		'deuteriummax'         					=> colorNumber($PLANET['deuterium_max'] / 1000, pretty_number($PLANET['deuterium_max'] / 1000) ."k"),
		'noriomax'         						=> colorNumber($PLANET['norio_max'] / 1000, pretty_number($PLANET['norio_max'] / 1000) ."k"),
		'metal_total'           				=> colorNumber(pretty_number($metal_total)),
		'crystal_total'         				=> colorNumber(pretty_number($crystal_total)),
		'option'								=> $OptionSelector,
		'deuterium_total'       				=> colorNumber(pretty_number($deuterium_total)),
		'norio_total'         				    => colorNumber(pretty_number($norio_total)),
		'energy_total'          				=> colorNumber(pretty_number($energy_total)),
		'daily_metal'           				=> colorNumber(pretty_number(floor($metal_total     * 24))),
		'weekly_metal'          				=> colorNumber(pretty_number(floor($metal_total     * 24 * 7))),
		'daily_crystal'         				=> colorNumber(pretty_number(floor($crystal_total   * 24))),
		'weekly_crystal'        				=> colorNumber(pretty_number(floor($crystal_total   * 24 * 7))),
		'daily_deuterium'       				=> colorNumber(pretty_number(floor($deuterium_total * 24))),
		'weekly_deuterium'      				=> colorNumber(pretty_number(floor($deuterium_total * 24 * 7))),
		'daily_norio'         				    => colorNumber(pretty_number(floor($norio_total   * 24))),
		'weekly_norio'        				    => colorNumber(pretty_number(floor($norio_total   * 24 * 7))),
		'Metal'									=> $LNG['Metal'], 
		'Crystal'								=> $LNG['Crystal'], 
		'Deuterium'								=> $LNG['Deuterium'], 
		'Norio'								    => $LNG['Norio'], 		
		'Energy'								=> $LNG['Energy'],
		'rs_basic_income'						=> $LNG['rs_basic_income'], 
		'rs_storage_capacity'					=> $LNG['rs_storage_capacity'], 
		'rs_sum'								=> $LNG['rs_sum'], 
		'rs_daily'								=> $LNG['rs_daily'], 
		'rs_weekly'								=> $LNG['rs_weekly'], 	
		'rs_calculate'							=> $LNG['rs_calculate'], 	
		'rs_ress_bonus'							=> $LNG['rs_ress_bonus'], 	
		'header'								=> $header_planeta,
		'header'								=> $header_planeta,
		'res_active'								=> 'activess',
		'ov_planets_act'			=> $LNG['ov_planets_act'],
		'recursos_config'					=>'Opciones de recursos',
		'planetname'                            => $PLANET['name'],
        'resu'                  => true
	));
	
	$template->show("recursos/resources_overview.tpl");
}

?>