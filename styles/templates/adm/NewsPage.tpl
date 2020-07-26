
{include file="adm/overall_header.tpl"}
{if isset($mode)}
<form method="POST" action="?page=news&amp;action=send&amp;mode={$mode}">
{if $news_id}<input name="id" type="hidden" value="{$news_id}">{/if}
<table>
<tr>
	<th colspan="2"><h3>{$nws_head}</h3></th>
</tr>
<tr>
<tr>
	<td width="25%">{$nws_title}</td><td><input type="text" name="title" value="{$news_title}"></td>
</tr>
<tr>
	<td>{$nws_content}</td><td><textarea cols="70" rows="10" name="text">{$news_text}</textarea></td>
</tr>
<tr>
	<td colspan="2">
		<center>
			<button class="btn btn_blue" type="submit" name="Submit">{$button_submit}</button>
		</center>
	</td>
</tr>
</table>
</form>
{/if}
<table width="450">
<tr>
	<th colspan="5"><h3>{$nws_news}</h3></thd>
</tr>
<tr>
	<th><h3>{$nws_id}</h3></th>
	<th><h3>{$nws_title}</h3></th>
	<th><h3>{$nws_date}</h3></th>
	<th><h3>{$nws_from}</h3></th>
	<th><h3>{$nws_del}</h3></th>
</tr>
{foreach name=NewsList item=NewsRow from=$NewsList}<tr>
<td><a href="?page=news&amp;action=edit&amp;id={$NewsRow.id}">{$NewsRow.id}</a></td>
<td><a href="?page=news&amp;action=edit&amp;id={$NewsRow.id}">{$NewsRow.title}</a></td>
<td><a href="?page=news&amp;action=edit&amp;id={$NewsRow.id}">{$NewsRow.date}</a></td>
<td><a href="?page=news&amp;action=edit&amp;id={$NewsRow.id}">{$NewsRow.user}</a></td>
<td><a href="?page=news&amp;action=delete&amp;id={$NewsRow.id}" onclick="return confirm('{$NewsRow.confirm}');"><img border="0" src="./styles/images/r1.png"></a></td>
</tr>
{/foreach}
<tr><td colspan="5"><center><a href="?page=news&amp;action=create" class="btn btn_blue">{$nws_create}</a></center></td></tr>
<tr><td colspan="5">{$nws_total}</td></tr>
</table>
{include file="adm/overall_footer.tpl"}