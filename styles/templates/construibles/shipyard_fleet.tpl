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
<div class="coso_izquierda_corto"></div>
<div class="coso_derecha_corto"></div>
<div id="planeta_small" style="background-image: url(styles/theme/{$Raza_skin}/adds/hangar.jpg);">
	<div id="titular_texto_cabez" style="display: block; right: 6px;">{$lm_shipshard} - <span>{$planetname}</span></div>
</div>
<div id="titulo_alternativo_corto">
    <ul class="tabsbelow">
        <li>
              <span><b>{$lm_fleet}</b></span>
        </li>                                    
    </ul>
</div>
<div id="eins">
 <div>	
 <br />
   <table width="95%">	
   	<form action="" method="POST"> 
		<ul class="estructuras_c">
		{foreach name=FleetList item=FleetListRow from=$FleetList}
			<li>
				<a href="#" onclick="return Dialog.info({$FleetListRow.id})">
					<img data-role="PGtooltip" data-direction="top" data-name="{$FleetListRow.name}" data-content="<table>
					<tr>
					<td>{$FleetListRow.descriptions}</td>
					</tr>
					</table>" src="{$dpath}gebaeude/{$FleetListRow.id}.png" width="100" height="100" />
				</a>
				{if $FleetListRow.Available != 0} <div class="nivel_c"> <b style="cursor:help;" id="val_{$FleetListRow.id}" class="tooltip" name="{$FleetListRow.Available}">{$FleetListRow.Available}</b></div>{/if}		
				<br />
				{if $NotBuilding && $FleetListRow.IsAvailable}<div class="cantidad_flota_h"><input type="text" class="campo_comun" name="fmenge[{$FleetListRow.id}]" id="input_{$FleetListRow.id}" size="12" maxlength="{$maxlength}" value="0" tabindex="{$smarty.foreach.FleetList.iteration}" /></div>
				{if $USERcommander >= 1}<div class="max_h"><input type="button" class="campo_comun" value="Max" onclick="$('#input_{$FleetListRow.id}').val('{$FleetListRow.GetMaxAmount}')" /></div>{/if}{/if}
				<div class="demas_c">
				<div class="recursos_c">{$FleetListRow.price}</div>
				<div class="espacio_c"><br /></div>
				<div class="tiempo_c">
				<b>{$fgf_time}</b></font><br />{$FleetListRow.time}
				</div>		
				</div>
			</li>
		{/foreach}
		<ul>
	</table>
		{if $NotBuilding}<table width="95%"><center><input class="submit" type="submit" value="{$bd_build_ships}"><center></table>{/if}
	</form>

</div>
</div>	
<div class="new_footer"></div>
{if !$NotBuilding}<table width="70%" id="infobox" style="border: 2px solid red; text-align:center;background:transparent"><tr><td>{$bd_building_shipyard}</td></tr></table>{/if}		  


            <!--    <tr class="data">               
                    <td colspan="2">                        
                                                <a class="build-faster dark_highlight tooltipLeft js_hideTipOnMobile ships " title="" href="javascript:void(0);" rel="">
                            <div class="build-faster-img" alt="Reducir tiempo a la mitad"></div>
                            <span class="build-txt">Reducir tiempo a la mitad</span>
                            <span class="dm_cost ">
                                Costes: 1.500 MO                            </span>
                                                    </a>
                    </td>
                </tr>-->
                
	    <div id="buildlist" >
			<div class="content-box-s">
				<div class="misiones_top">
			    	<h3>{$hangar_title}</h3>
			    </div>
					<div class="content">
						<table cellpadding="0" cellspacing="0" class="construction active">
							<tbody><tr>
								<td colspan="2" class="idle">
			                                                    {$hangar}
			                                            </td>
							</tr>
						</tbody></table>
					</div>
				<div class="misiones_footer"></div>
			</div>
		</div>

	</div>
	<div class="misiones_footer"></div>
</div>
{include file="planet_menu.tpl"}
</div>
</div>
</div>
<script type="text/javascript">
data			= {$BuildList};
bd_operating	= '{$bd_operating}';
bd_available	= '{$bd_available}';
</script>
{include file="overall_footer.tpl"}