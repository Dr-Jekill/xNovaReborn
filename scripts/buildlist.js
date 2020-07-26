function ReBuildView() {
            var HTML     = '';
                        var ni = 0;
        $.each(data.build, function(index, val) {
                if (index == 0) {
                        ni = val.level;
                                                HTML    += '<div class="content-box-s">';
                                                HTML    += '<div class="misiones_top">';
                                                HTML    += '<h3>Edificios</h3>';
                                                HTML    += '</div>';
                                                HTML    += '<div class="content">';
                                                HTML    += '<table cellpadding="0" cellspacing="0" class="construction active" style="padding-bottom: 7px;">';
                                                HTML    += '<tbody>';
                                                HTML    += '<tr>';
                                                HTML    += '<th colspan="2">'+val.name+'</th>';
                                                HTML    += '</tr>';
                                                HTML    += '<tr class="data">';
                                                HTML    += '    <td class="first" rowspan="3">';
                                                HTML    += '            <div>';
                                                HTML    += '                            <img class="queuePic" width="40" height="40" src="styles/theme/'+data.raza_skin+'/gebaeude/'+val.element+'.png" alt="'+val.name+'">';
                                                HTML    += '                    <a href="game.php?page=buildings&amp;cmd=cancel"  class="tooltip" name="<table><tr><td>Cancelar '+val.name+' '+data.nivel+' '+val.level+'</td></tr></table>">';
                                                HTML    += '                            <img src="styles/theme/'+data.raza_skin+'/imagenes/navegacion/x.png" height="15" width="15" style=" margin-left: -13px;  top: 5px; position: relative;">';
                                                HTML    += '                    </a>';
                                                HTML    += '            </div>';
                                                HTML    += '    </td>';
                                                HTML    += '    <td class="desc ausbau">'+val.mode+'</span>';
                                                HTML    += '    </td>';
                                                HTML    += '</tr>';
                                                HTML    += '<tr class="data">';
                                                HTML    += '    <td class="desc">Duracion:</td>';
                                                HTML    += '</tr>';
                                                HTML    += '<tr class="data">';
                                                HTML    += '    <td class="desc timers">';
                                                HTML    += '            <span id="blc"></span>';
                                                HTML    += '    </td>';
                                                HTML    += '</tr>';
                                                /*HTML    += '<tr class="data">';
                                                HTML    += '    <td colspan="2">';
                                                HTML    += '<a class="build-faster dark_highlight tooltipLeft js_hideTipOnMobile building " title="" href="javascript:void(0);" rel="https://s152-es.ogame.gameforge.com/game/index.php?page=inventory&amp;buyAndActivate=cb4fd53e61feced0d52cfc4c1ce383bad9c05f67">';
                                                HTML    += '                    <div class="build-faster-img" alt="Reducir tiempo a la mitad"></div>';
                                                HTML    += '                    <span class="build-txt">Reducir tiempo a la mitad</span>';
                                                HTML    += '                    <span class="dm_cost ">';
                                                HTML    += '                            Costes: 750 MO                            </span>';
                                                HTML    += '                    </a>';
                                                HTML    += '    </td>';
                                                HTML    += '</tr>';*/
                                                
                                                
                                                //HTML    += '<td colspan="2" class="idle">';
                                                /*HTML    += '<img src="styles/theme/'+data.raza_skin+'/gebaeude/'+val.element+'.png" width="140" height="140" />';
                                                HTML    += '<b>'+val.name+' '+val.level+' '+val.mode+'</b><div id="progressbar"></div>';*/
                                        /*      HTML    += '<img class="tooltip" name="'+val.name+'" src="styles/theme/'+data.raza_skin+'/gebaeude/'+val.element+'.png" width="40" height="40" />'+val.mode+' ';
                        HTML    += '<div id="progressbar" ></div><div id="blc"></div>';
                                                HTML    += '</td>';*/
                                                
                                                HTML    += '</tbody></table>';
                                                HTML    += '</div>';
                                                HTML    += '<div class="misiones_footer"></div>';
                                                HTML    += '</div>';
                                                $('#bLevel').text(val.level);
                } else {        
                                                HTML    += '<div class="content-box-s">';
                                                HTML    += '<div class="misiones_top">';
                                                HTML    += '<h3>'+val.name+' '+data.nivel+' '+val.level+'</h3>';
                                                HTML    += '</div>';
                                                HTML    += '<div class="content">';
                                                HTML    += '<table cellpadding="0" cellspacing="0" class="construction active" style="padding-bottom: 7px;">';
                                                HTML    += '<tbody>';
                                                HTML    += '<tr>';
                                                HTML    += '<th colspan="2">En cola</th>';
                                                HTML    += '</tr>';
                                                HTML    += '<tr class="data">';
                                                HTML    += '    <td class="first" rowspan="3">';
                                                HTML    += '            <div>';
                                                HTML    += '                            <img class="queuePic" width="40" height="40" src="styles/theme/'+data.raza_skin+'/gebaeude/'+val.element+'.png" alt="'+val.name+'">';//+val.mode+' ';
                                                HTML    += '                    <a href="game.php?page=buildings&amp;cmd=remove&amp;listid='+(index+1)+'">';
                                                HTML    += '                            <img src="styles/theme/'+data.raza_skin+'/imagenes/navegacion/x.png" height="15" width="15" style=" margin-left: -13px;  top: 5px; position: relative;">';
                                                HTML    += '                    </a>';
                                                HTML    += '            </div>';
                                                HTML    += '    </td>';
                                                HTML    += '</tr>';                             
                                                HTML    += '</tbody></table>';
                                                HTML    += '</div>';
                                                HTML    += '<div class="misiones_footer"></div>';
                                                HTML    += '</div>';
                                                
                }
                /*HTML    += '<span style="color:#0565ae"><b>'+getFormatedDate(val.endtime * 1000, '[d]. [M] [y] [H]:[i]:[s]')+'</b></span>';*/
        });
        $('#buildlist').html(HTML).fadeIn("fast");
        $('#bLevel').text(ni);
        //$('#cons_'+data.build[0].element).progressbar({value: ((data.build[0].time != 0) ? 100 + ((data.build[0].endtime - (serverTime.getTime() / 1000) - ServerTimezoneOffset) / data.build[0].time) * 100 :100)});
        //$('.ui-progressbar-value').addClass('ui-corner-right cons').attr("id","testing");
        $('#contrccion_'+data.build[0].element).addClass('activex');
        setInterval(function(){
                var a= 100 - ((data.build[0].endtime - (serverTime.getTime() / 1000) + ServerTimezoneOffset) / data.build[0].time) * 100;
                                var h=200;
                                var b=Math.round(100-a);
                                var cc=-b;
                                //document.getElementById('cons_'+data.build[0].element).style="height:"+b+"px;";
                                //document.getElementById('testing').style="margin-top:"+cc+"px; !important";
                
                }, 1000);
                //alert(a);
                return true;
}

function Buildlist() {
        var h           = 0;
        var m               = 0;
        var s           = (data.build[0].endtime - (serverTime.getTime() / 1000) + ServerTimezoneOffset);
        
        if ( s <= 0 ) {
                if(data.build.length == 1){
                        $('#blc').html(Ready + '<br><a href="javascript:location.reload(true);">'+data.bd_continue+'</a>');
                        document.title  = Ready + ' - ' + Gamename;
                        window.setTimeout("location.reload(true);", 1000);
                        return true;
                } else if(data.build[0].reload === true){
                        location.reload(true);
                        //window.location.href = 'game.php?page='+((data.build[0].page!='')?data.build[0].page:'buildings');
                        return true;
                } else {
                        data.build.shift();
                        $('#buildlist').fadeOut("fast");
                        ReBuildView();
                        s       = (data.build[0].endtime - (serverTime.getTime() / 1000) + ServerTimezoneOffset);
                }
        }
        
        var time        = GetRestTimeFormat(s);
        
        $('#blc').html(time);
                $('#Countdown_'+data.build[0].element).fadeIn("fast");
        $('#Countdown_'+data.build[0].element).html(time);
        document.title  = time + ' - ' + data.build[0].name + ' - ' + Gamename;
        window.setTimeout('Buildlist();', 1000);
}
