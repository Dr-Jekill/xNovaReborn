<div class="section">
    <h3>
        <a id="link11" class="opened" onclick="tab.manage('link11');" href="javascript:void(0);" rel="allyData">
            <span>Tu alianza</span>
        </a>
    </h3>
</div>

<div class="sectioncontent" id="allyData" style="display: none;">
    <div class="contentz">
                <table class="members bborder">
            <tbody><tr class="alt">
                <td class="desc">Nombre:</td>
                <td class="value"><span>{$ally_name}</span></td>
            </tr>
            <tr>
                <td class="desc">Etiqueta:</td>
                <td class="value"><span>{$ally_tag}</span></td>
            </tr>
            <tr class="alt">
                <td class="desc">Miembros:</td>
                <td class="value"><span>{$ally_members}</span></td>
            </tr>
            <tr>
                <td class="desc">Tu rango:</td>
                <td class="value"><span>{$range}</span></td>
            </tr>
            <tr class="alt">
                <td class="desc">Página principal:</td>
                <td class="value">
                    <span>
                        {if $ally_web}
							<a href="{$ally_web}" target="_blank">{$al_web_text}</a>
						{/if}
                    </span>
                </td>
            </tr>
            <tr>
                <td class="desc">&nbsp;</td>
                <td class="value">
                	{if $ally_web}
                    	<a class="btn_blue float_right" href="{$ally_web}" target="_ally">
                        Abrir página de la alianza                    </a>
                    {else}
                    	<a class="btn_blue float_right" href="javascript:void(0)">
                        Abrir página de la alianza                    </a>
                    {/if}
                </td>
            </tr>
        </tbody></table>
        <div class="h10"></div>
    </div>
    <div class="footer"></div>
</div>
{if $rights.memberlist>0 || $isowner}
<div class="section">
    <h3>
        <a id="link12" class="opened" onclick="tab.AjaxManage('link12');"  data-ref="?page=alliance&mode=admin&edit=members" href="javascript:void(0);" rel="allyMember">
            <span>Lista de miembros</span>
        </a>
    </h3>
</div>
<div class="sectioncontent" id="allyMember" style="display: none;">
    {include file="alianza/alliance_admin_members.tpl"}
</div>
{/if}

<div class="section">
    <h3>
        <a id="link13" class="opened" onclick="tab.manage('link13');" href="javascript:void(0);" rel="allyInterno">
            <span>Seccion Interna</span>
        </a>
    </h3>
</div>
<div class="sectioncontent" id="allyInterno" style="display: none;">
    <div class="contentz">
        <div id="allypage" class="bborder">
        	<span>
        		{if $ally_description}
					{$ally_description}
				{else}
					{$al_description_message}
				{/if}
			</span>
		</div>
        <div class="h10"></div>
    </div>
    <div class="footer"></div>
</div>

<div class="section">
    <h3>
        <a id="link14" class="opened" onclick="tab.manage('link14');" href="javascript:void(0);" rel="allyExterno">
            <span>Seccion Externa</span>
        </a>
    </h3>
</div>
<div class="sectioncontent" id="allyExterno" style="display: none;">
    <div class="contentz">
        <div id="allypage" class="bborder">
        	<span>{$ally_text}</span>
		</div>
        <div class="h10"></div>
    </div>
    <div class="footer"></div>
</div>

<div class="section">
    <h3>
        <a id="link15" class="opened" onclick="tab.manage('link15');" href="javascript:void(0);" rel="allyBatalla">
            <span>{$al_Allyquote}</span>
        </a>
    </h3>
</div>
<div class="sectioncontent" id="allyBatalla" style="display: none;">
    <div class="contentz">
        <div id="allypage" class="bborder">
            <table width="70%"> 
                <tr>
                    <td align="left">{$pl_totalfight}</td><td>{pretty_number($totalfight)}</td>
                </tr>
                <tr>
                    <td align="left">{$pl_fightwon}</td><td>{pretty_number($fightwon)} {if $totalfight}({round($fightwon / $totalfight * 100, 2)}%){/if}</td>
                </tr>
                <tr>    
                    <td align="left">{$pl_fightlose}</td><td>{pretty_number($fightlose)} {if $totalfight}({round($fightlose / $totalfight * 100, 2)}%){/if}</td>
                </tr>
                <tr>    
                    <td align="left">{$pl_fightdraw}</td><td>{pretty_number($fightdraw)} {if $totalfight}({round($fightdraw / $totalfight * 100, 2)}%){/if}</td>
                </tr>
                <tr>
                    <td align="left">{$pl_unitsshot}</td><td>{$unitsshot}</td>
                </tr>
                <tr>
                    <td align="left">{$pl_unitslose}</td><td>{$unitslose}</td>
                </tr>
                <tr>
                    <td align="left">{$pl_dermetal}</td><td>{$dermetal}</td>
                </tr>
                <tr>
                    <td align="left">{$pl_dercrystal}</td><td>{$dercrystal}</td>
                </tr>
            </table>
        </div>
        <div class="h10"></div>
    </div>
    <div class="footer"></div>
</div>

{if $DiploInfo}
<div class="section">
    <h3>
        <a id="link16" class="opened" onclick="tab.manage('link16');" href="javascript:void(0);" rel="allyDiplo">
            <span>{$al_diplo}</span>
        </a>
    </h3>
</div>
<div class="sectioncontent" id="allyDiplo" style="display: none;">
    <div class="contentz">
        <div id="allypage" class="bborder">
            <table width="95%">     
                <tr>
                    <th>{$pactos}</th>
                    <th>{$alianzas}</th>
                </tr>       
                {if !empty($DiploInfo.1)}
                <tr class="alt">
                    <td width="30">
                        <img class="tooltip" name="{$al_diplo_level.1}" src="styles/theme/{$Raza_skin}/imagenes/otros/pacto_alianza.png" width="60" height="58" />
                    </td>
                    <td width="100%">
                        {foreach item=PaktInfo from=$DiploInfo.1}
                        <b><a href="?page=alliance&mode=ainfo&a={$PaktInfo.1}">{$PaktInfo.0}</a></b><br />
                        {/foreach}
                    </td>
                </tr>
                {/if}
                    
                {if !empty($DiploInfo.2)}
                <tr class="alt_2">
                    <td width="30">
                        <img class="tooltip" name="{$al_diplo_level.2}" src="styles/theme/{$Raza_skin}/imagenes/otros/pacto_comercio.png" width="60" height="58" />
                    </td>
                    <td width="100%">
                        {foreach item=PaktInfo from=$DiploInfo.2}
                        <b><a href="?page=alliance&mode=ainfo&a={$PaktInfo.1}">{$PaktInfo.0}</a></b><br />
                        {/foreach}
                    </td>
                </tr>
                {/if}
                    
                {if !empty($DiploInfo.3)}
                <tr class="alt">
                    <td width="30"><img class="tooltip" name="{$al_diplo_level.3}" src="styles/theme/{$Raza_skin}/imagenes/otros/no_agrecion.png" width="60" height="58" /></td>
                    <td width="100%">{foreach item=PaktInfo from=$DiploInfo.3}<b><a href="?page=alliance&mode=ainfo&a={$PaktInfo.1}">{$PaktInfo.0}</a></b><br />{/foreach}</td>
                </tr>
                {/if}
                
                {if !empty($DiploInfo.4)}
                <tr class="alt_2">
                    <td width="30"><img class="tooltip" name="{$al_diplo_level.4}" src="styles/theme/{$Raza_skin}/imagenes/otros/en_guerra.png" width="60" height="58" /></td>
                    <td width="100%">{foreach item=PaktInfo from=$DiploInfo.4}<b><a href="?page=alliance&mode=ainfo&a={$PaktInfo.1}">{$PaktInfo.0}</a></b><br />{/foreach}</td>
                </tr>
                {/if}
            </table>
        </div>
        <div class="h10"></div>
    </div>
    <div class="footer"></div>
</div>
{/if}