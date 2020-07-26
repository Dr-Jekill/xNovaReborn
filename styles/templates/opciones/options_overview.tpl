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
<div class="cabe">
    <img src="styles/theme/{$Raza_skin}/adds/opciones.jpg">
    <div id="titular_texto_cabez" style="display: block; right: 6px;">{$lm_options} -  <span>{$opt_usern_data}</span>
    </div>

</div>
<div id="eins">
 <div>  


    <div id="tabss">
        <ul class="tabsbelow" id="tab-ally">
            <li class="tab_ally selected" onclick="tab.tab('datosU')" id="datosU" rel="datos">
                <a href="javascript:void(0);" rel="" class="navi overview">
                    <span>Datos del Usuario</span>
                </a>
            </li>
            <li class="tab_ally" onclick="tab.tab('generalU')" id="generalU" rel="general">
                <a href="javascript:void(0);" rel="" class="navi management">
                    <span>Opciones Generales</span>
                </a>
            </li>             
            <li class="tab_ally" onclick="tab.tab('galaxiaU')" id="galaxiaU" rel="galaxia">
                <a href="javascript:void(0);" rel="" class="navi broadcast">
                    <span>Opciones de Galaxia</span>
                </a>
            </li>
            <li class="tab_ally" onclick="tab.tab('cuentaU')" id="cuentaU" rel="cuenta">
                <a href="javascript:void(0);" rel="" class="navi applications">
                     <span class="" id="applicationTab">Acciones de Cuenta                                                <span style="display: inline;" class="newApplications undermark"></span></span>
                </a>
            </li>
            <li class="tab_ally" onclick="tab.tab('firmaU')" id="firmaU" rel="firma">
                <a href="javascript:void(0);" rel="" class="navi applications">
                     <span class="" id="applicationTab">Firma con Stats                                                <span style="display: inline;" class="newApplications undermark"></span></span>
                </a>
            </li>
        </ul>
        <form action="?page=options&amp;mode=change" method="post">
            <div class="anythingWindowAlly" id="datos">
                <div class="sectioncontent" id="allyData" style="">
                    <div class="contentz">
                        <table style="min-width:519px;width:519px;">
                            <tbody>
                            {if $user_authlevel > 0}
                            <tr>
                                <th colspan="2">{$op_admin_title_options}</th>
                            </tr><tr>
                                <td>{$op_admin_planets_protection}</td>
                                <td><input name="adm_pl_prot" type="checkbox" {if $adm_pl_prot_data > 0}checked="checked"{/if}></td>
                            </tr>
                            {/if}
                            <tr>
                                <th colspan="2">{$op_user_data}</th>
                            </tr><tr>
                                <td>{$op_username}</td>
                                <td style="height:22px;">{if $uctime}<input class="textInput float_right" name="db_character" size="20" value="{$opt_usern_data}" type="text">{else}{$opt_usern_data}{/if}</td>
                            </tr><tr>
                                <td>{$op_old_pass}</td>
                                <td><input class="textInput float_right" name="db_password" size="20" type="password" class="autocomplete"></td>
                            </tr><tr>
                                <td>{$op_new_pass}</td>
                                <td><input class="textInput float_right" name="newpass1" size="20" maxlength="40" type="password"></td>
                            </tr><tr>
                                <td>{$op_repeat_new_pass}</td>
                                <td><input class="textInput float_right" name="newpass2" size="20" maxlength="40" type="password"></td>
                            </tr><tr>
                                <td><a title="{$op_email_adress_descrip}">{$op_email_adress}</a></td>
                                <td><input class="textInput float_right" name="db_email" maxlength="64" size="20" value="{$opt_mail1_data}" type="text"></td>
                            </tr><tr>
                                <td style="height:22px;">{$op_permanent_email_adress}</td>
                                <td>{$opt_mail2_data}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <div class="anythingWindowAlly" id="general" style="display: none;">
                <div class="sectioncontent" id="allyData" style="">
                    <div class="contentz">
                        <table style="min-width:519px;width:95%">
                            <tr>
                                <td>{$op_lang}</td>
                                <td>
                                    {html_options name=langs options=$Selectors.lang selected=$langs}
                                </td>
                            </tr><tr>
                                <td>{$op_sort_planets_by}</td>
                                <td>
                                    {html_options name=settings_sort options=$Selectors.Sort selected=$planet_sort}
                                </td>
                            </tr><tr>
                                <td>{$op_sort_kind}</td>
                                <td>
                                    {html_options name=settings_order options=$Selectors.SortUpDown selected=$planet_sort_order}
                                </td>
                            </tr><tr>
                                <td>{$op_active_build_messages}</td>
                                <td><input name="hof" type="checkbox" {if $opt_hof == 1}checked="checked"{/if}></td>
                            </tr><tr>
                                <td><a title="{$op_deactivate_ipcheck_descrip}">{$op_deactivate_ipcheck}</a></td>
                                <td><input name="noipcheck" type="checkbox" {if $opt_noipc_data == 1}checked="checked"{/if}></td>
                            </tr><tr>
                                <td>{$op_show_planetmenu}</td>
                                <td><input name="settings_planetmenu" type="checkbox" {if $opt_allyl_data == 1}checked="checked"{/if}></td>
                            </tr><tr>
                                <td>{$op_small_storage}</td>
                                <td><input name="settings_tnstor" type="checkbox" {if $opt_stor_data == 1}checked="checked"{/if}></td>
                            </tr>
                        </table>
                    </div>
                </div>

            </div>

            
            <div class="anythingWindowAlly" id="galaxia" style="display: none;">
                <div class="section">
                    <h3>
                        <a id="link21" class="opened" href="javascript:void(0);" rel="allyRanks" onclick="tab.manage('link21');">
                            <span>{$op_galaxy_settings}</span>
                        </a>
                    </h3>
                </div>
                <div class="sectioncontent" id="allyRanks" style="display: none;">
                   <div class="contentz ui-tabs ui-widget ui-widget-content ui-corner-all">
                    <table style="min-width:519px;width:95%">
                            <tr>
                                <td><a title="{$op_spy_probes_number_descrip}">{$op_spy_probes_number}</a></td>
                                <td><input class="textInput float_right"name="spio_anz" maxlength="2" size="2" value="{$opt_probe_data}" type="text"></td>
                            </tr><tr>
                                <td>{$op_toolt_data}</td>
                                <td><input class="textInput float_right" name="sk" maxlength="2" size="2" value="{$opt_toolt_data}" type="text"> <small style="float:right;margin-right: 8px;margin-top: 7px;">({$op_seconds})</small></td>
                            </tr><tr>
                                <td>{$op_max_fleets_messages}</td>
                                <td><input class="textInput float_right" name="settings_fleetactions" maxlength="2" size="2" value="{$opt_fleet_data}" type="text"></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="section">
                    <h3>
                        <a id="link22" class="opened" href="javascript:void(0);" rel="short" onclick="tab.manage('link22');">
                            <span>{$op_shortcut}</span>
                        </a>
                    </h3>
                </div>
                <div class="sectioncontent" id="short" style="display: none;">
                   <div class="contentz ui-tabs ui-widget ui-widget-content ui-corner-all">
                    <table style="min-width:519px;width:95%">
                            <tr>
                                <td>{$op_spy}</td>
                                <td style="padding-bottom:8px;padding-top:3px;"><img style="padding-right:3px;" src="{$dpath}imagenes/otros/e.gif" alt=""><input name="settings_esp" type="checkbox" {if $user_settings_esp == 1}checked="checked"{/if}></td>
                            </tr><tr>
                                <td>{$op_write_message}</td>
                                <td style="padding-bottom:8px;"><img style="padding-right:3px;" src="{$dpath}imagenes/otros/m.gif" alt=""><input name="settings_wri" type="checkbox" {if $user_settings_wri == 1}checked="checked"{/if}></td>
                            </tr><tr>
                                <td>{$op_add_to_buddy_list}</td>
                                <td style="padding-bottom:8px;"><img style="padding-right:3px;" src="{$dpath}imagenes/otros/b.gif" alt=""><input name="settings_bud" type="checkbox" {if $user_settings_bud == 1}checked="checked"{/if}></td>
                            </tr><tr>
                                <td>{$op_missile_attack}</td>
                                <td style="padding-bottom:8px;"><img style="padding-right:3px;" src="{$dpath}imagenes/otros/r.gif" alt=""><input name="settings_mis" type="checkbox" {if $user_settings_mis == 1}checked="checked"{/if}></td>
                            </tr><tr>
                                <td>{$op_send_report}</td>
                                <td style="padding-bottom:8px;"><img style="padding-right:3px;" src="{$dpath}imagenes/otros/s.gif" alt=""><input name="settings_rep" type="checkbox" {if $user_settings_rep == 1}checked="checked"{/if}></td>
                            </tr>
                        </table>
                    </div>
                </div>



                
            </div>
            <div class="anythingWindowAlly" id="cuenta" style="display: none;">
                <div class="section">
                    <h3>
                        <a id="link23" class="opened" href="javascript:void(0);" rel="modv" onclick="tab.manage('link23');">
                            <span>Modo vacaciones</span>
                        </a>
                    </h3>
                </div>
                <div class="sectioncontent" id="modv" style="display: none;">
                   <div class="contentz ui-tabs ui-widget ui-widget-content ui-corner-all">
                    <table style="min-width:519px;width:95%">
                            <tr>
                               <td>
                                <a title="{$op_activate_vacation_mode_descrip}">{$op_activate_vacation_mode}</a>
                               </td>
                                <td><input name="urlaubs_modus" type="checkbox"></td>   
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="section">
                    <h3>
                        <a id="link24" class="opened" href="javascript:void(0);" rel="del" onclick="tab.manage('link24');">
                            <span>Borrar cuenta?</span>
                        </a>
                    </h3>
                </div>
                <div class="sectioncontent" id="del" style="display: none;">
                   <div class="contentz ui-tabs ui-widget ui-widget-content ui-corner-all">
                    <table style="min-width:519px;width:95%">
                            <tr>
                               <td>
                                <a title="{$op_dlte_account_descrip}">{$op_dlte_account}</a>
                                </td>
                                <td>
                                    <input name="db_deaktjava" type="checkbox" {if $opt_delac_data > 0}checked="checked"{/if}>
                                </td> 
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="anythingWindowAlly" id="firma" style="display: none;">
                <div class="sectioncontent" id="allyData" style="">
                    <div class="contentz">
                        <table style="min-width:519px;width:519px;">
                            {if extension_loaded('gd') && !CheckModule(37)}
                            <tr>
                                <td colspan="4"><br /><img src="userpic.php?id={$userid}" alt="" height="80" width="450"><br><br><table><tr><td class="transparent">HTML:</td><td class="transparent"><input class="campo_comun" type="text" value='<a href="{$path}"><img src="{$path}userpic.php?id={$userid}"></a>' readonly="readonly" style="width:450px;"></td></tr><tr><td class="transparent">BBCode:</td><td class="transparent"><input class="campo_comun" type="text" value="[url={$path}][img]{$path}userpic.php?id={$userid}[/img][/url]" readonly="readonly" style="width:450px;"></td></tr></table></td>
                            </tr>
                            {/if}
                        </table>
                    </div>
                </div>
            </div>
        </form>
    </div>




















 <br /> 
    <form action="?page=options&amp;mode=change" method="post">
        <table style="min-width:519px;width:95%">
   
    
    <tr>
        <td colspan="2"><input class="submit" value="{$op_save_changes}" type="submit"></td>
    </tr>
    </tbody>
    </table>
    </form>
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