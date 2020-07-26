
<script type="text/javascript" src="./scripts/buildlist.js"></script>
<center>
<h1>{$ow_title}</h1>
<table width="90%" class="{if empty($Messages)}table_success{else}table_error{/if}">
<tr>
    <td class="transparent">{foreach item=Message from=$Messages}
	<span>{$Message}</span><br>
	{foreachelse}{$ow_none}{/foreach}
	</td>
</tr>
</table>
 <table width="80%">
	<tr>
		<th colspan="2"><h3>ParallelGames Team</h3></th>
	</tr>
	<tr align="center">
	  <td>
	  	<a href="http://parallelgames.cubava.cu/" target="_blank">
	  		<b>Jorge Navarrete (Jekill)</b>
	  	</a>
	  </td>
	  <td>Lider de Proyecto<br />Programador<br />Diseñador</td>
	</tr>
	<tr align="center">
	<th colspan="2"><h3>A ParallelGames</h3></th>
	</tr>
	<tr class="remarcado">
	<td colspan="2"><center>
		<img src="styles/theme/gultra/imagenes/otros/parallelgameslogo.png" width="80"  style="filter: invert(1);"/>
	</center></td>
	</tr>
	<tr align="center">
	<th colspan="2"><h3>Y a los creadores de la version base de este core</h3></th>
	</tr>
	<tr class="remarcado">
	<td colspan="2"><center><img src="styles/theme/gultra/imagenes/otros/creditos.png" style="filter: invert(1);" /></center></td>
	</tr>
	</table>
<script type="text/javascript">
$(document).ready(function(){
	$('.UIStory_Message').css("color","#CCCCCC");
});
</script>
{include file="adm/overall_footer.tpl"}