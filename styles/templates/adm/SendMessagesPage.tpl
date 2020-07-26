
{include file="adm/overall_header.tpl"}
<script type="text/javascript">

function check(){
	if($('#text').val().length == 0) {
		alert('{$mg_empty_text}');
		return false;
	} else {
		$.post('admin.php?page=globalmessage&mode=send&ajax=1', $('#message').serialize(), function(data) {
			alert(data);
			location.reload();
			return true;
		});
	}
}
</script>
<form name="message" id="message" action="">
    <table class="table569">
		<tr>
            <th colspan="2"><h3>{$ma_send_global_message}</h3></th>
        </tr>
        <tr>
            <td>{$ma_subject}</td>
            <td><input name="subject" id="subject" size="40" maxlength="40" value="{$ma_none}" type="text"></td>
        </tr>
		<tr>
            <td>{$ma_message} (<span id="cntChars">0</span> / 5000 {$ma_characters})</td>
            <td><textarea name="text" id="text" cols="40" rows="10" onkeyup="$('#cntChars').text($('#text').val().length);"></textarea></td>
        </tr>
        <tr>
            <td colspan="2">
                <center>
                    <button type="button" class="btn btn_blue" onClick="check();">{$button_submit}</button>
                </center>
            </td>
        </tr>
    </table>
</form>
{include file="adm/overall_footer.tpl"}