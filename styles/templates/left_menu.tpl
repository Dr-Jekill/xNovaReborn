<div id="menu_izquierdo">
        <ul id="menu_botones">
  		<li class="arriba_menu">
		<span class="menu_icon" data-role="PGtooltip" data-direction="right" data-content="Imperio">
			<a href="{if !CheckModule(15)}{$imperio}{/if}" class="icons generall {if isset($impm)}active{/if}"></a>
        </span>
		<a class="menu_boton_2 {if isset($overview)}active{/if}" href="?page=overview"><span>{$lm_overview}</span></a>
		</li>
		{if !CheckModule(23)}<li>
		<span class="menu_icon" data-role="PGtooltip" data-direction="right" data-content="Opciones de Recursos">
			<a href="?page=resources&load=res" class="icons recu {if isset($resu)}active{/if}"></a>
        </span><a class="menu_boton {if isset($reso)}active{/if}" href="?page=resources"><span>{$lm_resources}</span></a>
		</li>{/if}
		{if !CheckModule(2)}<li>
		<span class="menu_icon">
			<a href="kavascript:void(0)" class="icons builds"></a>
        </span>
		<a class="menu_boton {if isset($buildsa)}active{/if}" href="?page=buildings"><span>{$lm_buildings}</span></a>
		</li>{/if}
		{if !CheckModule(3)}<li>
	    <span class="menu_icon" data-role="PGtooltip" data-direction="right" data-content="Requisitos">
			<a href="{if !CheckModule(28)}?page=techtree{else}javascript:void(0){/if}" class="icons inves {if isset($tect)}active{/if}"></a>
        </span>
		<a class="menu_boton {if isset($rese)}active{/if}" href="?page=buildings&amp;mode=research"><span>{$lm_research}</span></a>
		</li>{/if}
		<li>
		<span class="menu_icon">
			<a href="?page=trader" class="icons merc {if isset($trad)}active{/if}"></a>
        </span><a class="menu_boton {if isset($merca)}active{/if}" href="?page=mercado"><span class="mercader_menu">{$lm_trader}</span></a>
		</li>
		{if !CheckModule(4)}<li>
		<span class="menu_icon">
			<a href="kavascript:void(0)" class="icons ang"></a>
        </span>
		<a class="menu_boton {if isset($shipm)}active{/if}" href="?page=buildings&amp;mode=fleet"><span>{$lm_shipshard}</span></a>
		</li>{/if}
		{if !CheckModule(5)}<li>
		<span class="menu_icon">
			<a href="kavascript:void(0)" class="icons def"></a>
        </span>
		<a class="menu_boton {if isset($defm)}active{/if}" href="?page=buildings&amp;mode=defense"><span>{$lm_defenses}</span></a>
		</li>{/if}
		
		{if !CheckModule(9)}<li>
		<span class="menu_icon" data-role="PGtooltip" data-direction="right" data-content="Movimientos de flota">
			<a href="?page=movement" class="icons flot {if isset($movem)}active{/if}"></a>
        </span>
		<a class="menu_boton {if isset($fleetm)}active{/if}" href="?page=fleet"><span>{$lm_fleet}</span></a>
		</li>{/if}
		{if !CheckModule(11)}<li><span class="menu_icon">
			<a href="kavascript:void(0)" class="icons gala"></a>
        </span>
		<a class="menu_boton {if isset($galm)}active{/if}" href="?page=galaxy"><span>{$lm_galaxy}</span></a>
		</li>{/if}
		{if !CheckModule(0)}<li>
		<span class="menu_icon">
			<a href="kavascript:void(0)" class="icons alia"></a>
        </span>
		<a class="menu_boton {if isset($alim)}active{/if}" href="?page=alliance"><span>{$lm_alliance}</span></a>
		</li>{/if}
		<li>
		<span class="menu_icon">
			<a href="kavascript:void(0)" class="icons ofi"></a>
        </span>
		<a class="menu_boton {if isset($ofim)}active{/if}" href="?page=oficiales"><span class="mercader_menu">{$lm_officiers}</span></a>
		</li>
		{foreach item=mod from=$modules}
		<li>
	        <span class="menu_icon">
				<a href="?page={$mod.link}" class="icons"></a>
	        </span>
			<a class="menu_boton {$innv_active}" href="?page={$mod.link}"><span >{$mod.name}</span></a>
		</li>
		{/foreach}
		{if $authlevel > 0}
		<li>
			<span class="menu_icon">
				<a href="kavascript:void(0)" class="icons admi"></a>
        	</span>
			<a href="./admin.php" class="menu_boton_3 " target="_blank" style="color:#00e5fc">{$lm_administration} ({$VERSION})</a>
		</li>{/if}	
    </ul>
	<div id="oficiales_menu">
	<a href="game.php?page=oficiales"><img src="styles/theme/{$Raza_skin}/imagenes/navegacion/oficiales/{$Comandante}" data-role="PGtooltip" data-direction="buttom" data-content="<div>{$comandante}</div>"></a>
	<a href="game.php?page=oficiales"><img src="styles/theme/{$Raza_skin}/imagenes/navegacion/oficiales/{$Geologo}" data-role="PGtooltip" data-direction="buttom" data-content="<div>{$geologo}</div>"></a>
	<a href="game.php?page=oficiales"><img src="styles/theme/{$Raza_skin}/imagenes/navegacion/oficiales/{$Almirante}" data-role="PGtooltip" data-direction="buttom" data-content="<div>{$almirante}</div>"></a>
	<a href="game.php?page=oficiales"><img src="styles/theme/{$Raza_skin}/imagenes/navegacion/oficiales/{$Ingeniero}" data-role="PGtooltip" data-direction="buttom" data-content="<div>{$ingeniero}</div>"></a>
	<a href="game.php?page=oficiales"><img src="styles/theme/{$Raza_skin}/imagenes/navegacion/oficiales/{$Tecnocrata}" data-role="PGtooltip" data-direction="buttom" data-content="<div>{$tecnocrata}</div>"></a>
	</div>
	{if $closed}
	<table width="70%" id="infobox" style="border: 3px solid red; text-align:center; margin-left: 6px; margin-top: 3px;"><tr><td>{$closed}</td></tr></table>
	{elseif $delete}
	<table width="70%" id="infobox" style="border: 3px solid red; text-align:center; margin-left: 6px; margin-top: 3px;"><tr><td>{$tn_delete_mode} {$delete}</td></tr></table>
	{elseif $vacation}
	<table width="70%" id="infobox" style="border: 3px solid red; text-align:center; margin-left: 6px; margin-top: 3px;"><tr><td>{$tn_vacation_mode} {$vacation}</td></tr></table>
	{/if}
</div>