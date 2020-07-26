<div class="contentz quitAlly ui-tabs ui-widget ui-widget-content ui-corner-all">
    <ul class="tabsbelow" id="tab-ally-sub" style="margin-left: 36px;">
        <li class="tab_ally selected" onclick="tab.sub('oallyq', 'allyDissolve')" id="oallyq" rel="oneAllyQuit">
            <a href="javascript:void(0);" rel="" class="navi overview">
                <span>Eliminar esta alianza</span>
            </a>
        </li>
        <li class="tab_ally" onclick="tab.sub('tallyq', 'allyDissolve')" id="tallyq" rel="twoAllyQuit">
            <a href="javascript:void(0);" rel="" class="navi management">
                <span>Entregar alianza</span>
            </a>
        </li>
    </ul>

    <div id="oneAllyQuit" aria-labelledby="tabIntern" class="subtab ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-hidden="false" aria-live="polite" style="display: block;">
        <form action="game.php?page=alliance&mode=admin&edit=exit" method="post">
            <table id="dissolveally" class="bborder">
                <tbody><tr>
                    <th class="textCenter">
                        Eliminar esta alianza?
                    </th>
                </tr>
                <tr>
                    <td class="textCenter">
                        <input type="submit" value="Disolver" class="dissolve btn_blue" href="game.php?page=alliance&mode=admin&edit=transfer" onclick="return confirm('¿De verdad quieres renunciar a tu puesto en la alianza?');">
                        </a>
                    </td>
                </tr>
            </tbody></table>
        </form>
        <div class="h10"></div>
    </div>

    <div id="twoAllyQuit" aria-labelledby="tabExtern" class="subtab ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-hidden="true" style="display: none;" aria-live="polite">
                                <form action="game.php?page=alliance&mode=admin&edit=transfer" method="post" id="form_setNewLeader" name="changeFounder">
                <input type="hidden" name="token" value="08c2948470473ee7b5f8165439056ad9">                            <table id="assignally" class="bborder">
                    <tbody><tr>
                        <th class="textCenter">
                            ¿Quieres ceder esta alianza?                                    </th>
                    </tr>
					<tr>
                        <td class="textCenter">
                        	{if $TransferUsers.id!=''}
                                {html_options name=newleader options=$TransferUsers} 
                                {$TransferUsers}                                    
                       		{else}
                       			Ninguno de los miembros tienen el derecho de "mano derecha". No puedes transferir la alianza. 
                       		{/if}
                        </td>
                    </tr>
                    {if $TransferUsers.id!=''}
                    <tr>
                    	<td class="textCenter">
                    		<input type="submit" value="Transferir" class="dissolve btn_blue">
                    	</td>
                    </tr>     
                    {/if}
                    
                </tbody></table>
                
            </form>
                            </div>
    <div class="h10"></div>
</div>
<div class="footer"></div>