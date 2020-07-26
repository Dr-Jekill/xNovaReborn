{include file="overall_header.tpl"}
<body id="mercado">
<div id="tooltip" class="tip"></div>
<div class="contenido_big">
<div id="cajaBG">
    <div id="caja">
<div id="topnav" class="header_normal"> 	
		{include file="overall_topnav.tpl"}	
	</div> 

	<div id="message-wrapper">
		<a class=" comm_menu messages {if $new_message > 0}unread{/if} js_hideTipOnMobile" href="?page=messages" >
                {if $new_message > 0}
                	<span class="new_msg_count" data-role="PGtooltip" data-direction="top" data-content="<table>Tiene {$new_message} mensaje(s) sin leer</table>">{$new_message}</span>
                {else}
                	<span class="mens"  data-role="PGtooltip" data-direction="top" data-content="<table>No tiene mensajes sin leer</table>"></span>
                {/if}
		</a>
		{if !CheckModule(7)}
		<a class=" comm_menu chats {if $new_message > 0}unread{/if} js_hideTipOnMobile" href="?page=chat" >
                {if $new_chat > 0}
                	<span class="new_msg_count" data-role="PGtooltip" data-direction="top" data-content="<table>Tiene {$new_message} mensaje(s) sin leer</table>">{$new_chat}</span>
                {else}
                	<span class="mens"  data-role="PGtooltip" data-direction="top" data-content="<table>Chat</table>"></span>
                {/if}
		</a>
		{/if}
		<div id="messages_collapsed">
	        <div id="eventboxFilled" class="eventToggle" style="display: none;">
	    		<a id="js_eventDetailsClosed" class="tooltipRight js_hideTipOnMobile" href="javascript:void(0);" title="Más detalles"></a>
	    		<a id="js_eventDetailsOpen" class="tooltipRight open js_hideTipOnMobile" href="javascript:void(0);" title="Menos detalles"></a>
		    </div>

			<div id="eventboxLoading" class="textCenter textBeefy" style="display: none;">
				<img height="16" width="16" src="">cargando...
			</div>
			<div id="eventboxBlank" class="textCenter" style="line-height: 20px;"> No hay movimientos de flota</div>           
	 	</div>
		</br class="clearfloat">
	</div>


{include file="left_menu.tpl"}
<div id="contenidoMostrado">   

<div id="galaxyHeader">
    <form action="?page=galaxy&amp;mode=1" name="galaform" method="post" id="galaxy_form">
    	<input type="hidden" id="auto" value="dr" />
        <span class="galaxy_icons galaxy" title=""></span>
        <span class="galaxy_icons prev"  onClick="galaxy_submit('galaxyLeft')"></span>
        <input id="galaxy_input" class="hideNumberSpin" maxlength="3" type="text" pattern="[0-9]*" value="{$galaxy}" name="galaxy" tabindex="2" onfocus="clearInput(this);" onkeyup="checkIntInput(this, 1, 5)" onkeypress="return submitOnEnter(event);">
        <span class="galaxy_icons next" onClick="galaxy_submit('galaxyRight')"></span>
        <span class="galaxy_icons solarsystem" title=""></span>
        <span class="galaxy_icons prev"  onClick="galaxy_submit('systemLeft')"></span>
        <input id="system_input" class="hideNumberSpin" maxlength="3" type="text" pattern="[0-9]*" value="{$system}" tabindex="2" name="system" onfocus="clearInput(this);" onkeyup="checkIntInput(this, 1, 499)" onkeypress="return submitOnEnter(event);">
        <span class="galaxy_icons next" onClick="galaxy_submit('systemRight')"></span>
        <input class="btn_blue" type="submit" value="{$gl_show}" />
        <a href="?page=fleet&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$mplanet + 1}&amp;planettype=1&amp;target_mission=15" class="btn_blue float_right" id="expeditionbutton" style="padding: 0 15px 0 15px; height: 15px;">Expedicion</a>
    </form>
</div>


<div id="elCosoxD">
<div id="eins_small">
    <div style="border: 1px solid black ;    width: 98.5%;" class="galaxy_table">

		<table id="galaxia" width="100%" style="margin-left: 0px;" cellpadding="0" cellspacing="0">

			<thead>
				<tr class="info info_header ct_head_row">
		            <th colspan="11">
		                <span id="probes">
		                    Sonda:
		                    <span id="probeValue">{$spyprobes}</span>
		                </span>
		                <span id="recycler">
		                    Reciclador:
		                    <span id="recyclerValue">{$recyclers}</span>
		                </span>
		                <span id="recycler">
		                    M-Reciclador:
		                    <span id="recyclerValue">{$grecyclers}</span>
		                </span>
		                <span id="rockets">
		                    M.Interplanet.:
		                    <span id="missileValue">{$currentmip}</span>
		                </span>
		                <span id="slots">
		                    Espacios de flota:
		                    <span id="slotValue">
		                        <span id="slotUsed">{$maxfleetcount}</span>/{$fleetmax}
		                    </span>
		                </span>

		                <span class="fright">
		                  <!--  <span id="filter_empty" class="filter " onclick="filterToggle(event);">E</span>
		                    <span id="filter_inactive" class="filter " onclick="filterToggle(event);">I</span>
		                    <span id="filter_newbie" class="filter " onclick="filterToggle(event);">N</span>
		                    <span id="filter_strong" class="filter " onclick="filterToggle(event);">A</span>
		                    <span id="filter_vacation" class="filter " onclick="filterToggle(event);">V</span>-->
		                </span>
		            </th>
		        </tr>
		 

				<tr id="galaxyheadbg2" class="ct_head_row">
		            <th class="first" style="width: 5px; overflow: hidden;">#</th>
		            <th style="width: 70px; overflow: hidden;">Planeta</th>
		            <th style="width: 129px; padding-right: 5px;">Nombre</th>
		            <th class="text_moon" style="width: 38px; padding-right: 5px;">Luna</th>
		            <th style="width: 38px; padding-right: 5px;">Escombros</th>
		            <th style="width: 130px; padding-right: 5px;">Jugador (Estado)</th>
		            <th style="width: 108px; padding-right: 5px;">Alianza</th>
		            <th class="last" style="width: 75px;">Acción</th>
		        </tr>
		    </thead> 
		    <tbody>
			    {foreach key=planet item=GalaxyRow from=$GalaxyRows}
	<tr>
	<td class="sombreao"><a href="#">{$planet}</a></td>
	
	{if is_array($GalaxyRow)}
	{if $GalaxyRow.planet}
	<td><a style="display: inline-block;" data-role="PGtooltip" data-type="static" data-direction="top" data-content="<table style='width:220px'>
	<tr>
	<th colspan='2'>{$gl_planet} {$GalaxyRow.planet.name} [{$galaxy}:{$system}:{$planet}]</th>
	</tr>
	<tr>
	<td>
	{if $GalaxyRow.planet.spionage}
	<a href='javascript:doit(6,{$galaxy},{$system},{$planet},1,{$spio_anz});'>{$GalaxyRow.planet.spionage}</a>
	<br /><br />
	{/if}
	{if $GalaxyRow.planet.phalax}
	<a href='javascript:OpenPopup(&quot;?page=phalanx&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&quot;, &quot;&quot;, 640, 510);'>{$GalaxyRow.planet.phalax}</a>
	<br />
	{/if}
	{if $GalaxyRow.planet.attack}
	<a href='?page=fleet&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&amp;target_mission=1'>{$GalaxyRow.planet.attack}</a>
	<br />
	{/if}
	{if $GalaxyRow.planet.stayally}
	<a href='?page=fleet&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&amp;target_mission=5'>{$GalaxyRow.planet.stayally}</a>
	<br />
	{/if}
	{if $GalaxyRow.planet.stay}<a href='?page=fleet&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&amp;target_mission=4'>{$GalaxyRow.planet.stay}</a>
	<br />
	{/if}
	{if $GalaxyRow.planet.transport}
	<a href='?page=fleet&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=1&amp;target_mission=3'>{$GalaxyRow.planet.transport}</a>
	<br />
	{/if}
	{if $GalaxyRow.planet.missile}<a href='?page=galaxy&amp;mode=2&amp;galaxy={$galaxy}&amp;system={$system}&amp;gl_cp={$planet}'>{$GalaxyRow.planet.missile}</a>
	<br />
	{/if}
	</td>
	</tr></table>"><img src="styles/theme/{$Raza_skin}/planeten/small/s_{$GalaxyRow.planet.image}.jpg" id="plan{$planet}"  height="25" width="25px" alt="" /></a></td>
	{/if}
	
	<td style="white-space: nowrap;"  class="sombreao">{$GalaxyRow.planetname.name}</td>
	
	<td style="white-space: nowrap;">
	{if $GalaxyRow.moon}
	<a style="display: inline-block;" data-role="PGtooltip" data-type="static" data-direction="top" data-content="<table style='width:240px'>
	<tr>
	<th colspan='2'>{$gl_moon} {$GalaxyRow.moon.name} [{$galaxy}:{$system}:{$planet}]</th>
	</tr>
	<tr>
	<td style='width:80'>
	<img src='styles/theme/{$Raza_skin}/planeten/small/s_mond.jpg' height='75' style='width:75' />
	</td>
	<td>
	<table style='width:100%'>
	<tr><th colspan='2'>{$gl_features}</th>
	</tr>
	<tr>
	<td>{$gl_diameter}</td>
	<td>{$GalaxyRow.moon.diameter}</td>
	</tr>
	<tr>
	<td>{$gl_temperature}</td>
	<td>{$GalaxyRow.moon.temp_min}</td>
	</tr>
	<tr><th colspan=2>{$gl_actions}</th>
	</tr>
	<tr>
	<td colspan='2'>
	{if $GalaxyRow.moon.attack}
	<a href='?page=fleet&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=1'>{$GalaxyRow.moon.attack}</a>
	<br />
	{/if}<a href='?page=fleet&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=3'>{$GalaxyRow.moon.transport}</a>
	{if $GalaxyRow.moon.stay}
	<br />
	<a href='?page=fleet&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=4'>{$GalaxyRow.moon.stay}</a>
	{/if}
	{if $GalaxyRow.moon.stayally}
	<br />
	<a href='?page=fleet&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=5'>{$GalaxyRow.moon.stayally}</a>
	{/if}
	{if $GalaxyRow.moon.spionage}
	<br />
	<a href='javascript:doit(6,{$galaxy},{$system},{$planet},3,{$spio_anz});'>{$GalaxyRow.moon.spionage}</a>
	{/if}
	{if $GalaxyRow.moon.destroy}
	<br /><br />
	<a href='?page=fleet&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$planet}&amp;planettype=3&amp;target_mission=9'>{$GalaxyRow.moon.destroy}</a>
	<br />
	{/if}
	</td>
	</tr>
	</table>
	</td>
	</tr>
	</table>"><img src="styles/theme/{$Raza_skin}/imagenes/luna.png" height="22" width="22" alt="{$GalaxyRow.moon.name}" /></a>
	{else}
	<img src="styles/theme/{$Raza_skin}/imagenes/luna_o.png" height="22" width="22" alt="{$GalaxyRow.moon.name}" />
	{/if}
	</td>
	
	
	
	<td style="white-space: nowrap;">
	{if $GalaxyRow.derbis}
	<a style="display: inline-block;" data-role="PGtooltip" data-direction="top" data-type="static" data-content="<table style='width:240px'>
	<tr>
	<th colspan='2'>{$gl_debris_field} [{$galaxy}:{$system}:{$planet}]</th>
	</tr>
	<tr>
	<td style='width:80'><img src='styles/theme/{$Raza_skin}/planeten/debris.jpg' height='75' style='width:75' />
	</td>
	<td><table style='width:100%'>
	<tr>
	<th colspan='2'>{$gl_resources}:</th>
	</tr>
	<tr>
	<td>{$Metal}: </td>
	<td>{$GalaxyRow.derbis.metal}</td>
	</tr>
	<tr>
	<td>{$Crystal}: </td>
	<td>{$GalaxyRow.derbis.crystal}</td>
	</tr>
	<tr>
	<th colspan='2'>{$gl_actions}</th>
	</tr>
	<tr>
	<td colspan='2'>
	<a href='javascript:doit(8,{$galaxy},{$system},{$planet}, 2, &quot;{$GalaxyRow.derbis.GRecSended}|{$GalaxyRow.derbis.RecSended}&quot;);'>{$gl_collect}</a>
	</td>
	</tr>
	</table>
	</td>
	</tr>
	</table>"><img src="styles/theme/{$Raza_skin}/imagenes/escombro.png" height="22" width="22" alt="" /></a>
	{else}
	<img src="styles/theme/{$Raza_skin}/imagenes/escombro_o.png" height="22" width="22" alt="" />
	{/if}
	</td>
	
	
	<td  class="sombreao">
	<a style="display: inline-block;" data-role="PGtooltip" data-direction="top" data-type="static" data-content="<table style='width:240px'>
	<tr>
	<th colspan='2'>{$GalaxyRow.user.playerrank}</th>
	</tr>
	<tr>
	{if $GalaxyRow.user.isown}
	<tr>
	<td>
	<a href='javascript:OpenPopup(&quot;?page=buddy&amp;mode=2&amp;u={$GalaxyRow.user.id}&quot;, &quot;&quot;, 720, 300);'>{$gl_buddy_request}</a>
	</td>
	</tr>
	<td><a href='#' onclick='return Dialog.Playercard({$GalaxyRow.user.id}, &quot;{$GalaxyRow.user.username}&quot;);'>{$gl_playercard}</a>
	</td>
	</tr>
	{/if}
	<tr>
	<td><a href='?page=statistics&amp;who=1&amp;start={$GalaxyRow.user.rank}'>{$gl_see_on_stats}</a>
	</td>
	</tr>
	</table>"><b>{$GalaxyRow.user.Systemtatus}{$GalaxyRow.user.username}{if $GalaxyRow.user.Systemtatus}</b>
	{/if}
	<b>{$GalaxyRow.user.Systemtatus2}</b>
	</a>
	</td>
	
	<td style="white-space: nowrap;"  class="sombreao">
	{if $GalaxyRow.ally}
	<a style="display: inline-block;" data-role="PGtooltip" data-direction="top" data-type="static" data-content="<table style='width:240px'>
	<tr>
	<th>
	{$gl_alliance} {$GalaxyRow.ally.name} {$GalaxyRow.ally.member}
	</th>
	</tr>
	<td>
	<table>
	<tr>
	<td>
	<a href='?page=alliance&amp;mode=ainfo&amp;a={$GalaxyRow.ally.id}'>{$gl_alliance_page}</a>
	</td>
	</tr>
	<tr>
	<td>
	<a href='?page=statistics&amp;start={$GalaxyRow.ally.rank}&amp;who=2'>{$gl_see_on_stats}</a>
	</td>
	</tr>
	{if $GalaxyRow.ally.web}
	<tr>
	<td>
	<a href='{$GalaxyRow.ally.web}' target='allyweb'>{$gl_alliance_web_page}
	</td>
	</tr>
	{/if}
	</table>
	</td>
	</table>">
	{if $GalaxyRow.ally.inally == 2}
	<span style="color:#44a5ff"><b>{$GalaxyRow.ally.tag}</b></span>
	{elseif $GalaxyRow.ally.inally == 1}
	<span class="allymember">{$GalaxyRow.ally.tag}</span>
	{else}
	{$GalaxyRow.ally.tag}
	{/if}
	</a>
	{else}
	-
	{/if}
	</td>
	
	
	<td style="white-space: nowrap;">
	{if $GalaxyRow.action}
	{if $GalaxyRow.action.esp}
	<a href="javascript:doit(6,{$galaxy},{$system},{$planet},1,{$spio_anz});">
	<img src="styles/theme/{$Raza_skin}/imagenes/otros/e.gif" title="{$gl_spy}" alt="" />
	</a>
	{/if}
	{if $GalaxyRow.action.message}
	&nbsp;
	<a href="#" onclick="return Dialog.PM({$GalaxyRow.user.id});">
	<img src="styles/theme/{$Raza_skin}/imagenes/otros/m.gif" title="{$write_message}" alt="" />
	</a>
	{/if}
	{if $GalaxyRow.action.buddy}
	&nbsp;
	<a href="javascript:OpenPopup('?page=buddy&amp;mode=2&amp;u={$GalaxyRow.user.id}', '', 720, 300);"> 
	<img src="styles/theme/{$Raza_skin}/imagenes/otros/b.gif" title="{$gl_buddy_request}" alt="" />
	</a>
	{/if}
	{if $GalaxyRow.action.missle}
	&nbsp;
	<a href="?page=galaxy&amp;mode=2&amp;galaxy={$galaxy}&amp;system={$system}&amp;gl_cp={$planet}">
	<img src="styles/theme/{$Raza_skin}/imagenes/otros/r.gif" title="{$gl_missile_attack}" alt="" />
	</a>{/if}
	{else}
	-
	{/if}
	</td>
	{elseif empty($GalaxyRow)}
	<td><img style="display: inline-block;" data-role="PGtooltip" data-direction="top" data-content="{$inavitado}" src="styles/theme/{$Raza_skin}/imagenes/planeta_o.png" height="30" width="40" /></td><td style="white-space: nowrap;">

	-

	</td><td style="white-space: nowrap;"><img src="styles/theme/{$Raza_skin}/imagenes/luna_o.png" height="22" width="22" /></td><td style="white-space: nowrap;"><img src="styles/theme/{$Raza_skin}/imagenes/escombro_o.png" height="22" width="22" /></td><td>-</td><td>-</td><td style="white-space: nowrap;">

	-

	</td>
	{else}
	<td><img style="display: inline-block;" data-role="PGtooltip" data-direction="top" data-content="{$inavitado}" src="styles/theme/{$Raza_skin}/imagenes/planeta_o.png" height="30" width="40" /></td><td style="white-space: nowrap;">-</td><td style="white-space: nowrap;"><img src="styles/theme/{$Raza_skin}/imagenes/luna_o.png" height="22" width="22" /></td><td style="white-space: nowrap;"><img src="styles/theme/{$Raza_skin}/imagenes/escombro_o.png" height="22" width="22" /></td><td>-</td><td>-</td><td style="white-space: nowrap;">-</td>
	{/if}
	</tr>
	{/foreach}
			</tbody>
			<tr class="info ct_foot_row" style="height: 30px;">
				<td colspan="11"></td>
			</tr>
			<tr class="info ct_foot_row" style="height: 30px;">
                <td colspan="11">
                    <span id="legend">
                        <a href="javascript: void(0);" class="tooltipRel tooltipClose" rel="legendTT">
                            <span class="icon icon_info"  style="display: inline-block;" data-role="PGtooltip" data-direction="top" data-content="
                                <table style='width:240px'>
									<tr>
									<th colspan='2'>{$gl_legend}</td>
									</tr>
									<tr>
									<td style='width:220px'>{$gl_strong_player}</td>
									<td><span class='strong'>{$gl_s}</span></td>
									</tr>
									<tr>
									<td style='width:220px'>{$gl_week_player}</td>
									<td><span class='noob'>{$gl_w}</span></td>
									</tr>
									<tr>
									<td style='width:220px'>{$gl_vacation}</td>
									<td><span class='vacation'>{$gl_v}</span>
									</td>
									</tr>
									<tr><td style='width:220px'>{$gl_banned}</td>
									<td><span class='banned'>{$gl_b}</span></td>
									</tr>
									<tr>
									<td style='width:220px'>{$gl_inactive_seven}</td>
									<td><span class='inactive'>{$gl_i}</span></td>
									</tr>
									<tr><td style='width:220px'>{$gl_inactive_twentyeight}</td>
									<td><span class='longinactive'>{$gl_I}</span></td>
									</tr>
								</table>">
							</span>
                        </a>
                    </span>
                    <span id="colonized">{$planetcount}</span>
                    <br class="clearfloat">
                </td>
            </tr>
		</table>	
	</div>
	
	<script type="text/javascript">
		status_ok		= '{$gl_ajax_status_ok}';
		status_fail		= '{$gl_ajax_status_fail}';
		MaxFleetSetting = {$settings_fleetactions} - 1;
	</script>
</div>
<br>
<br>
<br>
</div>	
<div class="new_footer"></div>


	{if $mode == 2}
	<div class="back">
		<div class="lanzamisil">
			<div class="close" onclick="$(this).parent().parent().hide();">X</div>
			<div class="target_bg"></div>
			<div class="target">
				<span><b>{$gl_missil_launch} [{$galaxy}:{$system}:{$gl_cp}]</b></span>
			</div>
			<div class="form_target">
				<form action="?page=missiles&amp;galaxy={$galaxy}&amp;system={$system}&amp;planet={$gl_cp}&amp;type={$type}" method="POST">
					<div class="form_group">
						<label for="">{$missile_count}</label>
						<input class="campo_comun" type="text" name="SendMI" size="2" maxlength="7">
					</div>
					<div class="form_group">
						<label for="">{$gl_objective}:</label>
						{html_options name=Target options=$MissleSelector}
					</div>
					<input class="btn_red" type="submit" name="aktion" value="{$gl_missil_launch_action}" style="margin-top: 10px;display: block;width: 100%;">
				</form>
			</div>
		</div>
	</div>
	
    {/if}



<br /><br /><br />	
</div>
{include file="planet_menu.tpl"}

</div>	
</div>	
</div>	
</div>

{include file="overall_footer.tpl"}