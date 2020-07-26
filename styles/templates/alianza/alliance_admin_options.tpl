<form action="?page=alliance&mode=admin&edit=options" id="form_settings" method="post" name="options" >
        <div class="contentz allyprefs ui-tabs ui-widget ui-widget-content ui-corner-all">
            <table id="preferences" cellspacing="2" cellpadding="2">
                <tbody><tr>
                    <td>
                        Página principal                    </td>
                    <td>
                        <input type="text" class="textInput w290" size="70" value="{$ally_web}" name="web">
                    </td>
                </tr>
                <tr>
                    <td>
                        Logo de la alianza                    </td>
                    <td>
                        <input type="text" class="textInput w290" size="70" value="{$ally_image}" name="image">
                    </td>
                </tr>
                <tr>
                    <td>
                        Solicitudes                    </td>
                    <td>
                        <input class="w300 dropdownInitialized" type="hidden" id="state" name="request_notallow" style="display: none;" value="{if $request_notallow==0} 0 {else} 1 {/if}">
                            <span class="dropdown currentlySelected w300" rel="dropdown648" style="width: 300px;"><a class="undefined" data-value="0" rel="dropdown648" href="javascript:void(0);" onclick="showSelect(this)" id="select">
                               {if $request_notallow==0} Posible (alianza abierta) {else} Imposible (alianza cerrada) {/if}                         </a></span>


                        <ul class="dropdown dropdownList initialized" id="dropdown648" style="left: 254px;min-width: 300px;width: 200px;height: 50px; display:none;">
              <li>
                <a class="undefined focus" data-value="0" onclick="retorno(this, 'state', 'dropdown648')">
                        Posible (alianza abierta)
                    </a>
                </li>
                <li>
                  <a class="undefined" data-value="1" onclick="retorno(this, 'state', 'dropdown648')">
                        Imposible (alianza cerrada)
                    </a>
                </li>
            </ul>
                    </td>
                </tr>
                <tr>
                    <td>
                        Cambiar nombre del título de fundador a:                    </td>
                    <td>
                        <input type="text" class="textInput" maxlength="20" size="30" value="{$ally_owner_range}" name="owner_range">
                    </td>
                </tr>
                <tr>
                    <td>{$al_view_stats}</td>
                    <td>{html_options name=stats options=$YesNoSelector selected=$ally_stats_data class="textInput w290 select"}</td>
                </tr>
                <tr>
                  <td>{$al_view_diplo}</td>
                  <td>{html_options name=diplo class="select" options=$YesNoSelector selected=$ally_diplo_data}</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Guardar" href="javascript:void(0);" class="action btn_blue float_right" name="options">
                    </td>
                </tr>
            </tbody></table>
            <div class="h10"></div>
        </div>
        <div class="footer"></div>
</form>