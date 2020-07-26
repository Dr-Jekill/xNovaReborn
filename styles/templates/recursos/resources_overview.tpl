{include file="overall_header.tpl"}
<body id="mercado">
<div class="contenido_big">
<div id="cajaBG">
    <div id="caja">
<div id="topnav" class="header_normal">     
        {include file="overall_topnav.tpl"} 
            
    </div> 
{include file="left_menu.tpl"}
<div id="contenidoMostrado">                               
<div id="elCosoxD">

<div id="titular_texto_cabez" style="display: block; right: 6px;">{$recursos_config} - <span>{$planetname}</span></div>
<div id="planets">
    {$header}
</div>



<div id="titulo_alternativo">
    <ul class="tabsbelow">
                                   
    </ul>
</div>
<div id="eins">
        <div>   
    <form action="?page=resources&load=res" method="post">
    <table class="recursos_tabla" width="95%">
    <tbody>
    <tr>
    <td colspan="3"></td>
    <td></td>
    <td colspan="2"><input class="calcular" value="{$rs_calculate}" type="submit"></td>
    <td></td>
    <td></td>
    </tr>
    <tr style="text-align:right;">
    <td ></td>
    <td></td>
    <td ><h3>Metal</h3></td>
    <td ><h3>Crystal</h3></td>
    <td ><h3>Deuterio</h3></td>
    <td ><h3>Norio</h3></td>
    <td><h3>Energia</h3></td>
    <td></td>
    </tr>
    <tr style="height: 22px; text-align:left;" class="semi_remarcado">
        <td>{$rs_basic_income}</td>
        <td></td>
        <td style="text-align:right;">{$metal_basic_income}</td>
        <td style="text-align:right;">{$crystal_basic_income}</td>
        <td style="text-align:right;">{$deuterium_basic_income}</td>
        <td style="text-align:right;">{$norio_basic_income}</td>        
        <td style="text-align:right;">{$energy_basic_income}</td>
        <td ></td>
    </tr>
    {foreach item=CurrPlanetInfo from=$CurrPlanetList}
    <tr style="text-align:left;" class="{if $CurrPlanetInfo.sel==0}semi_remarcado{/if}">
        <td>{$CurrPlanetInfo.type} ({$CurrPlanetInfo.level} {$CurrPlanetInfo.level_type})</td>
        <td></td>
        <td style="text-align:right;"><h3  name="{$CurrPlanetInfo.irs}">{$CurrPlanetInfo.metal_type}</h3></td>
        <td style="text-align:right;"><h3  name="{$CurrPlanetInfo.irs}" id="iris">{$CurrPlanetInfo.crystal_type}</h3></td>
        <td style="text-align:right;"><h3  name="{$CurrPlanetInfo.irs}">{$CurrPlanetInfo.deuterium_type}</h3></td>
        <td style="text-align:right;"><h3  name="{$CurrPlanetInfo.irs}">{$CurrPlanetInfo.norio_type}</h3></td>      
        <td style="text-align:right;"><h3>{$CurrPlanetInfo.energy_type}</h3></td>
        <td style="text-align:right;">
        {if $CurrPlanetInfo.id!='122'}{html_options name=$CurrPlanetInfo.name options=$option selected=$CurrPlanetInfo.optionsel class="select"  style="text-width:100%;"}{/if}
        </td>
    </tr>
    {/foreach}
    {foreach item=CurrPlanetInfo from=$CurrPlanetListC}
    <tr style="text-align:left; {if $CurrPlanetInfo.active==0}color:#444;{/if}" class="{if $CurrPlanetInfo.sel==0}semi_remarcado{/if}">
        <td>{$CurrPlanetInfo.nombre}</td>
        <td><img src="styles/theme/{$Raza_skin}/imagenes/navegacion/oficiales/{$CurrPlanetInfo.imagen}"></td>
        <td style="text-align:right;"><h3 name="{$CurrPlanetInfo.irs}">{$CurrPlanetInfo.metal_type}</h3></td>
        <td style="text-align:right;"><h3 name="{$CurrPlanetInfo.irs}">{$CurrPlanetInfo.crystal_type}</h3></td>
        <td style="text-align:right;"><h3 name="{$CurrPlanetInfo.irs}">{$CurrPlanetInfo.deuterium_type}</h3></td>
        <td style="text-align:right;"><h3 name="{$CurrPlanetInfo.irs}">{$CurrPlanetInfo.norio_type}</h3></td>       
        <td style="text-align:right;"><h3>{$CurrPlanetInfo.energy_type}</h3></td>
        <td style="text-align:right;"></td>
    </tr>
    {/foreach}
    <tr>
        <td  style=" text-align:left;">{$rs_storage_capacity}</td>
        <td></td>
        <td  style=" text-align:right;"><h3>{$metalmax}</h3></td>
        <td  style=" text-align:right;"><h3>{$crystalmax}</h3></td>
        <td  style=" text-align:right;"><h3>{$deuteriummax}</h3></td>
        <td  style=" text-align:right;"><h3>{$noriomax}</h3></td>
        <td  style=" text-align:right;">-</td>
    </tr><tr  class="semi_remarcado">
        <td style="border-top: 1px dotted #848484; text-align:left;">{$rs_sum}</td>
        <td style="border-top: 1px dotted #848484; text-align:right;"></td>
        <td style="border-top: 1px dotted #848484; text-align:right;" class="semi_remarcado"><h3>{$metal_total}</h3></td>
        <td style="border-top: 1px dotted #848484; text-align:right;" class="semi_remarcado"><h3>{$crystal_total}</h3></td>
        <td style="border-top: 1px dotted #848484; text-align:right;" class="semi_remarcado"><h3>{$deuterium_total}</h3></td>
        <td style="border-top: 1px dotted #848484; text-align:right;" class="semi_remarcado"><h3>{$norio_total}</h3></td>       
        <td style="border-top: 1px dotted #848484; text-align:right;" class="semi_remarcado"><h3>{$energy_total}</h3></td>
        <td style="border-top: 1px dotted #848484; text-align:right;"></td> 
    </tr>
    <tr>
        <td style=" text-align:left;">{$rs_daily}</td>
        <td></td>
        <td style=" text-align:right;"><h3>{$daily_metal}</h3></td>
        <td style=" text-align:right;"><h3>{$daily_crystal}</h3></td>
        <td  style=" text-align:right;"><h3>{$daily_deuterium}</h3></td>
        <td style=" text-align:right;"><h3>{$daily_norio}</h3></td>     
        <td style=" text-align:right;"><h3>{$energy_total}</h3></td>
    </tr>
    <tr  class="semi_remarcado">
        <td style=" text-align:left;">{$rs_weekly}</td>
        <td></td>
        <td style=" text-align:right;"><h3>{$weekly_metal}</h3></td>
        <td  style=" text-align:right;"><h3>{$weekly_crystal}</h3></td>
        <td  style=" text-align:right;"><h3>{$weekly_deuterium}</h3></td>
        <td  style=" text-align:right;"><h3>{$weekly_norio}</h3></td>       
        <td  style=" text-align:right;"><h3>{$energy_total}</h3></td>
        <td></td>
    </tr>
    </tbody>
    </table>
    </form>
        </div>
</div>  
<div class="new_footer"></div>
<br /><br /><br />      
</div>
</div>
{include file="planet_menu.tpl"}
</div>  
</div>  
</div>  
<!--{include file="planet_menu.tpl"}-->
{include file="overall_footer.tpl"}
