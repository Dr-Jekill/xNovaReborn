<div class="contentz allyTagChange ui-tabs ui-widget ui-widget-content ui-corner-all">
    <ul class="tabsbelow" id="tab-ally-sub" style="margin-left: 36px;">
        <li class="tab_ally selected" onclick="tab.sub('oally')" id="oally" rel="oneAlly">
            <a href="javascript:void(0);" rel="" class="navi overview">
                <span>Cambiar etiq. de alianza</span>
            </a>
        </li>
        <li class="tab_ally" onclick="tab.sub('tally')" id="tally" rel="twoAlly">
            <a href="javascript:void(0);" rel="" class="navi management">
                <span>Cambiar nombre alianza</span>
            </a>
        </li>
    </ul>

    <div id="oneAlly" aria-labelledby="tabIntern" class="subtab ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-hidden="true" aria-live="polite" style="display: block;">
        <form action="?page=alliance&mode=admin&edit=tag" id="form_newTag" method="post">
            <table id="changeAllyTag" class="bborder" cellpadding="5">
                <tbody><tr>
                    <td width="50%" class="textRight">
                        Antigua etiqueta de la alianza:
                    </td>
                    <td class="value">
                        [{$tag}]
                    </td>
                </tr>
                <tr>
                    <td class="textRight">
                        Nueva etiqueta de la alianza:
                    </td>
                    <td class="value">
                        <input type="text" class="textInput" maxlength="8" name="newtag">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Guardar" class="action btn_blue float_right">
                    </td>
                </tr>
            </tbody></table>
        </form>
    </div>

    <div id="twoAlly" aria-labelledby="tabExtern" class="subtab ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-hidden="false" style="display: none;" aria-live="polite">
        <form action="?page=alliance&mode=admin&edit=name" id="form_newName" method="post">
            <table id="changeAllyName" class="bborder">
                <tbody><tr>
                    <td width="50%" class="textRight">
                        Nombre antiguo de alianza:
                    </td>
                    <td class="value">
                        {$name}                            </td>
                </tr>
                <tr>
                    <td class="textRight">
                        Nuevo nombre de alianza:
                    </td>
                    <td class="value">
                        <input type="text" class="textInput w250" maxlength="30" name="newname">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Guardar" class="action btn_blue float_right">
                    </td>
                </tr>
            </tbody></table>
        </form>
    </div>
    <div class="h10"></div>
</div>
<div class="footer"></div>