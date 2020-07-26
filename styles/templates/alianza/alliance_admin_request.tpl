<script type="text/javascript">
	function infodiv(i){
		$('.request:visible').slideUp(500);
		$('#'+i).slideDown(500);
	}
</script>
	
 <table width="95%" class="tb">
    <tr>
      <th class="ct_th ct_sortable_title">{$al_candidate}</th>
      <th class="ct_th ct_sortable_title">{$al_request_date}</th>
    </tr>
    {foreach item=RequestRow from=$RequestList}
	<tr><td><a href="javascript:infodiv('request_{$RequestRow.id}');">{$RequestRow.username}</a></td><td><a href="javascript:infodiv('request_{$RequestRow.id}');">{$RequestRow.time}</a></td></tr>
	{foreachelse}
	<tr><td colspan="2">{$al_no_requests}</td></tr>
	{/foreach}
</table>

{foreach item=RequestRow from=$RequestList}
<div class="section">
    <h3>
        <a id="link21" class="opened" href="javascript:void(0);" rel="allyRanks">
            <span><b>{$al_request_from_user} <font color="orange">{$RequestRow.username}<font></b></span>
        </a>
    </h3>
</div>
	<div>	
		<div class="request" id="request_{$RequestRow.id}" style="display:none;">
			<form action="?page=alliance&amp;mode=admin&amp;edit=requests&amp;action=send&amp;id={$RequestRow.id}" method="POST">
    			 <table width="90%">	
					<tr>
						<td colspan="2">{$RequestRow.text}</td>
					</tr>
					<tr>
						<th colspan="2">{$al_reply_to_request}</th>
					</tr>
					<tr>
						<td><span id="cntChars">0</span> / 500 {$al_characters}&nbsp;</td>
						<td><br /><textarea name="text" cols="40" rows="10" onkeyup="$('#cntChars').text($(this).val().length);"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input class="submit" type="submit" name="action" value="{$al_acept_request}"> <input class="submit" type="submit" name="action" value="{$al_decline_request}"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

{/foreach}	