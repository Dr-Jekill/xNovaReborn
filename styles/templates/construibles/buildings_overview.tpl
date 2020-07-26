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
	<div id="planeta" {if $images_b=='0'}class="planeta_small"{/if}>
		{$header}
		<div id="titular_texto_cabez" style="display: block; right: 6px;">{$lm_buildings} - <span>{$planetname}</span></div>
	</div>
	
<div id="cabezza" style="background-image: url(styles/theme/{$Raza_skin}/imagenes/navegacion/header_box.png);"></div>
<div id="eins_small">
 <div>	
 <br />
   <table width="95%">	
		<ul class="estructuras_c">
		{foreach item=BuildInfoRow from=$BuildInfoList}
			<li>
				<a href="#" onclick="return Dialog.info({$BuildInfoRow.id})">
					<img data-role="PGtooltip" data-direction="top" data-name="{$BuildInfoRow.name}" data-content="<table>
					<tr>
					<td>{$BuildInfoRow.descriptions}</td>
					</tr>
					</table>" src="{$dpath}gebaeude/{$BuildInfoRow.id}.png" width="100" height="100" />
				</a>
				{if $BuildInfoRow.level > 0}<div class="nivel_c"> <b style="cursor:help;" data-role="PGtooltip" data-direction="top" data-content="{$bd_lvl} {$BuildInfoRow.level}">{$bd_lvl} {$BuildInfoRow.level}</b></div>{/if}				
				{if $BuildInfoRow.EnergyNeed}
				<div class="energia_c" data-role="PGtooltip" data-direction="top" data-content="{$BuildInfoRow.RealEnergy}">{$BuildInfoRow.EnergyNeed}</div>
				{/if}	
				<br />
				<div class="construir_c">{$BuildInfoRow.BuildLink}</div>
				{if $BuildInfoRow.level > 0} <div class="destruir_c" data-role="PGtooltip" data-direction="top" data-content="<table style=\'width:100%;margin:0;padding:0\'><tr><th colspan=\'2\'>&nbsp;{$bd_price_for_destroy} {$BuildInfoRow.name} {$BuildInfoRow.level}&nbsp;</th></tr><tr><td class=\'transparent\'><img src=styles/theme/{$Raza_skin}/images/metal.jpg width=30 height=20 /></td><td class=\'transparent\'>{$BuildInfoRow.destroyress.metal}</td></tr><tr><td class=\'transparent\'><img src=styles/theme/{$Raza_skin}/images/crystal.jpg width=30 height=20 /></td><td class=\'transparent\'>{$BuildInfoRow.destroyress.crystal}</td></tr><tr><td class=\'transparent\'><img src=styles/theme/{$Raza_skin}/images/deuterium.jpg width=30 height=20 /></td><td class=\'transparent\'>{$BuildInfoRow.destroyress.deuterium}</td></tr><tr><td class=\'transparent\'><img src=styles/theme/{$Raza_skin}/images/norio.jpg width=30 height=20 /></td><td class=\'transparent\'>{$BuildInfoRow.destroyress.norio}</td></tr><tr><td class=\'transparent\'>{$bd_destroy_time}</td><td class=\'transparent\'>{$BuildInfoRow.destroytime}</td></tr></table>"><a href="game.php?page=buildings&amp;cmd=destroy&amp;building={$BuildInfoRow.id}"><img src="styles/theme/{$Raza_skin}/imagenes/navegacion/destruir.gif" /></a></div>{/if}
				<div class="demas_c">
				<div class="recursos_c">{$BuildInfoRow.price}</div>
				<div class="espacio_c"><br /></div>
				<div class="tiempo_c">
				<b>{$fgf_time}</b></font><br />{$BuildInfoRow.time}
				</div>		
				{if $BuildInfoRow.level > 0 && $BuildInfoRow.id != 33}
				{/if}
				</div>
			</li>
		{/foreach}
		<ul>
    </table>
</div>
</div>	
<div class="new_footer_small"></div>	
<div id="overviewBottom">
	<div id="buildlist" >
		<div class="content-box-s">
			<div class="misiones_top">
		    	<h3>{$ov_planets_edif}</h3>
		    </div>
				<div class="content">
					<table cellpadding="0" cellspacing="0" class="construction active">
						<tbody><tr>
							<td colspan="2" class="idle">
		                                                    {$build}
		                                            </td>
						</tr>
					</tbody></table>
				</div>
			<div class="misiones_footer"></div>
		</div>
	</div>
</div>




<br /><br /><br />	
</div>






<br/ ><br /><br />
</div>
{include file="planet_menu.tpl"}
</div>
</div>
</div>
{if $data}
<script type="text/javascript">
data	= {$data};
</script>
{/if}
{include file="overall_footer.tpl"}