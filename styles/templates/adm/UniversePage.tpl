
{include file="adm/overall_header.tpl"}
<form enctype="multipart/form-data" action="?page=universe&amp;action=import&amp;sid={$SID}&amp;reload=t" method="POST">
<table>
	<tr>
		<th><h3>{$id}</h3></th>
		<th><h3>{$name}</h3></th>
		<th><h3>{$speeds}</h3></th>
		<th><h3>{$players}</h3></th>
		<th><h3>{$open}</h3></th>
		<th><h3>{$export}</h3></th>
		<th><h3>{$delete}</h3></th>
	</tr>
	{foreach key=ID item=UniInfo from=$Unis}
	<tr>
		<td>{$ID}</td>
		<td>{$UniInfo.uni_name}</td>
		<td>{$UniInfo.game_speed / 2500}/{$UniInfo.fleet_speed / 2500}/{$UniInfo.resource_multiplier}/{$UniInfo.halt_speed}</td>
		<td>{$UniInfo.users_amount}</td>
		<td>{if $UniInfo.game_disable == 0}{$uni_on}{else}{$uni_off}{/if}</td>
		<td><a href="?page=universe&amp;action=download&amp;id={$ID}&amp;sid={$SID}"><img src="styles/images/Adm/GO.png" alt=""></a></td>
		<td><a href="?page=universe&amp;action=delete&amp;id={$ID}&amp;sid={$SID}&amp;reload=t" onclick="return confirm('Delete?');"><img src="styles/images/Adm/i.gif" alt=""></a></td>
	</tr>
	{/foreach}
	<tr><td colspan="7"><a href="?page=universe&action=create&amp;sid={$SID}&amp;reload=t">{$new_uni}</a></td></tr>
	<tr><th colspan="7"><h3>{$import_uni}</h3></th></tr>
	<tr><td colspan="7"><input name="file" type="file"><br><input type="submit" value="{$upload}"></td></tr>
</table>
</form>
{include file="adm/overall_footer.tpl"}