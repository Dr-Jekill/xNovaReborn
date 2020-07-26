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
<div id="planeta" style="background-image: url(styles/theme/{$Raza_skin}/adds/mercader.jpg);">
</div>

<div id="titulo_alternativo">
    <ul class="tabsbelow">
        <li style="max-width: 353px;">
              <span><b>{$tr_call_trader_who_buys}</b></span>
        </li>                                    
    </ul>
</div>
<div id="eins"> 
<br>    
<div style="display: flex;">
	<div id="mercader_en_caja">	
		<div class="merc_cont">
			<div class="mercader_icon">
				<form action="game.php?page=trader" method="post">
				<input type="hidden" name="ress" value="metal" />
				<input type="image" data-role="PGtooltip" data-direction="top" data-content="<h4>{$tr_elemento}{$Metal}</h4>" src="{$dpath}images/metal.jpg" />
				</form>
			</div>
			<div class="mercader_icon">
				<form action="game.php?page=trader" method="post">
				<input type="hidden" name="ress" value="crystal" />
				<input type="image" data-role="PGtooltip" data-direction="top" data-content="<h4>{$tr_elemento}{$Crystal}</h4>" src="{$dpath}images/crystal.jpg" />
				</form>
			</div>
			<div class="mercader_icon">
				<form action="game.php?page=trader" method="post">
				<input type="hidden" name="ress" value="deuterium" />
				<input type="image" data-role="PGtooltip" data-direction="top" data-content="<h4>{$tr_elemento}{$Deuterium}</h4>" src="{$dpath}images/deuterium.jpg" />
				</form>
			</div>
			<div class="mercader_icon">
				<form action="game.php?page=trader" method="post">
				<input type="hidden" name="ress" value="norio" />
				<input type="image" data-role="PGtooltip" data-direction="top" data-content="<h4>{$tr_elemento}{$Norio}</h4>" src="{$dpath}images/norio.jpg" />
				</form>
			</div>
		</div>	
    </div>
    <div id="mercader_infos">
		<div class="mercader_info">
		<label>{$tr_cost_dm_trader}</label>
		</div>
		<div class="mercader_info">
		<label>{$tr_exchange_quota}</label>
		</div>
 	</div>
</div>  	
</div>
<div class="new_footer"></div>	
<br><br><br><br>
</div>
</div>
{include file="planet_menu.tpl"}
</div>	
</div>	
</div>
{include file="overall_footer.tpl"}