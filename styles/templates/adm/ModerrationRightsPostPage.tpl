
{include file="adm/overall_header.tpl"}
<form action="" method="post">
<input name="action" type="hidden" value="send">
<input name="id_1" type="hidden" value="{$id}">
<table width="55%">
<tr>
	<th colspan="2"><h3>{$ad_authlevel_title}<h3></th>
</tr>
	<td>
		{$User}
	</td>
	<td>
		<a href="javascript:;" onclick="$('.yes').attr('checked', 'checked');">{$yesorno.1}</a> <a href="javascript:;" onclick="$('.no').attr('checked', 'checked');">{$yesorno.0}</a>
	</td>
</tr>
{foreach item=File from=$Files}
<tr>
	<td>
		{$File}
	</td>
	<td>
		{$yesorno.1} <input class="yes" name="rights[{$File}]" type="radio"{if $Rights.$File == 1} checked="checked"{/if} value="1"> {$yesorno.0} <input class="no" name="rights[{$File}]" type="radio"{if $Rights.$File != 1} checked="checked"{/if} value="0">
	</td>
</tr>
{/foreach}
<tr><td colspan="3">
	<center>
		<button class="btn btn_blue" type="submit">{$button_submit}</button>
	</center>
</td></tr>
</table>
</form>
{include file="adm/overall_footer.tpl"}