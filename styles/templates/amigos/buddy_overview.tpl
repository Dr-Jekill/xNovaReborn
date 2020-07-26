{include file="overall_header.tpl"}
<body id="mercado">
<div id="tooltip" class="tip"></div>
<div class="contenido_big">
<div id="cajaBG">
    <div id="caja">
<div id="topnav" class="header_normal"> 	
		{include file="overall_topnav.tpl"}	
			
	</div> 
{include file="left_menu.tpl"}
<div id="contenidoMostrado">                               
<div id="elCosoxD">
	<div id="planetas">
<img src="styles/theme/{$Raza_skin}/adds/amigos.jpg" style="margin-left: 8px;">

<div id="titular_texto_cabez" style="display: block; right: 6px;">Amigos</div>
</div>

<div id="cabezza" style="background-image: url(styles/theme/{$Raza_skin}/imagenes/navegacion/header_box.png);"><h3>{$bu_buddy_list}</h3></div>
<div id="eins_small">
 <div>	
 <br /> 


<div class="section">
    <h3>
        <a id="link23" class="opened" href="javascript:void(0);" onclick="tab.manage('link23');" rel="buddyL" style="margin-left: -9px;">
            <span>
                Solicitudes de Amistad            </span>
        </a>
    </h3>
</div>
<div class="sectioncontent" id="buddyL" style="display: none;">
    
    <div class="contentz ui-tabs ui-widget ui-widget-content ui-corner-all">
        <ul class="tabsbelow" id="tab-ally-sub" style="margin-left: 36px;">
            <li class="tab_ally selected" onclick="tab.sub('tinter', 'buddyL')" id="tinter" rel="one">
                <a href="javascript:void(0);" rel="" class="navi overview">
                    <span>Solicitudes enviadas</span>
                </a>
            </li>
            <li class="tab_ally" onclick="tab.sub('textern', 'buddyL')" id="textern" rel="dos">
                <a href="javascript:void(0);" rel="" class="navi management">
                    <span>Solicitudes recibidas</span>
                </a>
            </li>
        </ul>



		<div id="one" aria-labelledby="tabIntern" class="subtab ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-hidden="true" aria-live="polite" style="display: block;">

	        <div class="anythingWindowAlly" id="Tsoli">
	        	<table style="min-width:569px;width:569px;">
					<tr>
						<th class="ct_th ct_sortable_title">{$bu_player}</th>
						<th class="ct_th ct_sortable_title">{$bu_alliance}</th>
						<th class="ct_th ct_sortable_title">{$bu_coords}</th>
						<th class="ct_th ct_sortable_title">{$bu_text}</th>
						<th class="ct_th ct_sortable_title">{$bu_action}</th>
					</tr>
					{foreach name=OutRequestList item=OutRequestInfo from=$OutRequestList}
					<tr>
						<td>
							<a href="#" onclick="return Dialog.PM({$OutRequestInfo.playerid});">{$OutRequestInfo.name}</a>
						</td>
						<td>
							{if {$OutRequestInfo.allyname}}
								<a href="game.php?page=alliance&amp;mode=ainfo&amp;a={$OutRequestInfo.allyid}">{$OutRequestInfo.allyname}</a>
							{else}-{/if}
						</td>
						<td>
							<a href="game.php?page=galaxy&amp;mode=3&amp;galaxy={$OutRequestInfo.galaxy}&amp;system={$OutRequestInfo.system}">{$OutRequestInfo.galaxy}:{$OutRequestInfo.system}:{$OutRequestInfo.planet}</a>
						</td>
						<td>{$OutRequestInfo.text}</td>
						<td>
							<a href="game.php?page=buddy&amp;mode=1&amp;sm=2&amp;bid={$OutRequestInfo.buddyid}">{$bu_accept}</a>
							<br><a href="game.php?page=buddy&amp;mode=1&amp;sm=1&amp;bid={$OutRequestInfo.buddyid}">{$bu_decline}</a>
						</td>
					</tr>
					{foreachelse}
					<tr><td colspan="6" style="text-align:center;">{$bu_no_request}</td></tr>
					{/foreach}
				</table>
       		</div>

	    </div>

	    <div id="dos" aria-labelledby="tabIntern" class="subtab ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-hidden="true" aria-live="polite" style="display: none;">

	        <div class="anythingWindowAlly" id="Tsoli">
	        	<table style="min-width:569px;width:569px;">
					<tr>
						<th class="ct_th ct_sortable_title">{$bu_player}</th>
						<th class="ct_th ct_sortable_title">{$bu_alliance}</th>
						<th class="ct_th ct_sortable_title">{$bu_coords}</th>
						<th class="ct_th ct_sortable_title">{$bu_text}</th>
						<th class="ct_th ct_sortable_title">{$bu_action}</th>
					</tr>
					{foreach name=MyRequestList item=MyRequestInfo from=$MyRequestList}
					<tr>
						<td>
							<a href="#" onclick="return Dialog.PM({$MyRequestInfo.playerid});">{$MyRequestInfo.name}</a>
						</td>
						<td>
							{if {$MyRequestInfo.allyname}}
								<a href="game.php?page=alliance&amp;mode=ainfo&amp;a={$MyRequestInfo.allyid}">{$MyRequestInfo.allyname}</a>
							{else}-{/if}
						</td>
						<td>
							<a href="game.php?page=galaxy&amp;mode=3&amp;galaxy={$MyRequestInfo.galaxy}&amp;system={$MyRequestInfo.system}">{$MyRequestInfo.galaxy}:{$MyRequestInfo.system}:{$MyRequestInfo.planet}</a>
						</td>
						<td>{$MyRequestInfo.text}</td>
						<td>
							<a href="game.php?page=buddy&amp;mode=1&amp;sm=1&amp;bid={$MyRequestInfo.buddyid}">{$bu_cancel_request}</a>
						</td>
					</tr>
					{foreachelse}
					<tr><td colspan="6" style="text-align:center;">{$bu_no_request}</td></tr>
					{/foreach}
				</table>
       		</div>

	    </div>
		<br class="clearfloat">
	</div>

    <div class="footer"></div>
</div>





<table style="min-width:569px;width:569px;"class="tb">

<tr>
<th class="ct_th ct_sortable_title">{$bu_player}</td>
<th class="ct_th ct_sortable_title">{$bu_alliance}</th>
<th class="ct_th ct_sortable_title">{$bu_coords}</th>
<th class="ct_th ct_sortable_title">{$bu_online}</th>
<th class="ct_th ct_sortable_title">{$bu_action}</th>
</tr>
{foreach name=MyBuddyList item=MyBuddyInfo from=$MyBuddyList}
<tr>
<td><a href="#" onclick="return Dialog.PM({$MyBuddyInfo.playerid});">{$MyBuddyInfo.name}</a></td>
<td>{if {$MyBuddyInfo.allyname}}<a href="game.php?page=alliance&amp;mode=ainfo&amp;a={$MyBuddyInfo.allyid}">{$MyBuddyInfo.allyname}</a>{else}-{/if}</td>
<td><a href="game.php?page=galaxy&amp;mode=3&amp;galaxy={$MyBuddyInfo.galaxy}&amp;system={$MyBuddyInfo.system}">{$MyBuddyInfo.galaxy}:{$MyBuddyInfo.system}:{$MyBuddyInfo.planet}</a></td>
<td>
{if $MyBuddyInfo.onlinetime < 4}
<span style="color:lime">{$bu_connected}</span>
{elseif $MyBuddyInfo.onlinetime >= 4 && $MyBuddyInfo.onlinetime <= 15}
<span style="color:yellow">{$MyBuddyInfo.onlinetime} {$bu_minutes}</span>
{else}
<span style="color:red">{$bu_disconnected}</span>
{/if}
</td>
<td><a href="game.php?page=buddy&amp;mode=1&amp;sm=1&amp;bid={$MyBuddyInfo.buddyid}">{$bu_delete}</a></td></tr>
{foreachelse}
<tr><td colspan="6">{$bu_no_buddys}</td></tr>
{/foreach}
</table>
 </div>
</div>	
<div class="new_footer_small"></div>	
<br /><br /><br />	
</div>
</div>
{include file="planet_menu.tpl"}	
</div>
</div>
</div>
{include file="overall_footer.tpl"}
<script type="text/javascript">
tab.manage('link23');
tab.sub('tinter', 'buddyL');
</script>