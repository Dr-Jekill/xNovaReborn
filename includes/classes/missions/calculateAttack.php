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

function calculateAttack(&$attackers, &$defenders, $fleet_debris, $def_debris){
	global $pricelist, $CombatCaps, $resource;

	$A_MATERIALS 	= array('metal' => 0, 'crystal' => 0, 'norio' => 0);
	$D_MATERIALS 	= array('metal' => 0, 'crystal' => 0, 'norio' => 0);
	$PERDIDAS 		= array('attacker' => 0, 'defensor' => 0);
	$FR 			= array();
	$startDef 		= array();
	$rounds 		= array();

	foreach ($attackers as $fleetId => $fleetData) {
		foreach ($fleetData['detail'] as $ship => $ammount) {
			$ammount = round($ammount);

			$A_MATERIALS['metal']		= $pricelist[$ship]['metal'] * $ammount;
			$A_MATERIALS['crystal']	= $pricelist[$ship]['crystal'] * $ammount;
			$A_MATERIALS['norio']		= $pricelist[$ship]['norio'] * $ammount;
		}
	}

	foreach ($CombatCaps as $element => $array) {
		foreach ($array['sd'] as $target => $attack) {
			if($attack == 0) continue;
			$FR[$target][$element] = $attack;
		}
	}

	$PERDIDAS['attacker'] = $A_MATERIALS['metal'] + $A_MATERIALS['crystal'] + $A_MATERIALS['norio'];

	foreach ($defenders as $defenderId => $defenderData) {
		foreach ($defenderData['def'] as $defense => $ammount) {
			$ammount = round($ammount);

			#Verificar esto, esta mandando todo a escombros
			if($defense < 300){
				$D_MATERIALS['metal'] 	+= $pricelist[$defense]['metal'] * $ammount;
				$D_MATERIALS['crystal'] += $pricelist[$defense]['crystal'] * $ammount;
				$D_MATERIALS['norio'] 	+= $pricelist[$defense]['norio'] * $ammount;

				$PERDIDAS['defensor'] 	+= $pricelist[$defense]['metal'] * $ammount;
				$PERDIDAS['defensor'] 	+= $pricelist[$defense]['crystal'] * $ammount;
				$PERDIDAS['defensor'] 	+= $pricelist[$defense]['norio'] * $ammount;
			}else{
				if (!isset($startDef[$defense])) 
					$startDef[$defense] = 0;
				
				$startDef[$defense] += $ammount;

				$PERDIDAS['defender']	+= $pricelist[$defense]['metal'] * $ammount;
				$PERDIDAS['defender']	+= $pricelist[$defense]['crystal'] * $ammount;
				$PERDIDAS['defender']	+= $pricelist[$defense]['norio'] * $ammount;
			}
		}
	}

	for ($round=0; $round <= MAX_ATTACK_ROUNDS; $round++) { 
		$attackDamage  	= array('total' => 0);
		$attackShield 	= array('total' => 0);
		$attackAmount  	= array('total' => 0);
		$defenseDamage 	= array('total' => 0);
		$defenseShield 	= array('total' => 0);
		$defenseAmount 	= array('total' => 0);
		$attackArray 		= array();
		$defenseArray 	= array();


		foreach ($attackers as $fleetId => $fleetData) {
			$attackDamage[$fleetId] = 0;
			$attackShield[$fleetId] = 0;
			$attackAmount[$fleetId] = 0;

			$attackTech	= (1 + (0.1 * $fleetData['user']['military_tech']) + $fleetData['user']['factor']['attack']); 
			$defenseTech	= (1 + (0.1 * $fleetData['user']['defence_tech']) + $fleetData['user']['factor']['defensive']); 
			$shieldTech = (1 + (0.1 * $fleetData['user']['shield_tech']) + $fleetData['user']['factor']['shield']);
			$attackers[$fleetId]['techs'] = array($attackTech, $defenseTech, $shieldTech);

			foreach ($fleetData['detail'] as $ship => $ammount) {
				$ammount = round($ammount);

				$thisAtt	= $ammount * ($CombatCaps[$ship]['attack']) * $attackTech * (rand(90, 110) / 100); //attack
				$thisDef	= $ammount * ($CombatCaps[$ship]['shield']) * $defenseTech ; //defense
				$thisShield	= $ammount * ($pricelist[$ship]['metal'] + $pricelist[$ship]['crystal'] + $pricelist[$ship]['norio']) / 10 * $shieldTech; //shield

				$attackArray[$fleetId][$ship] = array('def' => $thisDef, 'shield' => $thisShield, 'att' => $thisAtt);

				$attackDamage[$fleetId] += $thisAtt;
				$attackDamage['total'] += $thisAtt;
				$attackShield[$fleetId] += $thisDef;
				$attackShield['total'] += $thisDef;
				$attackAmount[$fleetId] += $ammount;
				$attackAmount['total'] += $ammount;
			}

			$attackAmount['original'] = $attackAmount['total'];

			$temp1	= $fleetData['detail'];
		}

		foreach ($defenders as $defenderId => $defenderData) {
			$defenseDamage[$defenderId] = 0;
			$defenseShield[$defenderId] = 0;
			$defenseAmount[$defenderId] = 0;

			$attTech	= (1 + (0.1 * $defenderData['user']['military_tech']) + $defenderData['user']['factor']['attack']); 
			$defTech	= (1 + (0.1 * $defenderData['user']['defence_tech']) + $defenderData['user']['factor']['defensive']); 
			$shieldTech = (1 + (0.1 * $defenderData['user']['shield_tech']) + $defenderData['user']['factor']['shield']); 
			$defenders[$defenderId]['techs'] = array($attTech, $defTech, $shieldTech);

			foreach ($defenderData['def'] as $defense => $ammount) {
				$ammount = round($ammount);

				$thisAtt	= $ammount * ($CombatCaps[$defense]['attack']) * $attTech * (rand(90, 110) / 100); //attack
				$thisDef	= $ammount * ($CombatCaps[$defense]['shield']) * $defTech ; //defense
				$thisShield	= $ammount * ($pricelist[$defense]['metal'] + $pricelist[$defense]['crystal'] + $pricelist[$defense]['norio']) / 10 * $shieldTech; //shield

				if ($defense == 407 || $defense == 408 || $defense == 409) $thisAtt = 0;

				$defenseArray[$defenderId][$defense] = array('def' => $thisDef, 'shield' => $thisShield, 'att' => $thisAtt);

				$defenseDamage[$defenderId] += $thisAtt;
				$defenseDamage['total'] += $thisAtt;
				$defenseShield[$defenderId] += $thisDef;
				$defenseShield['total'] += $thisDef;
				$defenseAmount[$defenderId] += $ammount;
				$defenseAmount['total'] += $ammount;
			}

			$defenseAmount['original'] = $defenseAmount['total'];

			$temp2	= $defenderData['def'];
		}

		$rounds[$round] = array(
			'attackers' => $attackers, 
			'defenders' => $defenders, 
			'attackA' 	=> $attackAmount, 
			'defenseA' 	=> $defenseAmount, 
			'infoA' 		=> $attackArray, 
			'infoD' 		=> $defenseArray
		);

		if ($round >= MAX_ATTACK_ROUNDS || $defenseAmount['total'] <= 0 || $attackAmount['total'] <= 0) {
			break;
		}

		$attackPct = array();
		foreach ($attackAmount as $fleetId => $ammount) {
			$ammount = round($ammount);

			if (!is_numeric($fleetId)) continue;
				$attackPct[$fleetId] = $ammount / $attackAmount['total'];
		}

		$defensePct = array();
		foreach ($defenseAmount as $defenseId => $ammount) {
			$ammount = round($ammount);

			if (!is_numeric($defenseId)) continue;
				$defensePct[$defenseId] = $ammount / $defenseAmount['total'];
		}
		
		$attacker 				= array();
		$attacker_shield 	= 0;
		$defender_attack	= 0;
		foreach ($attackers as $fleetId => $fleetData) {
			$attacker[$fleetId] = array();

			foreach ($fleetData['detail'] as $ship => $ammount) {
				if ($ammount <= 0) {
					$attacker[$fleetId][$ship] = 0;
					continue;
				}

				$defender_moc = $ammount * ($defenseDamage['total'] * $attackPct[$fleetId]) / $attackAmount[$fleetId];
			
				if(isset($FR[$ship])) {
					foreach($FR[$ship] as $shooter => $shots) {
						foreach($defenseArray as $defId => $frDef) {
							if($frDef[$shooter]['att'] <= 0 || $attackAmount[$fleetId] <= 0) continue;

							if ($shooter == 214 || $shooter == 216 || $shooter == 218) $defenseAmount['total'] /= 5;

							$defender_moc += $frDef[$shooter]['att'] * ($shots-1) / ($ammount / $attackAmount[$fleetId] * $attackPct[$fleetId]);

							$defenseAmount['total'] += $defenders[$defId]['def'][$shooter] * ($shots-1);
						}
					}
				}
				$defender_attack	+= $defender_moc;
				
				if (($attackArray[$fleetId][$ship]['def'] / $ammount) >= $defender_moc) {
					$attacker[$fleetId][$ship] = round($ammount);
					$attacker_shield += $defender_moc;
					continue;
				}
				
				$max_removePoints = floor($ammount * $defenseAmount['total'] / $attackAmount[$fleetId] * $attackPct[$fleetId]);

				$attacker_shield += min($attackArray[$fleetId][$ship]['def'], $defender_moc);
				$defender_moc 	 -= min($attackArray[$fleetId][$ship]['def'], $defender_moc);

				$ile_removePoints = max(min($max_removePoints, $ammount * min($defender_moc / $attackArray[$fleetId][$ship]['shield'] * (rand(50, 200) / 100), 1)), 0);

				$attacker[$fleetId][$ship] = max(ceil($ammount - $ile_removePoints), 0);
				$defenseAmount['total'] = $defenseAmount['original'];
			}
		}

		$defender 				= array();
		$defender_shield 	= 0;
		$attacker_attack	= 0;

		foreach ($defenders as $defenderId => $defenderData) {
			$defender[$defenderId] = array();

			foreach($defenderData['def'] as $defense => $ammount) {
				$ammount = round($ammount);

				if ($ammount <= 0) {
					$defender[$defenderId][$defense] = 0;
					continue;
				}

				$attacker_moc = $ammount * ($attackDamage['total'] * $defensePct[$defenderId]) / $defenseAmount[$defenderId];
				if (isset($FR[$defense])) {
					foreach($FR[$defense] as $shooter => $shots) {
						foreach($attackArray as $fID => $rfatt) {
							if ($rfatt[$shooter]['att'] <= 0 || $defenseAmount[$defenderId] <= 0 ) continue;
							if ($shooter == 214 || $shooter == 216 || $shooter == 218 || $shooter == 223 || $shooter == 224) $attackAmount['total'] /= 5;
							$attacker_moc += $rfatt[$shooter]['att'] * ($shots-1) / ($ammount / $defenseAmount[$defenderId] * $defensePct[$defenderId]);
							$attackAmount['total'] += $attackers[$fID]['detail'][$shooter] * ($shots-1);
						}
					}
				}
				
				$attacker_attack	+= $attacker_moc;
				
				if (($defenseArray[$defenderId][$defense]['def'] / $ammount) >= $attacker_moc) {
					$defender[$defenderId][$defense] = round($ammount);
					$defender_shield += $attacker_moc;
					continue;
				}
	
				$max_removePoints = floor($ammount * $attackAmount['total'] / $defenseAmount[$defenderId] * $defensePct[$defenderId]);
				$defender_shield += min($defenseArray[$defenderId][$defense]['def'], $attacker_moc);
				$attacker_moc 	 -= min($defenseArray[$defenderId][$defense]['def'], $attacker_moc);
				
				$ile_removePoints = max(min($max_removePoints, $ammount * min($attacker_moc / $defenseArray[$defenderId][$defense]['shield'] * (rand(50, 200) / 100), 1)), 0);

				$defender[$defenderId][$defense] = max(ceil($ammount - $ile_removePoints), 0);
				$attackAmount['total'] = $attackAmount['original'];
			}
		}


		$rounds[$round]['attack'] 			= $attacker_attack;
		$rounds[$round]['defense'] 			= $defender_attack;
		$rounds[$round]['attackShield'] = $attacker_shield;
		$rounds[$round]['defShield'] 		= $defender_shield;

		foreach ($attackers as $fleetId => $attackerData) {
			$attackers[$fleetId]['detail'] =  array_map('round', $attacker[$fleetId]);
		}

		foreach ($defenders as $fleetId => $defenderData) {
			$defenders[$fleetId]['def'] = array_map('round', $defender[$fleetId]);
		}
	}

	if ($attackAmount['total'] <= 0 && $defenseAmount['total'] > 0) {
		$won = "r"; // defensor
	} elseif ($attackAmount['total'] > 0 && $defenseAmount['total'] <= 0) {
		$won = "a"; // attacker
	} else {
		$won = "w"; // draw
	}

	foreach ($attackers as $fleetId => $fleetData) {	// flotte attaquant en CDR
		foreach ($fleetData['detail'] as $ship => $ammount) {
			$ammount = round($ammount);

			$PERDIDAS['attacker'] -= $pricelist[$ship]['metal'] * $ammount ;
			$PERDIDAS['attacker'] -= $pricelist[$ship]['crystal'] * $ammount ;
			$PERDIDAS['attacker'] -= $pricelist[$ship]['norio'] * $ammount ;

			$A_MATERIALS['metal'] 		-= $pricelist[$ship]['metal'] * $ammount ;
			$A_MATERIALS['crystal'] 	-= $pricelist[$ship]['crystal'] * $ammount ;
			$A_MATERIALS['norio'] 		-= $pricelist[$ship]['norio'] * $ammount ;
		}
	}

	$D_MATERIALS_DEFENSE = array('metal' => 0, 'crystal' => 0, 'norio' => 0);

	foreach ($defenders as $defenderId => $defenderData) {
		foreach ($defenderData['def'] as $defense => $ammount) {
			$ammount = round($ammount);

			if ($defense < 300) {						
				$D_MATERIALS['metal'] 	 	-= $pricelist[$defense]['metal'] * $ammount ;
				$D_MATERIALS['crystal'] 	-= $pricelist[$defense]['crystal'] * $ammount ;
				$D_MATERIALS['norio'] 	 	-= $pricelist[$defense]['norio'] * $ammount ;

				$PERDIDAS['defender'] -= $pricelist[$defense]['metal'] * $ammount ;
				$PERDIDAS['defender'] -= $pricelist[$defense]['crystal'] * $ammount ;
				$PERDIDAS['defender'] -= $pricelist[$defense]['norio'] * $ammount ;
			} else {									// devolucion de defensas
				$PERDIDAS['defender'] -= $pricelist[$defense]['metal'] * $ammount ;
				$PERDIDAS['defender'] -= $pricelist[$defense]['crystal'] * $ammount ;
				$PERDIDAS['defender'] -= $pricelist[$defense]['norio'] * $ammount ;

				$lost = $startDef[$defense] - $ammount;
				$giveback = round($lost * (rand(56, 84) / 100));

				$defenders[$fleetID]['def'][$defense] = intval($defenders[$fleetID]['def'][$defense]);
				$defenders[$fleetID]['def'][$defense] += $giveback;

				$D_MATERIALS_DEFENSE['metal'] 	 += $pricelist[$defense]['metal'] * ($lost - $giveback);
				$D_MATERIALS_DEFENSE['crystal'] += $pricelist[$defense]['crystal'] * ($lost - $giveback);
				$D_MATERIALS_DEFENSE['norio'] += $pricelist[$defense]['norio'] * ($lost - $giveback);
			}
		}
	}

	$A_MATERIALS['metal']		= max($A_MATERIALS['metal'], 0);
	$A_MATERIALS['crystal']	= max($A_MATERIALS['crystal'], 0);
	$A_MATERIALS['norio']		= max($A_MATERIALS['norio'], 0);

	$D_MATERIALS['metal']		= max($D_MATERIALS['metal'], 0);
	$D_MATERIALS['crystal']	= max($D_MATERIALS['crystal'], 0);
	$D_MATERIALS['norio']		= max($D_MATERIALS['norio'], 0);

	$PERDIDAS['attacker']	= max($PERDIDAS['attacker'], 0);
	$PERDIDAS['defender']	= max($PERDIDAS['defender'], 0);
	
	$totalLost = array('att' => $PERDIDAS['attacker'], 'def' => $PERDIDAS['defender']);

	$debAttMet = ($A_MATERIALS['metal'] * ($fleet_debris / 100));
	$debAttCry = ($A_MATERIALS['crystal'] * ($fleet_debris / 100));
	$debAttNor = ($A_MATERIALS['norio'] * ($fleet_debris / 100));

	$debDefMet = ($D_MATERIALS['metal'] * ($fleet_debris / 100)) + ($D_MATERIALS_DEFENSE['metal'] * ($def_debris / 100));
	$debDefCry = ($D_MATERIALS['crystal'] * ($fleet_debris / 100)) + ($D_MATERIALS_DEFENSE['crystal'] * ($def_debris / 100));
	$debDefNor = ($D_MATERIALS['norio'] * ($fleet_debris / 100)) + ($D_MATERIALS_DEFENSE['norio'] * ($def_debris / 100));

	return array(
		'won' => $won, 
		'debree' => array(
			'att' => array(
				$debAttMet, 
				$debAttCry, 
				$debAttNor
			), 
			'def' => array(
				$debDefMet, 
				$debDefCry, 
				$debDefNor
			)
		), 
		'rw' => $rounds, 
		'lost' => $totalLost
	);
}
?>