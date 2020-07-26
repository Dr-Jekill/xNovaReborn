<div id="planet_menu" class="misiones_top">
	<div id="planet_menu_header"><a href="javascript:void(0)" id="planet_menu_link"><h3>Mis Planetas</h3></a></div>
	<div id="planet_menu_content"{if $is_pmenu == 0} style="display:none;"{/if}>
		<ul id="planet_list">
			{foreach key=PlanetID item=PlanetInfo from=$PlanetMenu}
				<li class="planet_spot">
					<div class="planet_data">
						<a href="{$PlanetInfo.url}" title="{$PlanetInfo.name}">
							<img src="styles/theme/{$Raza_skin}/planeten/small/s_{$PlanetInfo.image}.jpg" height="35" width="35" alt="{$PlanetInfo.name}"  data-type="static" data-role="PGtooltip" data-direction="left" data-content='
							<table style="width:100%; text-align:left;" class="msgTooltip">

							<tr>
							<td><b>{$PlanetInfo.name} [{$PlanetInfo.galaxy}:{$PlanetInfo.system}:{$PlanetInfo.planet}]</b></td>
							</tr>
							<tr>
							<td>{$PlanetInfo.planet_diameter} {$PlanetInfo.ov_distance_unit} ({$PlanetInfo.planet_field_current}/{$PlanetInfo.planet_field_max})</td>
							</tr>
							<tr>
							<td>de {$PlanetInfo.planet_temp_min}{$PlanetInfo.ov_temp_unit} a {$PlanetInfo.planet_temp_max}{$PlanetInfo.ov_temp_unit}</td>
							</tr>
							<tr>
							<td><a href="?page=overview&cp={$PlanetID}">{$lm_overview}</a></td>
							</tr>
							<tr>
							<td><a href="game.php?page=resources&cp={$PlanetID}">{$lm_resources}</a></td>
							</tr>
							<tr>
							<td><a href="?page=buildings&cp={$PlanetID}">{$lm_buildings}</a></td>
							</tr>
							<tr>
							<td><a href="?page=buildings&amp;mode=research&cp={$PlanetID}">{$lm_research}</a></td>
							</tr>
							<tr>
							<td><a href="?page=buildings&amp;mode=fleet&cp={$PlanetID}">{$lm_shipshard}</a></td>
							</tr>
							<tr>
							<td><a href="?page=buildings&amp;mode=defense&cp={$PlanetID}">{$lm_defenses}</a></td>
							</tr>
							
							</table>
			
			
							'/>
							<br />
							{if $PlanetID == $current_pid}
								<span style="color:#FFFF00;" class="planetname"><b>{$PlanetInfo.name}</b></span>
								<br /><span style="color:#FE9A2E;"><b>[{$PlanetInfo.galaxy}:{$PlanetInfo.system}:{$PlanetInfo.planet}]</b></span>
							{else}
							{if $PlanetInfo.ptype == 3}
								<span style="color:#CCCCCC">
							{else}
								<span style="color:#2E9AFE">
							{/if}
							{$PlanetInfo.name}</span>
							<br />
								<span style="color:#58FA58;">[{$PlanetInfo.galaxy}:{$PlanetInfo.system}:{$PlanetInfo.planet}]</span>
							{/if}
							<br /><span id="planet_{$PlanetID}"></span>
						</a>
							
							{if !empty($PlanetInfo.moon)}
								<div class="moon_planet">
									<a href="{$PlanetInfo.moon.url}" title="{$PlanetInfo.moon.name}">
										<img src="styles/theme/{$Raza_skin}/planeten/small/s_{$PlanetInfo.moon.image}.jpg" height="35" width="35" alt="{$PlanetInfo.moon.name}"  data-type="static" data-role="PGtooltip" data-direction="left" data-content='				
											<table style="width:100%; text-align:left;" class="msgTooltip">
											<tr>
											<td><a href="?page=overview&cp={$PlanetInfo.moon.id}">{$lm_overview}</a></td>
											</tr>
											<tr>
											<td><a href="game.php?page=resources&cp={$PlanetInfo.moon.id}">{$lm_resources}</a></td>
											</tr>
											<tr>
											<td><a href="?page=buildings&cp={$PlanetInfo.moon.id}">{$lm_buildings}</a></td>
											</tr>
											<tr>
											<td><a href="?page=buildings&amp;mode=research&cp={$PlanetInfo.moon.id}">{$lm_research}</a></td>
											</tr>
											<tr>
											<td><a href="?page=buildings&amp;mode=fleet&cp={$PlanetInfo.moon.id}">{$lm_shipshard}</a></td>
											</tr>
											<tr>
											<td><a href="?page=buildings&amp;mode=defense&cp={$PlanetInfo.moon.id}">{$lm_defenses}</a></td>
											</tr>
											
											</table>
											
											
															'/>
										<br />
										{if $PlanetID == $current_pid}
											<span style="color:#FFFF00;" class="planetname"><b>{$PlanetInfo.moon.name}</b></span>
										{else}
											{if $PlanetInfo.moon.ptype == 3}
												<span style="color:#CCCCCC">
											{/if}
										{/if}
									</a>
								</div>
							{/if}


						
					</div>
				</li>
			{/foreach}
		</ul>
	</div>
</div>
<script type="text/javascript">
planetmenu	= {$Scripttime};
</script>