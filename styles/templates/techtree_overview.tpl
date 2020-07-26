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
<div id="cabezza" style="background-image: url(styles/theme/{$Raza_skin}/imagenes/navegacion/header_box.png);"></div>
<div id="eins_small">
 <div>	
 <br /> 
 <table cellspacing="0" cellpadding="0" style="width:95%;">
{foreach item=TechInfo from=$TechTreeList}
{if !is_array($TechInfo)}

{else}
<tr class="alt">
   <td><a href="#" onclick="return Dialog.info({$TechInfo.id})"><img border="0" src="styles/theme/{$Raza_skin}/gebaeude/{$TechInfo.id}.png" align="top" width="25" height="25" /></a></td>
   <td align="left"><a href="#" onclick="return Dialog.info({$TechInfo.id})"><h4>{$TechInfo.name}</h4></a></td>
    <td align="right">
   {if $TechInfo.need}
      {foreach item=NeedLevel from=$TechInfo.need.{$TechInfo.id}}
         {if $NeedLevel.own >= $NeedLevel.count}
            <span class="semi_remarcado"><a href="#" onclick="return Dialog.info({{$NeedLevel.id}})"><font color="#00ff00">{$LNG.{$NeedLevel.id}}</font></a> <font color="#00ff00"><b>({$tt_lvl}{$NeedLevel.own}/{$NeedLevel.count})</b></font></span><br>
         {else}
            <span><a href="#" onclick="return Dialog.info({{$NeedLevel.id}})"><font color="#ff0000">{$LNG.{$NeedLevel.id}}</font></a> <font color="#ff0000"><b>({$tt_lvl}{$NeedLevel.own}/{$NeedLevel.count})</b></font></span><br>             
         {/if}
      {/foreach}
   {/if}
   </td>
</tr>
{/if}
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