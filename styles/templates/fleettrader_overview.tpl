{include file="overall_header.tpl"}
<body id="mercado">
<div id="tooltip" class="tip"></div>
<div class="contenido_big">
<div id="cajaBG">
    <div id="caja">
<div id="topnav" class="header_normal"> 	
		{include file="overall_topnav.tpl"}	
			<div id="titular">
			<div id="estructura_titular" style="position:relative;">
				<div id="titular_texto" style="display: block;">{$ft_head}</div>
			</div>
        </div>
	</div> 
{include file="left_menu.tpl"}
<div id="contenidoMostrado">                               
<div id="elCosoxD">
<div id="planeta" style="background-image: url(styles/theme/{$Raza_skin}/adds/fleettrader.jpg);"></div>
<div class="coso_izquierda"></div>
<div class="coso_derecha"></div>
<div id="titulo_alternativo">
    <ul class="tabsbelow">
        <li>
              <span></span>
        </li>                                    
    </ul>
</div>
<div id="eins">
        <div>	    
 <form action="" method="POST">
<table width="96%">
		<tbody>
			<tr>
				<th>{$ft_selecciona}</th>
				<th>{$ft_uniselec}</th>
				<th>{$ft_cantidad}</th>
				<th>{$ft_unidad}</th>
				<th>{$ft_total}</th>
			</tr>
			<tr>
			<td class="remarcado">
			<select name="id" id="id" onChange="updateVars()">
			{foreach $trade_allowed_ships as $ID}
			<option value="{$ID}" label="{$tech.$ID}">{$tech.$ID}</option>
			{/foreach}
			</select>
			</td>
		
			<td class="semi_remarcado">
			<div class="imagenes_fleettrader">
			{foreach $trade_allowed_ships as $ID}
			<img data-role="PGtooltip" data-direction="top" data-content="{$tech.$ID}" src="styles/theme/{$Raza_skin}/gebaeude/{$ID}.png" height="70" width="70" />
			{/foreach}
			</div>
			</td>
			
			<td class="remarcado">
			<div class="bg_input_special">
			<input type="text" class="text" id="count" name="count" onkeyup="Total();" />
			<br><br><input type="button" class="campo_comun" value="Max" onclick="MaxShips();">
			</div>
			</td>
					
			<td class="semi_remarcado" width="100px">
			<img data-role="PGtooltip" data-direction="top" data-content="{$Metal}" src="styles/theme/{$Raza_skin}/images/metal.jpg" /><br /><b><span id="metal">0</span></b><br />
			<img data-role="PGtooltip" data-direction="top" data-content="{$Crystal}" src="styles/theme/{$Raza_skin}/images/crystal.jpg" /><br /><b><span id="crystal">0</span></b><br />
			<img data-role="PGtooltip" data-direction="top" data-content="{$Deuterium}" src="styles/theme/{$Raza_skin}/images/deuterium.jpg" /><br /><b><span id="deuterium">0</span></b><br />
			<img data-role="PGtooltip" data-direction="top" data-content="{$Norio}" src="styles/theme/{$Raza_skin}/images/norio.jpg" /><br /><b><span id="norio">0</span></b>
			</td>
			
			<td class="remarcado" width="100px">
			<img name="{$Metal}" src="styles/theme/{$Raza_skin}/images/metal.jpg" /><br /><b><span id="total_metal">0</span></b><br />
			<img name="{$Crystal}" src="styles/theme/{$Raza_skin}/images/crystal.jpg" /><br /><b><span id="total_crystal">0</span></b><br />
			<img name="{$Deuterium}" src="styles/theme/{$Raza_skin}/images/deuterium.jpg" /><br /><b><span id="total_deuterium">0</span></b><br />
			<img name="{$Norio}" src="styles/theme/{$Raza_skin}/images/norio.jpg" /><br /><b><span id="total_norio">0</span></b>
			</td>
			</tr>

					
			<tr><td colspan="5">
			<br /><span class="remarcado" style="padding: 2px 2px 2px 2px; font-weight: bold;">{$ft_charge}: <span id="charge" style="color: #83b301;"></span></span><br />
			<input type="submit" class="submit" value="{$ft_absenden}">
			</td></tr>
			
		</tbody>
	</table>
</form>
        </div>
</div>	
<div class="new_footer"></div>	
<br /><br /><br />	
</div>
</div>	
{include file="planet_menu.tpl"}
</div>	
</div>	
</div>
<script type="text/javascript">
var CostInfo = {$CostInfos};
var Charge = {$Charge};
</script>
{include file="overall_footer.tpl"}