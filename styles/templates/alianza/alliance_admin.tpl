<div class="contentz ui-tabs ui-widget ui-widget-content ui-corner-all">
  <ul class="tabsbelow" id="tab-ally-sub" style="margin-left: 36px;">
      <li class="tab_ally selected" onclick="tab.sub('tinter', 'allyText')" id="tinter" rel="one">
          <a href="javascript:void(0);" rel="https://s156-es.ogame.gameforge.com/game/index.php?page=allianceOverview" class="navi overview">
              <span>Texto interno</span>
          </a>
      </li>
      <li class="tab_ally" onclick="tab.sub('textern', 'allyText')" id="textern" rel="two">
          <a href="javascript:void(0);" rel="https://s156-es.ogame.gameforge.com/game/index.php?page=allianceManagement" class="navi management">
              <span>Texto externo</span>
          </a>
      </li>
      <li class="tab_ally" onclick="tab.sub('tbeb', 'allyText')" id="tbeb" rel="three">
          <a href="javascript:void(0);" rel="https://s156-es.ogame.gameforge.com/game/index.php?page=allianceManagement" class="navi management">
              <span>Texto de solicitud</span>
          </a>
      </li>
  </ul>

  <div id="one" aria-labelledby="tabIntern" class="subtab ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-hidden="true" aria-live="polite" style="display: block;">
      <form action="game.php?page=alliance&mode=admin&edit=ally&t=2" id="form_internAllyText" method="post">
          <div><div class="markItUp"><div class="markItUpContainer"><textarea name="text" id="text" class="alliancetexts markItUpEditor" onkeyup="$('#cntChars').text($('#text').val().length);">{$ally_text}</textarea><div class="miu_footer clearfix"><span class="fleft"><span class="cnt_chars"><span id="cntChars">0</span>/50000</span> Caracteres restrantes</span></div><input type="hidden" class="colorpicker"><div class="markItUpFooter"></div></div></div></div>
          <input type="hidden" name="textType" value="2">

          <input type="submit" value="Guardar" class="action btn_blue float_right">

      </form>
  </div><!-- One -->

  <div id="two" aria-labelledby="tabExtern" class="subtab ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-hidden="false" style="display: none;" aria-live="polite">
      <form action="game.php?page=alliance&mode=admin&edit=ally&t=1" id="form_externAllyText" method="post">
          <div><div class="markItUp"><div class="markItUpContainer"><textarea name="text" class="alliancetexts markItUpEditor">{$ally_description}</textarea><div class="miu_footer clearfix"><span class="fleft"><span class="cnt_chars">50000</span> Caracteres restrantes</span></div><input type="hidden" class="colorpicker"><div class="markItUpFooter"></div></div></div></div>
          <input type="hidden" name="textType" value="1">

          <a href="game.php?page=alliance&mode=ainfo&a={$ally_id}" target="_ally" class="btn_blue float_left">
              Abrir página de la alianza                </a>

          <input type="submit" value="Guardar" class="action btn_blue float_right">

      </form>
  </div><!-- Two -->

  <div id="three" aria-labelledby="tabBewerb" class="subtab ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-hidden="true" style="display: none;" aria-live="polite">
      <form action="game.php?page=alliance&mode=admin&edit=ally&t=3" id="form_candidacyText" method="post">
          <div><div class="markItUp"><div class="markItUpContainer"><textarea name="text" class="alliancetexts markItUpEditor">{$ally_request}</textarea><div class="miu_footer clearfix"><span class="fleft"><span class="cnt_chars">50000</span> Caracteres restrantes</span></div><div class="miu_preview_container" style="display: none;">

</div><input type="hidden" class="colorpicker"><div class="markItUpFooter"></div></div></div></div>
          <input type="hidden" name="textType" value="3">

          <input type="submit" value="Guardar" class="action btn_blue float_right">

      </form>
  </div>
  <br class="clearfloat">
</div>
<div class="footer"></div>