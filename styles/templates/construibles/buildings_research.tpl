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
<div id="planeta_small" style="background-image: url(styles/theme/{$Raza_skin}/adds/investigaciones.jpg);">
	<div id="titular_texto_cabez" style="display: block; right: 6px;">{$lm_research} - <span>{$planetname}</span></div>
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
	<ul class="estructuras_c">
		{foreach item=ResearchInfoRow from=$ResearchList}
			<li>
				<a href="#" onclick="return Dialog.info({$ResearchInfoRow.id})">
					<img data-role="PGtooltip" data-direction="top" data-name="{$ResearchInfoRow.name}" data-content="<table>
					<tr>
					<td>{$ResearchInfoRow.descr}<br /><font color=red>{$ResearchInfoRow.maxinfo}</font></td>
					</tr>
					</table>" src="{$dpath}gebaeude/{$ResearchInfoRow.id}.png" width="100" height="100" />
				</a>
				{if $ResearchInfoRow.lvl > 0}<div class="nivel_c"> <b style="cursor:help;" class="tooltip" name="{$bd_lvl} {$ResearchInfoRow.lvl}">{$bd_lvl} {$ResearchInfoRow.lvl} {if $ResearchInfoRow.elvl > 0} {$ResearchInfoRow.irv}{/if}</b></div>{/if}		
				<br />
				<div class="construir_c">{$ResearchInfoRow.link}</div>
				<div class="demas_c">
				<div class="recursos_c">{$ResearchInfoRow.price}</div>
				<div class="espacio_c"><br /></div>
				<div class="tiempo_c">
				<b>{$fgf_time}</b></font><br />{$ResearchInfoRow.time}
				</div>		
				</div>
			</li>
		{/foreach}
		<ul>
    </table>
</div>
</div>	
<div class="new_footer"></div>	
  {if $IsLabinBuild}<table width="70%" id="infobox" style="border: 2px solid red; text-align:center;background:transparent"><tr><td>{$bd_building_lab}</td></tr></table><br><br>{/if}	  
<div id="overviewBottom">
	<div id="buildlist" >
		<div class="content-box-s">
			<div class="misiones_top">
		    	<h3>{$ov_lab_edif}</h3>
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
</div>
 
<br/ ><br /><br />
</div>
{include file="planet_menu.tpl"}
</div>
</div>
</div>
{if $ScriptInfo}
<script type="text/javascript">
data	= {$ScriptInfo};
</script>
{/if}
{include file="overall_footer.tpl"}