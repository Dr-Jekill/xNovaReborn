<form action="?page=alliance&mode=circular&action=send" method="post" name="message" id="message">
  <div class="contentz allycomm">
    <table id="dissolveally">
        <tbody><tr>
            <td class="desc textBeefy">
                Destinatario:
            </td>
            <td>
                {html_options name=r options=$RangeList}
            </td>
        </tr>
        <tr>
            <td class="desc textBeefy">
                Asunto:
            </td>
            <td>
                <input class="textInput w290" type="text" name="subject" id="subject" size="40" maxlength="40" value="{$mg_no_subject}">
            </td>
        </tr>
        <tr>
          <td colspan="2" class="textLeft">
            <div>
              <div class="markItUp">
                <div class="markItUpContainer">
                  <textarea name="text" id="text" class="alliancetexts markItUpEditor" onkeyup="$('#msgcount').text($('#text').val().length)"></textarea>
                  <div class="miu_footer clearfix">
                    <span class="fleft">
                      <span class="cnt_chars">
                        <div id="msgcount">0</div>/2000
                      </span> Caracteres restrantes</span>
                    </div>
                <input type="hidden" class="colorpicker"><div class="markItUpFooter"></div></div>
              </div>
              </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input class="btn_blue float_right" type="submit" value="Enviar"  name="button">
            </td>
        </tr>
      </tbody>
    </table>
  </div>
</form>