<div class="contentz">
			            <form id="form_assignRank" method="post">
				            <table class="members zebra bborder" cellpadding="0" cellspacing="0" id="member-list">
				                <thead>
				                <tr class="">
				                    <th class="header">
				                        <a href="javascript:void(0);">
				                            Nombre                        </a>
				                    </th>
				                    <th></th>
				                    <th class="header">
				                        <a href="javascript:void(0);">
				                            Rango                        </a>
				                    </th>
				                    <th class="header">
				                        <a href="javascript:void(0);">
				                            Posición                        </a>
				                    </th>
				                    <th class="header">
				                        <a href="javascript:void(0);">
				                            Coordenadas                        </a>
				                    </th>
				                    <th class="header">
				                        <a href="javascript:void(0);">
				                            Ingreso                        </a>
				                    </th>
				                                            <th class="header">
				                            <a href="javascript:void(0);">
				                                Conectado                            </a>
				                        </th>
				                                            <th style="    width: 56px;">
				                        Función                    </th>
				                </tr>
				                </thead>
				                <tbody>



					{foreach name=Memberlist item=MemberInfo from=$Memberlist}
						<tr class="">
							<td><span style="">{$MemberInfo.username}</span></td>
							<td></td>
							<td><b>{$MemberInfo.range}</b></td>
							<td class="member_score tooltipLeft tooltip" name="{$MemberInfo.points} Puntos">
								<a href="game.php?page=statistics#{$MemberInfo.rango}"><b>{$MemberInfo.rango}</b></a></td>

							<td>
								<span class="dark_highlight_tablet">
								<a href="game.php?page=galaxy&amp;mode=3&amp;galaxy={$MemberInfo.galaxy}&amp;system={$MemberInfo.system}"><b>[</b>{$MemberInfo.galaxy}:{$MemberInfo.system}:{$MemberInfo.planet}<b>]</b></a>
								</span>
							</td>
							<td>{$MemberInfo.register_time}</td>
							
							<td>{if $rights.onlinestatus>0  || $isowner}
									{if $MemberInfo.onlinetime < 4}
										<span class="undermark"> On </span>
									{elseif $MemberInfo.onlinetime >= 4 && $MemberInfo.onlinetime <= 15}
										<span class="rmark"> On </span>
									{else}
										<span class="overrmark"> Off </span>
									{/if}
								{else}
									-
								{/if}
							</td>
							<td >
								<a href="#" onclick="return Dialog.PM({$MemberInfo.id});"><img src="{$dpath}imagenes/otros/m.gif" border="0" title="{$write_message}"></a>
							
								{if $MemberInfo.action > 0}
								{if $MemberInfo.action == 2}
									<a href="game.php?page=alliance&amp;mode=admin&amp;edit=members&amp;action=kick&amp;id={$MemberInfo.id}" onclick="javascript:return confirm('{$MemberInfo.kick}');"><img src="{$dpath}pic/abort.gif" border="0" alt=""></a>{/if}
								{else}{/if}

							</td>
						
						</tr>
					{/foreach}
					</tbody>
					<form action="?page=alliance" method="GET"></form>
				                                    <tfoot>
				                    <tr class="">
				                        <td colspan="4" align="right">
				                            <select name="id">
				                            	{foreach item=users from=$UsersL}
				                            	<option value="{$users.idU}">{$users.name}</option>
				                            	{/foreach}
				                            </select>
				                        </td>
				                        <td colspan="2" align="right">
				                            <select name="newrang">
				                            	{foreach item=range from=$Ranges}
				                            	<option value="{$range.idR}">{$range.name}</option>
				                            	{/foreach}
				                            </select>
				                            <input type="hidden" name="mode" value="admin">
				                            <input type="hidden" name="edit" value="members">
				                        </td>
				                        <td colspan="2" align="right">
				                            <button rev="form_assignRank" rel="7" token="56ab9ffd3b6e14054264d2b40b517e7d" class=" action btn_blue float_right" type="submit">
				                                Asignar rango                            </button>
				                        </td>
				                    </tr>
				                    </tfoot>
				                                </table>
				        </form>
			        <div class="h10"></div>
			    </div>
			    <div class="footer"></div>