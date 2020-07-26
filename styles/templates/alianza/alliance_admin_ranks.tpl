<div class="contentz ui-tabs ui-widget ui-widget-content ui-corner-all">
    <form action="game.php?page=alliance&amp;mode=admin&amp;edit=rights" id="form_allyRankRights" method="post">
        <table cellpadding="0" cellspacing="0" id="ranks" class="zebra">
                                <tbody><tr class="rank_cat border_bottom">
                    <th></th>
                    <th class=""><span class="rank_name">Nombre de rango</span></th>
                    <th class="border_left" colspan="2">Solicitudes</th>
                    <th class="border_left" colspan="4">Miembros</th>
                    <th class="border_left" colspan="4">Alianza</th>
                </tr>
                <tr class="border_bottom alt">
                    <th class="delete_rank"></th>
                    <th class="rank_name"></th>
                    <th class="border_left">
                        <img src="./styles/theme/gultra/imagenes/otros/alianza/ver_sol.gif">
                    </th>
                    <th class="border_left">
                        <img src="./styles/theme/gultra/imagenes/otros/alianza/rev_sol.gif">
                    </th>
                    <th class="border_left">
                        <img src="./styles/theme/gultra/imagenes/otros/alianza/memberlist.gif">
                    </th>
                    <th class="border_left">
                        <img src="./styles/theme/gultra/imagenes/otros/alianza/exp_user.gif">
                    </th>
                    <th class="border_left">
                        <img src="./styles/theme/gultra/imagenes/otros/alianza/ver_online.gif">
                    </th>
                    <th class="border_left">
                        <img src="./styles/theme/gultra/imagenes/otros/alianza/circular.gif">
                    </th>
                    <th class="border_left">
                        <img src="./styles/theme/gultra/imagenes/otros/alianza/dis_ally.gif">
                    </th>
                    <th class="border_left">
                        <img src="./styles/theme/gultra/imagenes/otros/alianza/admin_ally.gif">
                    </th>
                    <th class="border_left">
                        <img src="./styles/theme/gultra/imagenes/otros/alianza/mano.gif">
                    </th>
                </tr>
                                       
                    {foreach item=RankInfo from=$AllyRanks}
                    	<tr id="rankRights1733" class="">
                        <td class="delete-rank">
                        	<a href="game.php?page=alliance&amp;mode=admin&amp;edit=rights&amp;d={$RankInfo.id}"><img src="{$dpath}pic/abort.gif" alt="{$Delete_range}" border="0"></a>
                                                        </td>
                        <td class="desc">
                        	<input type="hidden" name="id[]" value="{$RankInfo.id}">
                            <span class="rank_name">{$RankInfo.name}</span>
                        </td>
                                                        <td class="check border_left">
                                <input type="checkbox" name="u{$RankInfo.id}r0" {if $RankInfo.close} checked="checked"{/if}{if !$close}disabled{/if}>
                            </td>
                                                            <td class="check border_left">
                                <input type="checkbox" name="u{$RankInfo.id}r1" {if $RankInfo.kick} checked="checked"{/if}{if !$kick}disabled{/if}>
                            </td>
                                                            <td class="check border_left">
                                <input type="checkbox" name="u{$RankInfo.id}r2" {if $RankInfo.seeapply} checked="checked"{/if}{if !$seeapply}disabled{/if}>
                            </td>
                                                            <td class="check border_left">
                                <input type="checkbox" name="u{$RankInfo.id}r3" {if $RankInfo.memberlist} checked="checked"{/if}{if !$memberlist}disabled{/if}>
                            </td>
                                                            <td class="check border_left">
                                <input type="checkbox" name="u{$RankInfo.id}r4" {if $RankInfo.changeapply} checked="checked"{/if}{if !$changeapply}disabled{/if}>
                            </td>
                                                            <td class="check border_left">
                                <input type="checkbox" name="u{$RankInfo.id}r5" {if $RankInfo.admin} checked="checked"{/if}{if !$admin}disabled{/if}>
                            </td>
                                                            <td class="check border_left">
                                <input type="checkbox" name="u{$RankInfo.id}r6" {if $RankInfo.memberlist_on} checked="checked"{/if}{if !$memberlist_on}disabled{/if}>
                            </td>
                                                            <td class="check border_left">
                                <input type="checkbox" name="u{$RankInfo.id}r7" {if $RankInfo.roundmail} checked="checked"{/if}{if !$roundmail}disabled{/if}>
                            </td>
                                                            <td class="check border_left">
                                <input type="checkbox" name="u{$RankInfo.id}r8" {if $RankInfo.righthand} checked="checked"{/if}{if !$righthand}disabled{/if}>
                            </td>
                                                    </tr>
                    {/foreach}
                                        <tr class="">
                    <td colspan="12" class="no_bg">
                        	<input type="submit" value="Guardar" class="action btn_blue float_right">
                    </td>
                </tr>
                <tr class="al">
                    <td colspan="12">
                        <b>¡Atención!</b> Solamente puedes conceder derechos si tú también los tienes.                        </td>
                </tr>
                <tr class="al">
                	<td colspan="11" class="no_bg">&nbsp;</td>
            	</tr>
        </tbody></table>
    </form>
    <div id="rank_explanation">
        <table>
            <tbody><tr>
                <td colspan="6">
                    <h3>Descripción de las leyes</h3>
                </td>
            </tr>
            <tr>
                <td width="25px">
                    <img src="./styles/theme/gultra/imagenes/otros/alianza/ver_sol.gif">
                    
                </td>
                <td>
                    Ver las solicitudes                    </td>
                <td width="25px">
                        <img src="./styles/theme/gultra/imagenes/otros/alianza/rev_sol.gif">

                </td>
                <td>
                    Revisar las solicitudes                    </td>
                <td width="25px">
                    <img src="./styles/theme/gultra/imagenes/otros/alianza/memberlist.gif">
                        
                </td>
                <td>
                    Ver la lista de miembros                    </td>
            </tr>
            <tr>
                <td width="25px">
                    <img src="./styles/theme/gultra/imagenes/otros/alianza/exp_user.gif">
                    
                        
                </td>
                <td>
                    Expulsar usuario                    </td>
                <td width="25px">
                    <img src="./styles/theme/gultra/imagenes/otros/alianza/ver_online.gif">

                        
                </td>
                <td>
                    ver estado en línea                    </td>
                <td width="25px">
                    <img src="./styles/theme/gultra/imagenes/otros/alianza/circular.gif">
                    
                        
                </td>
                <td>
                    Crear un correo circular                    </td>
            </tr>
            <tr>
                <td width="25px">
                    <img src="./styles/theme/gultra/imagenes/otros/alianza/dis_ally.gif">
                    
                       
                </td>
                <td>
                    Disolver alianza                    </td>
                <td width="25px">
                     <img src="./styles/theme/gultra/imagenes/otros/alianza/admin_ally.gif">
                        
                       
                </td>
                <td>
                    Administrar alianza                    </td>
                <td width="25px">
                    <img src="./styles/theme/gultra/imagenes/otros/alianza/mano.gif">
                </td>
                <td>
                    <span class="right_hand_tablet">
                        mano derecha                        </span>
                    <a name="`Mano derecha` ( es necesario para transferir la posición de fundador)" href="javascript:void(0);" class="tooltip tooltipRight help">
                    </a>
                </td>
            </tr>
        </tbody></table>
    </div>
    <div class="new_rank">
        <div id="newRank">
            <form method="post" action="game.php?page=alliance&mode=admin&edit=rights" id="form_newRank">
                <input type="submit" value='Crear nuevo rango' class="action btn_blue float_right">
                <input type="text" class="textInput float_right" size="30" maxlength="20" id="newrangname" name="newrangname">
            </form>
        </div>
    </div>
</div>
<div class="footer"></div>