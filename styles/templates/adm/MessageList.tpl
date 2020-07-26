{include file="adm/overall_header.tpl"}
<br>
<script type="text/javascript">
var checked = false;
function checkedAll (frm1) {
	var aa = document.getElementById('select_all');
	if(checked == false)
		checked = true;
	else
		checked = false;
		
	for (var i =0; i < aa.elements.length; i++) 
	{
		aa.elements[i].checked = checked;
	}
}

</script>
<form action="" method="post" id="select_all">
<input type="hidden" name="curr" value="{$ViewPage}">
<input type="hidden" name="pmax" value="{$MaxPage}">
<input type="hidden" name="sele" value="{$Selected}">
   	<table width="90%" border="0" cellspacing="1" cellpadding="1">   
		<tr>
            <th><h3>{$ml_page}</h3></th>
            <th><h3>{$ml_type}</h3></th>
        	<th><h3>{$ml_dlte_since}</h3></th>
        </tr>
		<tr>
            <td>
            <select name="side" onChange="submit();">
            	{html_options options=$Selector.pages selected=$ViewPage}
            </select>
            </td>
            <td>
            <select name="type" onChange="submit();">
            	{html_options options=$Selector.type selected=$Selected}
            </select>
            </td>
			<td>
				<input type="text" name="selday" onClick="if(this.value == 'dd') this.value = '';" onBlur="if(this.value == '') this.value= 'dd';" value="dd" size="3" maxlength="2"> 
				<input type="text" name="selmontd" onClick="if(this.value == 'mm') this.value = '';" onBlur="if(this.value == '') this.value= 'mm';" value="mm" size="3"  maxlength="2"> 
				<input type="text" name="selyear" onClick="if(this.value == 'yyyy') this.value = '';" onBlur="if(this.value == '') this.value= 'yyyy';" value="yyyy" size="6"  maxlength="4">
			</td>
        </tr> 
		<tr>
            <td><input type="submit" name="prev" value="[ <- ]">&nbsp;<input type="submit" name="next" value="[ -&gt; ]"></td>
            <td><input type="submit" name="delsel" value="{$ml_dlte_selection}"></td>
			<td><input type="submit" name="deldat" value="{$ml_dlte_since_button}"></td>
        </tr> 
	</table>
	<table width="90%" border="0" cellspacing="1" cellpadding="1">  	
		<tr align="center">
			<th><h3><input title="{$button_des_se}" type="checkbox" name="checkall" onClick="checkedAll(select_all);" value="{$ml_select_all_messages}"></h3></th>
			<th><h3>{$input_id}</h3></th>
			<th><h3>{$ml_date}</h3></th>
			<th><h3>{$ml_from}</h3></th>
			<th><h3>{$ml_to}</h3></th>
			<th width="15%"><h3>{$ml_subject}</h3></th>
			<th width="60%"><h3>{$ml_content}</h3></th>
        </tr>
        {foreach item=Message from=$MessagesList}
		<tr>
			<td><input type="checkbox" name="sele[{$Message.id}]"></td>
			<td>{$Message.id}</td>
			<td>{$Message.time}</td>
			<td>{$Message.from}</td>
			<td>{$Message.to}</td>
			<td>{$Message.subject}</td>
			<td>{$Message.text}</td>
		</tr>
		{/foreach}
    </table>
</form>
{include file="adm/overall_footer.tpl"}