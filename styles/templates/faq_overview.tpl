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
<div id="titulo_alternativo_corto">
    <ul class="tabsbelow">
        <li>
              <span><b>{$faq_overview}</b></span>
        </li>                                    
    </ul>
</div>
<div id="eins_small">
<div>   
<br /> 
    <table width="95%">
	{foreach key=Question item=Answer from=$FAQList}
	<tr>
		<th>{$Question}</th>
	</tr>
	<tr>
		<td class="left">
		{$Answer}
		</td>
	</tr>
	{/foreach}
</table>
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