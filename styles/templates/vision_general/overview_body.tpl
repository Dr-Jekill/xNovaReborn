{include file="overall_header.tpl"}
<body id="vision_general" {if $is_news}class="news"{/if}>
<div id="tooltip" class="tip"></div>
<div class="contenido_big">
    <div id="cajaBG">
        <div id="caja">
        <div id="topnav" class="header_g"> 
    		{include file="overall_topnav.tpl"}	

        </div> 
        {include file="left_menu.tpl"}
        <div id="contenidoMostrado">                               
            <div id="elCosoxD">
                <div id="titular_texto_cabez" style="display: block;">
                    <a href="#" onclick="$('#dialog').dialog('open');return false;" title="{$ov_planetmenu}">
                        <l href="#" title="Planeta">Resumen - <span>{$planetname}</span></l>
                    </a> 
                </div>
                <div id="planetdata">
                    <div class="overlay"></div>
                    <div id="planetDetails">
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                                <tr>
                                    <td class="desc">
                                        <span id="diameterField">{$ov_diameter}:</span>
                                    </td>
                                    <td class="data">
                                        <span id="diameterContentField">{$planet_diameter} {$ov_distance_unit} (<a title="{$ov_developed_fields}">{$planet_field_current}</a> / <a title="{$ov_max_developed_fields}">{$planet_field_max}</a> {$ov_fields})</span>
                                     </td>
                                </tr>
                                <tr>
                                    <td class="desc">
                                        <span id="temperatureField">{$ov_temperature}:</span>
                                    </td>
                                    <td class="data">
                                        <span id="temperatureContentField">de {$planet_temp_min}{$ov_temp_unit} a {$planet_temp_max}{$ov_temp_unit}</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="desc">
                                        <span id="positionField">{$ov_position}:</span>
                                    </td>
                                    <td class="data">
                                        <span id="positionContentField"><a href="game.php?page=galaxy&amp;mode=0&amp;galaxy={$galaxy}&amp;system={$system}">[{$galaxy}:{$system}:{$planet}]</a></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="desc">
                                        <span id="scoreField">{$ov_points}:</span></td>
                                    <td class="data">
                                        <span id="scoreContentField"><a href="game.php?page=statistics&amp;range=1">{$user_rank}</a></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div  style="display: flex;">
                                            <div id="razas_ov">
                                                <img data-role="PGtooltip" data-direction="top" data-content="<img src={$ov_raza_img} width=120 height=120/><h2><font color=#83919c>{$Raza}: {$Raza_tipo}</font></b></h2>" src="{$ov_raza_img}" width="70" height="70" />
                                            </div> 

                                            <div id="escombros_ov">
                                                {$escombros}
                                            </div>

                                            <div id="luna_ov">
                                                {if $Moon}
                                                <a href="game.php?page=overview&amp;cp={$Moon.id}&amp;re=0">
                                                    <img src="styles/theme/{$Raza_skin}/imagenes/luna.png"  data-role="PGtooltip" data-direction="top" data-content="('{$Moon.name} ({$fcm_moon})')"/>
                                                </a>
                                                {else}
                                                    <img src="styles/theme/{$Raza_skin}/imagenes/luna_o.png" />
                                                {/if}
                                            </div>
                                             
                                            <div id="rangos_ov">
                                                <img data-role="PGtooltip" data-direction="top" data-content="<img src=styles/images/rangos/{$rango}.png /><br /><h3>{$lvl_rg} {$rango}<br />{$nivel}</h3> " src="styles/images/rangos/{$rango}.png" width="70" height="70" />
                                            </div>
                                        </div>

                                    </td>
                                </tr>
                                <!--
                                <tr>
                                    <td class="desc">
                                        <span id="honorField">Puntos de honor:</span></td>
                                    <td class="data ">
                                        <span id="honorContentField">0</span>
                                    </td>
                                </tr>-->
                            </tbody>
                        </table>
                    </div>

                    <div id="planetOptions">
                        

                        <a class="dark_highlight_tablet float_right openPlanetRenameGiveupBox" href="javascript:void(0);" onclick="mrbox('?page=plan');$('#dialog').dialog('open');return false;">
                            <span class="planetMoveOverviewGivUpLink" onclick="$('#dialog').dialog('open');return false;">abandonar/renombrar</span>
                            <span class="planetMoveIcons settings planetMoveGiveUp icon"></span>
                        </a>
                    </div>
                </div>
                <div id="planeta_overview">
                    <img src="styles/theme/{$Raza_skin}/planeten/Planetas/{$planetimage}.jpg" style="position: absolute; z-index: -200;">
                </div>

        	


                <div id="overviewBottom">

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

                    <div class="content-box-s">
                        <div class="misiones_top"><h3>{$ov_planets_inv}</h3></div>
                            <div class="content">    
                                <table cellspacing="0" cellpadding="0" class="construction active">
                                    <tbody>
                                    <tr>
                                        <td colspan="2" class="idle">
                                                                        {$build_i}
                                                                </td>
                                    </tr>   
                                    </tbody>
                                    </table>
                            </div>
                        <div class="misiones_footer"></div>
                    </div>

                    <div class="content-box-s">
                        <div class="misiones_top"><h3>{$ov_planets_han}</h3></div>
                            <div class="content">    
                                <table cellspacing="0" cellpadding="0" class="construction active">
                                    <tbody>
                                    <tr>
                                        <td colspan="2" class="idle">
                                                                    {$build_h}
                                            
                                        </td>
                                    </tr>   
                                    </tbody>
                                    </table>
                            </div>
                        <div class="misiones_footer"></div>
                    </div>

                    <div class="clearfloat"></div>

                    <div class="clearfloat"></div>
                </div>

            <!-- ESTA SON LAS LOTAS
                <div id="titulo_alternativo_secundario">
                    <ul class="tabsbelow">
                        <li>
                              <span><b>{$ov_events} </b></span>
                        </li>                                    
                    </ul>
                </div>




                <div id="eins">
                    <div><br />
                        <table width="95%">
                            <tbody>		
                    			<tr id="fleets" style="display:none;">
                    				<td colspan="4">
                    			</tr>
                        	</tbody>
                        </table>	
                    </div>
                </div>

                <div class="new_footer"></div>

            -->

                <br /><br /><br />
            </div>
                <tr id="fleets" style="display:none;">
                    <td colspan="4">
                </tr>		
        </div>
        {include file="planet_menu.tpl"}

    </div>
</div>


<!--
<div class="toast toast_animation">
    <div class="toast_content">
        <div class="toast_header">
            Este es el header
        </div>
        <div class="toast_body">
            <div class="toast_icon"></div>
            <div class="toast_text">
                asdasda asd asd asd asd a ad asd 
            </div>
        </div>
        <div class="toast_footer">
            dffff
        </div>
    </div>
</div>-->
  
<form action="" method="POST">
<div id="dialog" title="{$ov_planetmenu}" style="display:none;">
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">{$ov_planet_rename}</a></li>
			<li><a href="#tabs-2">{$ov_delete_planet}</a></li>
		</ul>
		<div id="tabs-1">
			<label for="newname"> </label><input class="left campo_comun" type="text" name="newname" id="newname" size="25" maxlength="20" autocomplete="off">
		</div>
		<div id="tabs-2"><h3 style="margin:0">{$ov_security_request}</h3>{$ov_security_confirm}<br>
			<label for="password">{$ov_password}: </label><input class="left campo_comun" type="password" name="password" id="password" size="25" maxlength="20" autocomplete="off">
		</div>
	</div>
</div>

</form>
<script type="text/javascript">
buildtime	= {$buildtime};
</script>

{include file="overall_footer.tpl"}