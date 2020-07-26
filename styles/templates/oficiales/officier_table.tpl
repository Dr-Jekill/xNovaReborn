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
<div id="planeta_small" style="background-image: url(styles/theme/{$Raza_skin}/adds/oficiales.jpg);">
  <div id="titular_texto_cabez" style="display: block; right: 6px;">Oficiales</div>
</div>
<!-- CAJA MATERIA OSCURA -->
<div id="titulo_alternativo">
    <ul class="tabsbelow">
        <li>
              <span><b>{$Darkmatter}</b></span>
        </li>                                    
    </ul>
</div>
<div id="eins">
 <div>	
 <br />
 <table width="95%">
<tr>
<td width="130">
<img border="0" src="styles/theme/{$Raza_skin}/gebaeude/materia.png" align="top" width="130" height="130">
</td>
<td>
<font color=yellowgreen size="2"><b>{$materia_oscura_descr}</b></font>
</td>
<td align="right"><a href="?page=materiaoscura"><div class="cancelar_c"><span class="comprar_c">{$comprar}&nbsp;</span></div></a></td>
</tr>
</table>
 </div>
 </div>
<div class="new_footer"></div>	
<!-- FIN CAJA MATERIA OSCURA -->	

<!-- CAJA OFICIALES -->
<div id="titulo_alternativo_secundario">
    <ul class="tabsbelow">
        <li>
              <span><b>{$oficiales}</b></span>
        </li>                                    
    </ul>
</div>
<div id="eins">
 <div>	
 <br />
   <table width="95%">		
	<ul class="estructuras_c">
		 {include file="oficiales/officier_row.tpl"}
		 
	<ul>
    </table>
</div>
</div>	
<div class="new_footer"></div>
<!-- FIN CAJA OFICIALES -->		  
<br /><br /><br />	
</div>
<div id="buildlist" style="display:none;"></div>  
<br/ ><br /><br />
</div>
{include file="planet_menu.tpl"}
</div>
</div>
</div>
{if $data}
<script type="text/javascript">
data	= {$data};
</script>
{/if}
{include file="overall_footer.tpl"}