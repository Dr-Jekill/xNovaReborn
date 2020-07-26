{include file="adm/overall_header.tpl"}
<br>
<center>
<form action="" method="post">
<input type="hidden" name="opt_save" value="1">
<table width="70%" cellpadding="2" cellspacing="2">
<tr>
	<th colspan="2"><h3>{$se_server_parameters}</h3></th>
	<th colspan="1" width="5%">(?)</th>
</tr><tr>
	<td>{$se_name}</td>
	<td><input name="game_name"  value="{$game_name}" type="text" maxlength="60"></td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_uni_name}</td>
	<td><input name="uni_name" value="{$uni_name}" type="text" maxlength="60"></td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_lang}</td>
	<td>{html_options name=lang options=$Selector.langs selected=$lang}</td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_general_speed}</td>
	<td><input name="game_speed" value="{$game_speed}" type="text" maxlength="5"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_normal_speed}"></td>
</tr><tr>
	<td>{$se_fleet_speed}</td>
	<td><input name="fleet_speed" value="{$fleet_speed}" type="text" maxlength="5"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt=""class="tooltip" name="{$se_normal_speed_fleet}"></td>
</tr><tr>
	<td>{$se_resources_producion_speed}</td>
	<td><input name="resource_multiplier" value="{$resource_multiplier}" type="text"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_normal_speed_resoruces}"></td>
</tr><tr>
	<td>{$se_halt_speed}</td>
	<td><input name="halt_speed" value="{$halt_speed}" type="text"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_normal_speed_halt}"></td>
</tr><tr>
	<td>{$se_forum_link}</td>
	<td><input name="forum_url" size="60" maxlength="254" value="{$forum_url}" type="text"></td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_server_op_close}<br></td>
	<td><input name="closed"{if $game_disable == '1'} checked="checked"{/if} type="checkbox"></td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_server_status_message}<br></td>
	<td><textarea name="close_reason" cols="80" rows="5">{$close_reason}</textarea></td>
	<td>&nbsp;</td>
</tr><tr>
	<th colspan="3"><h3>{$se_server_planet_parameters}</h3></th>
</tr><tr>
	<td>{$se_initial_fields}</td>
	<td><input name="initial_fields" maxlength="10" size="10" value="{$initial_fields}" type="text"> {$se_fields} </td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_metal_production}</td>
	<td><input name="metal_basic_income" maxlength="10" size="10" value="{$metal_basic_income}" type="text"> {$se_per_hour}</td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_crystal_production}</td>
	<td><input name="crystal_basic_income" maxlength="10" size="10" value="{$crystal_basic_income}" type="text"> {$se_per_hour}</td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_deuterium_production}</td>
	<td><input name="deuterium_basic_income" maxlength="10" size="10" value="{$deuterium_basic_income}" type="text"> {$se_per_hour}</td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_norio_production}</td>
	<td><input name="norio_basic_income" maxlength="10" size="10" value="{$norio_basic_income}" type="text"> {$se_per_hour}</td>
	<td>&nbsp;</td>
</tr>
<tr>
	<th colspan="3"><h3>{$se_build_parameters}</h3></th>
</tr>
<tr>
	<td>{$se_build_default_queue}</td>
	<td><input name="queue_build_init" size="5" value="{$queue_build_init}" type="text"></td>
	<td></td>
</tr>
<tr>
	<td>{$se_build_commander_queue}</td>
	<td><input name="queue_build_commander" size="5" value="{$queue_build_commander}" type="text"></td>
	<td></td>
</tr>

<tr>
	<th colspan="3"><h3>{$se_research_parameters}</h3></th>
</tr>
<tr>
	<td>{$se_research_default_queue}</td>
	<td><input name="queue_research_init" size="5" value="{$queue_research_init}" type="text"></td>
	<td></td>
</tr>
<tr>
	<td>{$se_research_commander_queue}</td>
	<td><input name="queue_research_commander" size="5" value="{$queue_research_commander}" type="text"></td>
	<td></td>
</tr>

<tr>
	<th colspan="3"><h3>Contenido Descargable</h3></th>
</tr>
<tr>
	<td>{$se_game_sound}<br></td>
	<td><input name="sound"{if $game_sound == '1'} checked="checked"{/if} type="checkbox"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_game_sound_info}" /></td>
</tr>
<tr>
	<td>{$resources_images_text}<br></td>
	<td><input name="resources_images"{if $resources_images == '1'} checked="checked"{/if} type="checkbox"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$resources_images_info}" /></td>
</tr>
<tr>
	<td>{$build_images_text}<br></td>
	<td><input name="build_images"{if $build_images == '1'} checked="checked"{/if} type="checkbox"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$build_images_info}" /></td>
</tr>


<tr>
	<th colspan="3"><h3>{$se_several_parameters}</h3></th>
</tr>
	<tr>
		<td>{$se_min_points_for_alliance}</td>
		<td><input name="points_alliance" size="10" value="{$points_alliance}" type="text"></td>
		<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_min_points_for_alliance_info}" /></td>
	</tr>
	<tr>
		<td>{$se_min_build_time}</td>
		<td><input name="min_build_time" maxlength="2" size="5" value="{$min_build_time}" type="text"></td>
		<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_min_build_time_info}" /></td>
	</tr>
<tr>
	<td>{$se_reg_closed}<br></td>
	<td><input name="reg_closed"{if $reg_closed} checked="checked"{/if} type="checkbox"></td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_verfiy_mail}<br></td>
	<td><input name="user_valid"{if $user_valid} checked="checked"{/if} type="checkbox"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_verfiy_mail_info}"/></td>
</tr><tr>
	<td>{$se_admin_protection}</td>
    <td><input name="adm_attack"{if $adm_attack} checked="checked"{/if} type="checkbox"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_title_admins_protection}"/></td>
</tr><tr>
	<td>{$se_debug_mode}</td>
	<td><input name="debug"{if $debug} checked="checked"{/if} type="checkbox"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_debug_message}"></td>
</tr><tr>
	<td>{$se_ships_cdr}</td>
	<td><input name="Fleet_Cdr" maxlength="3" size="3" value="{$shiips}" type="text" class="trade_charge_procent"id="procent_charge"> %</td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_ships_cdr_message}"></td>
</tr><tr>
	<td>{$se_def_cdr}</td>
	<td><input name="Defs_Cdr" maxlength="3" size="3" value="{$defenses}" type="text" class="trade_charge_procent"id="procent_charge"> %</td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_def_cdr_message}"></td>
</tr><tr>
	<td>{$se_noob_protect}</td>
	<td><input name="noobprotection"{if $noobprot} checked="checked"{/if} type="checkbox"></td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_noob_protect2}</td>
	<td><input name="noobprotectiontime" value="{$noobprot2}" type="text"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_noob_protect_e2}"></td>
</tr><tr>
	<td>{$se_noob_protect3}</td>
	<td><input name="noobprotectionmulti" value="{$noobprot3}" type="text"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_noob_protect_e3}"></td>
</tr><tr>
	<th colspan="3"><h3>{$se_trader_head}</h3></th>
</tr><tr>
    <td>{$se_trader_ships}</td>
    <td><input name="trade_allowed_ships" maxlength="50" size="60" value="{$trade_allowed_ships}" type="hidden"  id="shi">
	
	<ul class="estructuras_c" id="floot" style="display:;">
		{foreach item=Ship from=$Ships}
			<li id="cons_{$Ship.id}" onclick="select('#shi',{$Ship.id})" style="width:80px !important; " data-act="0">
				<div class="intr" id="intr_{$Ship.id}">
					
				</div>
				<div id="con_{$Ship.id}" class="{$Ship.ten}_{$Ship.id}_{$Ship.posible}" style="width:80px; height: 80px; background-image: url('styles/theme/gultra/gebaeude/{$Ship.id}.png'); background-size: cover;">
				<a id="Countdown_{$Ship.id}" class="timer" style="display:none;"></a>
				<img id="contrccion_{$Ship.id}" class="tooltip" style="border-radius: 5px;" name="{$Ship.name}" src="styles/css/images/punto.png" width="80px" height="80px" /></div>
				</a>
			</li>
		{/foreach}
	</ul>


    </td>
	<td>&nbsp;</td>

	


</tr><tr>
    <td>{$se_trader_charge}</td>
    <td><input name="trade_charge" class="trade_charge_procent" maxlength="3" size="3" max="100" value="{$trade_charge}" type="text" id="procent_charge">%</td>
	<td></td>
</tr><tr>
	<th colspan="3"><h3>{$se_news_head}</h3></th>
</tr><tr>
    <td>{$se_news_active}</td>
    <td><input name="newsframe"{if $newsframe} checked="checked"{/if} type="checkbox"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_news_info}"></td>
</tr>
<tr>
	<th colspan="2"><h3>{$se_smtp}</h3></th>
	<th><center><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_smtp_info}"></center></th>
</tr><tr>
	<td>{$se_mail_active}</td>
	<td><input name="mail_active"{if $mail_active} checked="checked"{/if}  type="checkbox"></td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_mail_use}</td>
	<td>{html_options name=mail_use options=$Selector.mail selected=$mail_use}</td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_smtp_sendmail}</td>
	<td><input name="smtp_sendmail" size="20" value="{$smtp_sendmail}" type="text" autocomplete="off"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_smtp_sendmail_info}"></td>
</tr><tr>
	<td>{$se_smail_path}</td>
	<td><input name="smail_path" size="20" value="{$smail_path}" type="text"></td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_smtp_host}</td>
	<td><input name="smtp_host" size="20" value="{$smtp_host}" type="text" autocomplete="off"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_smtp_host_info}"></td>
</tr><tr>
	<td>{$se_smtp_ssl}</td>
	<td>{html_options name=smtp_ssl options=$Selector.encry selected=$smtp_ssl}</td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_smtp_ssl_info}"></td>
</tr><tr>
	<td>{$se_smtp_port}</td>
	<td><input name="smtp_port" size="20" value="{$smtp_port}" type="text" autocomplete="off"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_smtp_port_info}"></td>
</tr><tr>
	<td>{$se_smtp_user}</td>
	<td><input name="smtp_user" size="20" value="{$smtp_user}" type="text" autocomplete="off"></td>
	<td>&nbsp;</td>
</tr><tr>
	<td>{$se_smtp_pass}</td>
	<td><input name="smtp_pass" size="20" value="{$smtp_pass}" type="password" autocomplete="off"></td>
	<td>&nbsp;</td>
</tr><tr>
	<th colspan="3"><h3>{$se_google}</h3></th>
</tr><tr>
    <td>{$se_google_active}</td>
    <td><input name="ga_active"{if $ga_active} checked="checked"{/if}  type="checkbox"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt=""class="tooltip" name="{$se_google_info}"></td>
</tr><tr>
    <td>{$se_google_key}</td>
    <td><input name="ga_key" size="20" maxlength="15" value="{$ga_key}" type="text"></td>
	<td><img src="./styles/images/Adm/i.gif" width="16" height="16" alt="" class="tooltip" name="{$se_google_key_info}"></td>
</tr>
<tr>
	<td colspan="3">
		<center>
			<button class="btn btn_blue" type="submit">{$se_save_parameters}</button>
		</center>
	</td>
</tr>
</table>
</form>
</center>
<script type="text/javascript">

function iniciar(idd){
	actuales = $(idd).val();
	naves	=	actuales.split(',');
	
	$.each(naves, function( index, value ) {
	  
	  $('#intr_'+value).html('<img src="./styles/css/images/check.png" class="che">');
 	  $('#contrccion_'+value).attr('style', 'box-shadow: inset 0px 0px 20px #65d835; border-radius: 5px;');
	  
	  $('#cons_'+value).attr('data-act', '1');
	});
}
iniciar('#shi');



function select(ids,id){
	actuales = $(ids).val().toString();
	estado = $('#cons_'+id).attr('data-act');
	es = '';

	if(estado=='0'){
		if(actuales!=""){
			act = actuales+" "+id;
		}else{
			act = id;
		}
		$('#cons_'+id).attr('data-act', '1');

		$('#intr_'+id).html('<img src="./styles/css/images/check.png" class="che">');
		 $('#contrccion_'+id).attr('style', 'box-shadow: inset 0px 0px 20px #65d835; border-radius: 5px;');
	}
	if(estado=='1'){
		if(actuales!=""){
			act = actuales.replace(id, "_");
			act = act.toString();
			act = act.replace(",_,", " ");
			act = act.replace(",_", "");
			act = act.replace("_,", "");
			act = act.replace("_", "");
		}
		$('#cons_'+id).attr('data-act', '0');

		$('#intr_'+id).html('');
		 $('#contrccion_'+id).attr('style', '');
	}	
		act = act.toString();
		act = act.replace(" ", ",");
		$(ids).val(act);
}

get_procent = function(){
	self = {
		min: 0,
		max: 100
	};

	self.get_size = function(target){
		size = $(target).val();

		if(size > self.max)
			size = self.max;
		else if(size < self.min)
			size = self.min;
		else if(isNaN(size))
			size = self.min;
		else if(size=='')
			size = self.min;

		$(target).css('background-size',size+'%');
		$(target).val(size);
	}

	self.init = function(){
		procents = $('[id="procent_charge"]');

		$.each(procents, function(i, v){
			self.get_size(v);
		});

		self.follow();
	}

	self.follow = function(){
		$('[id="procent_charge"]').keyup(function(){
			self.get_size(this);
		});
	}

	self.init();

	return self;
}



$(function(){
	procent = get_procent();
});

</script>
{include file="adm/overall_footer.tpl"}

