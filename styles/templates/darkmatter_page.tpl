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
<div class="coso_izquierda"></div>
<div class="coso_derecha"></div>
<div id="planeta" style="background-image: url(styles/theme/{$Raza_skin}/adds/materia_oscura.jpg);"></div>
<div id="titulo_alternativo">
    <ul class="tabsbelow">
        <li>
              <span><b>{$caja}1</b></span>
        </li>                                    
    </ul>
</div>
<div id="eins">
 <div>	
 <br />
<table width="95%">
<tr>
<td width="130">
<img border="0" src="styles/theme/{$Raza_skin}/gebaeude/materia_venta.png" align="top" width="80" height="80">
</td>
<td>
<font color=yellowgreen size="2"><b>{$cantidad_norio1_materia} {$de_materia}</b></font>
<br /><br />
<center><b><font color="orange">{$Norio}:</font> {$cantidad_norio1}</b></center>
</td>
<td align="right"><a href="?page=materiaoscura&pack=norio1"><div class="cancelar_c"><span class="comprar_c">{$comprar}&nbsp;</span></div></a></td>
</tr>
</table>
</div>
</div>	
<div class="new_footer"></div>	

<div id="titulo_alternativo_secundario">
    <ul class="tabsbelow">
        <li>
              <span><b>{$caja}2</b></span>
        </li>                                    
    </ul>
</div>
<div id="eins">
 <div>	
 <br />
<table width="95%">
<tr>
<td width="130">
<img border="0" src="styles/theme/{$Raza_skin}/gebaeude/materia_venta.png" align="top" width="80" height="80">
</td>
<td>
<font color=yellowgreen size="2"><b>{$cantidad_norio2_materia} {$de_materia}</b></font>
<br /><br />
<center><b><font color="orange">{$Norio}:</font> {$cantidad_norio2}</b></center>
</td>
<td align="right"><a href="?page=materiaoscura&pack=norio2"><div class="cancelar_c"><span class="comprar_c">{$comprar}&nbsp;</span></div></a></td>
</tr>
</table>
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
{include file="overall_footer.tpl"}