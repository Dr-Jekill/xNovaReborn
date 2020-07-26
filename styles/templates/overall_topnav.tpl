 {if $auidio_active}
 {if $local_audio_deactive}
 <iframe src="" allow="autoplay" style="display:none"></iframe>


<audio autoplay loop>
    <source src="{$audiosource}" type="audio/wav">
</audio> 
{/if}     
{/if}
        <div id="bar">
			<b><ul>
                {if !CheckModule(25)}
                <li>
                    <a href="?page=statistics">{$lm_statistics}</a>({$ranki})
                </li>
                {/if}

				<li>{if !CheckModule(22)}<a href="javascript:OpenPopup('?page=records','{$lm_records}', 1024, 768);">{$lm_records}</a>{/if}</li>
				<li>{if !CheckModule(12)}<a href="?page=topkb">{$lm_topkb}</a>{/if}</li>
				<li>{if !CheckModule(26)}<a href="?page=search">{$lm_search}</a>{/if}</li>
				<li><a href="?page=options">{$lm_options}</a></li>
				{if !CheckModule(6)}<li><a href="?page=buddy">{$lm_buddylist}</a></li>{/if}
				{if !CheckModule(39)}<li><a href="?page=battlesim">{$lm_battlesim}</a></li>{/if}
				{if !CheckModule(27)}<li><a href="?page=support">{$lm_support}</a></li>{/if}
				<li><a href="?page=logout" class="overmark">{$lm_logout}</a></li>
				
            </ul></b>
        </div> 
		
    	<ul id="recursos">
        	<li class="metal">
               <a style="cursor:help" data-role="PGtooltip" data-name="{$Metal}" data-direction="buttom" data-content="
                <table class='resourceTooltip'>
                    <tbody>
                        <tr>
                            <th>Tu reserva:</th>
                            <td><span class=''>{pretty_number($metal)}</span></td>
                        </tr>
                        <tr>
                            <th>{$almacenes}:</th>
                            <td><span class=''>{$metal_max}</span></td>
                        </tr>
                        <tr>
                            <th>Produccion:</th>
                            <td><span class='{if $prod_met > 0}undermark{else}neutral{/if}'>{if $prod_met > 0}+{/if}{$prod_met}</span></td>
                        </tr>
                    </tbody>
                </table>







                "> <img src="styles/theme/{$Raza_skin}/images/metal.jpg" /></a>
                <span class="valor">
						<span id="current_metal" data-actual="{$metal}" data-max="{$metal_max_update}" data-update="{$js_metal_hr}"><b>{$metales}</b></span>
				</span>
            </li>
        	<li class="cristal" data-role="PGtooltip" data-name="{$Crystal}" data-content="
            <table class='resourceTooltip'>
                <tbody>
                    <tr>
                        <th>Tu reserva:</th>
                        <td><span class=''>{pretty_number($crystal)}</span></td>
                    </tr>
                    <tr>
                        <th>{$almacenes}:</th>
                        <td><span class=''>{$crystal_max}</span></td>
                    </tr>
                    <tr>
                        <th>Produccion:</th>
                        <td><span class='{if $prod_cry > 0}undermark{else}neutral{/if}'>{if $prod_cry > 0}+{/if}{$prod_cry}</span></td>
                    </tr>
                </tbody>
            </table>
            " data-direction="buttom">
               <a style="cursor:help"> <img src="styles/theme/{$Raza_skin}/images/crystal.jpg" /></a>
					<span class="valor">
						<span id="current_crystal" data-actual="{$crystal}" data-max="{$crystal_max_update}" data-update="{$js_crystal_hr}"><b>{$cristales}</b></span>
                </span>
            </li>
        	<li class="deuterio" data-role="PGtooltip" data-name="{$Deuterium}" data-content="
            <table class='resourceTooltip'>
                <tbody>
                    <tr>
                        <th>Tu reserva:</th>
                        <td><span class=''>{pretty_number($deuterium)}</span></td>
                    </tr>
                    <tr>
                        <th>{$almacenes}:</th>
                        <td><span class=''>{$deuterium_max}</span></td>
                    </tr>
                    <tr>
                        <th>Produccion:</th>
                        <td><span class='{if $prod_deu > 0}undermark{else}neutral{/if}'>{if $prod_deu > 0}+{/if}{$prod_deu}</span></td>
                    </tr>
                </tbody>
            </table>
            " data-direction="buttom">
                <a style="cursor:help"><img src="styles/theme/{$Raza_skin}/images/deuterium.jpg" /></a>
                <span class="valor">
						<span id="current_deuterium" data-actual="{$deuterium}" data-max="{$deuterium_max_update}" data-update="{$js_deuterium_hr}"><b>{$deuterios}</b></span>
               	</span>
            </li>
			<li class="norio" data-role="PGtooltip" data-name="{$Norio}" data-content="
            <table class='resourceTooltip'>
                <tbody>
                    <tr>
                        <th>Tu reserva:</th>
                        <td><span class=''>{pretty_number($deuterium)}</span></td>
                    </tr>
                    <tr>
                        <th>{$almacenes}:</th>
                        <td><span class=''>{$norio_max}</span></td>
                    </tr>
                    <tr>
                        <th>Produccion:</th>
                        <td><span class='undermark'>+{$prod_nor}</span></td>
                    </tr>
                </tbody>
            </table>
            " data-direction="buttom">
				<a style="cursor:help"><img src="styles/theme/{$Raza_skin}/images/norio.jpg" /></a>
					<span class="valor">
                        <span id="current_norio" data-actual="{$norio}" data-max="{$norio_max_update}" data-update="{$js_norio_hr}"><b>{$norios}</b></span>
                </span>
            </li>
        	<li class="energia" data-role="PGtooltip" data-name="{$Energy}" data-content="
            <table class='resourceTooltip'>
                <tbody>
                    <tr>
                        <th>{$Energy}:</th>
                        <td><span class=''>{$energy}</span></td>
                    </tr>
                    <tr>
                        <th>Produccion:</th>
                        <td><span class='undermark'>+{$prod_ene}</span></td>
                    </tr>
                    <tr>
                        <th>En uso:</th>
                        <td><span class='overmark'>{$red_ene}</span></td>
                    </tr>
                </tbody>
            </table>
            " data-direction="buttom">
				<a style="cursor:help"><img src="styles/theme/{$Raza_skin}/images/energia.jpg" /></a>
                <span class="valor">
                    <span><b>{$energia}</b></span>
                </span>
            </li>
        	<li class="materia_oscura" data-role="PGtooltip" data-name="{$Darkmatter}" data-content="
            <table class='resourceTooltip'>
                <tbody>
                    <tr>
                        <th>Tu Reserva:</th>
                        <td><span class=''>{$darkmatter}</span></td>
                    </tr>
                </tbody>
            </table>
            " data-direction="buttom">
			<a href="game.php?page=materiaoscura"><img src="styles/theme/{$Raza_skin}/images/{if $Raza_skin=='gultra'}materia_oscura.gif{else}materia.png{/if}" /></a>	
                <span class="valor">
                    	<span><b>{$darkmatter}</b></span>
                </span>
            </li>
		</ul>	

        <div class="logo"></div>

        <div id="titular">
                <div id="estructura_titular" style="position:relative;display: flex;">
                    <div style="display: block;"> 
                        {if !CheckModule(16)}
                        <a href="?page=messages">
                            {if $new_message > 0}
                                <div class="mena" data-role="PGtooltip"  data-direction="top" data-content="<table>Tiene {$new_message} mensaje(s) no leidos</table>">
                                <men>{$new_message}</men>
                            </div>
                            {else}
                                <div class="men" data-role="PGtooltip" data-direction="top" data-content="<table>No tiene mensajes sin leer</table>"></div>
                            {/if}
                        </a>
                        {/if}
                    </div>
                    <div style="display: block;"> 
                        {if !CheckModule(7)}
                        <a href="?page=chat">
                            <div class="chat" data-role="PGtooltip" data-direction="top" data-content="<table>Chat</table>"></div>
                        </a>
                        {/if}
                    </div>
                    <div id="titular_texto" style="display: block;" class="flot flying_fleet">
                        NO HAY MOVIMIENTOS DE FLOTA
                    </div>
                    <div id="alert_fleet"></div>
                </div>
            </div>
