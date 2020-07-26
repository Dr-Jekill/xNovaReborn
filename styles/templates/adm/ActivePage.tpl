{include file="adm/overall_header.tpl"}
<br>
<script type="text/javascript">
	function ajax(url) {
		$.get(url, function(data){
			Dialog.alert(data, function(){
			parent.frames['Hauptframe'].location.reload()
			});
		});
	}
</script>
<table width="450">
<tr>
	<th colspan="7"><h3>{$nicht_aktivierte_u}</h3></th>
</tr>
<tr>
	<th><h3>{$id}</h3></th>
	<th><h3>{$username}</h3></th>
	<th><h3>{$datum}</h3></th>
	<th><h3>{$email}</h3></th>
	<th><h3>{$ip}</h3></th>
	<th><h3>{$aktivieren}</h3></th>
	<th><h3>{$del}</h3></th>
</tr>
{foreach name=User item=User from=$Users}
<tr>
	<td>{$User.id}</td>
	<td>{$User.name}</td>
	<td><nobr>{$User.date}</nobr></td>
	<td>{$User.email}</td>
	<td>{$User.ip}</td>
	<td><a href="javascript:ajax('./index.php?page=reg&mode=valid&lang={$UserLang}&clef={$User.cle}&admin=1','{$User.username}');">{$aktivieren}</a></td>
	<td><a href="?page=active&amp;action=delete&id={$User.id}" onclick="return confirm('{$sicher}{$User.username} {$entfernen}');"><img border="0" src="./styles/images/r1.png"></a></td>
</tr>
{/foreach}	
<tr><td colspan="8"><center>{$insgesamt} {$smarty.foreach.User.total} {$nicht_aktivierte}</center></td></tr>
</table>
{include file="adm/overall_footer.tpl"}