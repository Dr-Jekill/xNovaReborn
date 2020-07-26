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
<div id="planeta_small" style="background-image: url(styles/theme/{$Raza_skin}/adds/defensas.jpg);">
	<div id="titular_texto_cabez" style="display: block; right: 6px;">{$lm_defenses} - <span>{$planetname}</span></div>
</div>
<div id="titulo_alternativo_corto">
    <ul class="tabsbelow">
        <li>
              <span><b>{$lm_defense}</b></span>
        </li>                                    
    </ul>
</div>
<div id="eins">
 <div>	
 <br />
   <table width="95%">	
   	<form action="" method="POST"> 
		<ul class="estructuras_c">
		{foreach name=DefenseList item=DefenseListRow from=$DefenseList}
			<li>
				<a href="#" onclick="return Dialog.info({$DefenseListRow.id})">
					<img data-role="PGtooltip" data-direction="top" data-name="{$DefenseListRow.name}" data-content="<table>
					<tr>
					<td>{$DefenseListRow.descriptions}</td>
					</tr>
					</table>" src="{$dpath}gebaeude/{$DefenseListRow.id}.png" width="100" height="100" />
				</a>
				{if $DefenseListRow.Available != 0} <div class="nivel_c"> <b style="cursor:help;" id="val_{$DefenseListRow.id}" class="tooltip" name="{$DefenseListRow.Available}">{$DefenseListRow.Available}</b></div>{/if}		
				<br />
				{if $NotBuilding && $DefenseListRow.IsAvailable}<div class="cantidad_flota_h"><input type="text" class="campo_comun" name="fmenge[{$DefenseListRow.id}]" id="input_{$DefenseListRow.id}" size="12" maxlength="{$maxlength}" value="0" tabindex="{$smarty.foreach.FleetList.iteration}" /></div>
				{if $USERcommander >= 1}<div class="max_h"><input type="button" class="campo_comun" value="Max" onclick="$('#input_{$DefenseListRow.id}').val('{$DefenseListRow.GetMaxAmount}')" /></div>{/if}{/if}
				<div class="demas_c">
				<div class="recursos_c">{$DefenseListRow.price}</div>
				<div class="espacio_c"><br /></div>
				<div class="tiempo_c">
				<b>{$fgf_time}</b></font><br />{$DefenseListRow.time}
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
</div>
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