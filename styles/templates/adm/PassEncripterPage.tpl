
{include file="adm/overall_header.tpl"}
<center>
<form method="post" action="">
<table width="40%">
<tr>
	<th colspan="2"><h3>{$et_md5_encripter}</h3></th>
</tr>
<tr>
	<td>{$et_pass}</td>
	<td><input type="text" name="md5q" size="45" value="{$md5_md5}"></td>
</tr><tr>
	<td>{$et_result}</td>
	<td><input type="text" name="md5w" size="45" value="{$md5_enc}"></td>
</tr><tr>
	<td colspan="2">
		<center>
			<button class="btn btn_blue" type="submit">{$et_encript}</button>
		</center>
	</td>
</tr>
</table>
</form>
</center>
{include file="adm/overall_footer.tpl"}