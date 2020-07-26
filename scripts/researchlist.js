function ReBuildView() {
        var HTML     = '<div id="menu_flotas">';
            HTML    += '<div id="lista_misiones">';
        $.each(data.build, function(index, val) {
                if (index == 0) {
                        HTML    += '<div class="misiones_top"></div>';
                        HTML    += '<div class="misiones">';
                        HTML    += '<center>';
                        HTML    += '<img src="styles/theme/'+data.raza_skin+'/gebaeude/'+val.element+'.png" width="140" height="140" />';
                        HTML    += '<b>'+val.name+'<br />'+data.nivel+' '+val.level+' '+(val.planet != '' ? ' @ '+val.planet : '')+'</b><div id="progressbar"></div>';
                        HTML    += '<div id="blc"><a href="game.php?page=buildings&mode=research&amp;cmd=cancel"><div class="cancelar_c"><span>'+data.bd_cancel+'</span></div></a></div>';
                        HTML    += '</center>';
                        HTML    += '</div>';
                        HTML    += '<div class="misiones_footer"></div>';
                } else {
                        HTML    += '<div class="misiones_top"></div>';
                        HTML    += '<div class="misiones"><div class="encola_ajust_c">';
                        HTML    += '<img class="tooltip" name="'+val.name+'" src="styles/theme/'+data.raza_skin+'/gebaeude/'+val.element+'.png" width="40" height="40" /><span class="encola_c">'+data.nivel+' '+val.level+'</span> ';
                        HTML    += '<a href="game.php?page=buildings&mode=research&amp;cmd=remove&amp;listid='+(index+1)+'"><div class="cancelar_c_small"></div></a>';
                        HTML    += '</div>';
                        HTML    += '</div>';
                        HTML    += '<div class="misiones_footer"></div>';
                }
        });
        HTML    += '</div>';
        HTML    += '</div>';
        $('#buildlist').html(HTML).fadeIn("fast");
        $('#bLevel').text(ni);
        $('#progressbar').progressbar({value: ((data.build[0].time != 0) ? 80 - ((data.build[0].endtime - (serverTime.getTime() / 1000) + ServerTimezoneOffset) / data.build[0].time) * 100 :80)});
        $('.ui-progressbar-value').addClass('ui-corner-right').animate({width: "100%" }, data.build[0].endtime * 1000 - serverTime.getTime() + ServerTimezoneOffset * 1000, "linear");
        return true;
}

function Techlist() {
        var h           = 0;
        var     m               = 0;
        var s           = (data.build[0].endtime - (serverTime.getTime() / 1000) + ServerTimezoneOffset);
        
        if ( s <= 0 ) {
                if(data.build.length == 1){
                        $('#blc').html(Ready + '<br><a href=?page=build>'+data.bd_continue+'</a>');
                        document.title  = Ready + ' - ' + Gamename;
                        window.setTimeout("window.location.href = 'game.php?page=buildings&mode=research'", 1000);
                        return true;
                } else if(data.build[0].reload === true){
                        window.location.href = 'game.php?page=buildings&mode=research';
                        return true;
                } else {
                        data.build.shift();
                        $('#buildlist').fadeOut("fast");
                        ReBuildView();
                        s       = (data.build[0].endtime - (serverTime.getTime() / 1000) + ServerTimezoneOffset);
                }
        }
        
        var time        = GetRestTimeFormat(s);
        
        $('#blc').html(time + '<br><a href="game.php?page=buildings&mode=research&amp;cmd=cancel"><div class="cancelar_c"><span>'+data.bd_cancel+'</span></div></a>');
        document.title  = time + ' - ' + data.build[0].name + ' - ' + Gamename;
        window.setTimeout('Techlist();', 1000);
}





function ReBuildView() {
        var HTML     = '';
            var ni = 0;
        $.each(data.build, function(index, val) {
                if (index == 0) {
                        ni = val.level;
                        HTML    += '<div class="content-box-s">';
                        HTML    += '<div class="misiones_top">';
                        HTML    += '<h3>Edificios '+(val.planet != '' ? ' @ '+val.planet : '')+'</h3>';
                        HTML    += '</div>';
                        HTML    += '<div class="content">';
                        HTML    += '<table cellpadding="0" cellspacing="0" class="construction active" style="padding-bottom: 7px;">';
                        HTML    += '<tbody>';
                        HTML    += '<tr>';
                        HTML    += '<th colspan="2">'+val.name+'</th>';
                        HTML    += '</tr>';
                        HTML    += '<tr class="data">';
                        HTML    += '    <td class="first" rowspan="3">';
                        HTML    += '        <div>';
                        HTML    += '                <img class="queuePic" width="40" height="40" src="styles/theme/'+data.raza_skin+'/gebaeude/'+val.element+'.png" alt="'+val.name+'">';
                        HTML    += '            <a href="game.php?page=buildings&mode=research&amp;cmd=cancel"  class="tooltip" name="<table><tr><td>Cancelar '+val.name+' '+data.nivel+' '+val.level+'</td></tr></table>">';
                        HTML    += '                <img src="styles/theme/'+data.raza_skin+'/imagenes/navegacion/x.png" height="15" width="15" style=" margin-left: -13px;  top: 5px; position: relative;">';
                        HTML    += '            </a>';
                        HTML    += '        </div>';
                        HTML    += '    </td>';
                        HTML    += '    <td class="desc ausbau">'+val.mode+'</span>';
                        HTML    += '    </td>';
                        HTML    += '</tr>';
                        HTML    += '<tr class="data">';
                        HTML    += '    <td class="desc">Duracion:</td>';
                        HTML    += '</tr>';
                        HTML    += '<tr class="data">';
                        HTML    += '    <td class="desc timers">';
                        HTML    += '        <span id="blc"></span>';
                        HTML    += '    </td>';
                        HTML    += '</tr>';
                        /*HTML    += '<tr class="data">';
                        HTML    += '    <td colspan="2">';
                        HTML    += '<a class="build-faster dark_highlight tooltipLeft js_hideTipOnMobile building " title="" href="javascript:void(0);" rel="https://s152-es.ogame.gameforge.com/game/index.php?page=inventory&amp;buyAndActivate=cb4fd53e61feced0d52cfc4c1ce383bad9c05f67">';
                        HTML    += '            <div class="build-faster-img" alt="Reducir tiempo a la mitad"></div>';
                        HTML    += '            <span class="build-txt">Reducir tiempo a la mitad</span>';
                        HTML    += '            <span class="dm_cost ">';
                        HTML    += '                Costes: 750 MO                            </span>';
                        HTML    += '            </a>';
                        HTML    += '    </td>';
                        HTML    += '</tr>';*/
                        
                        
                        //HTML    += '<td colspan="2" class="idle">';
                        /*HTML    += '<img src="styles/theme/'+data.raza_skin+'/gebaeude/'+val.element+'.png" width="140" height="140" />';
                        HTML    += '<b>'+val.name+' '+val.level+' '+val.mode+'</b><div id="progressbar"></div>';*/
                    /*  HTML    += '<img class="tooltip" name="'+val.name+'" src="styles/theme/'+data.raza_skin+'/gebaeude/'+val.element+'.png" width="40" height="40" />'+val.mode+' ';
                        HTML    += '<div id="progressbar" ></div><div id="blc"></div>';
                        HTML    += '</td>';*/
                        
                        HTML    += '</tbody></table>';
                        HTML    += '</div>';
                        HTML    += '<div class="misiones_footer"></div>';
                        HTML    += '</div>';
                } else {    
                        HTML    += '<div class="content-box-s">';
                        HTML    += '<div class="misiones_top">';
                        HTML    += '<h3>'+val.name+' '+data.nivel+' '+val.level+' '+(val.planet != '' ? ' @ '+val.planet : '')+'</h3>';
                        HTML    += '</div>';
                        HTML    += '<div class="content">';
                        HTML    += '<table cellpadding="0" cellspacing="0" class="construction active" style="padding-bottom: 7px;">';
                        HTML    += '<tbody>';
                        HTML    += '<tr>';
                        HTML    += '<th colspan="2">En cola</th>';
                        HTML    += '</tr>';
                        HTML    += '<tr class="data">';
                        HTML    += '    <td class="first" rowspan="3">';
                        HTML    += '        <div>';
                        HTML    += '                <img class="queuePic" width="40" height="40" src="styles/theme/'+data.raza_skin+'/gebaeude/'+val.element+'.png" alt="'+val.name+'"> ';
                        HTML    += '            <a href="game.php?page=buildings&mode=research&amp;cmd=remove&amp;listid='+(index+1)+'">';
                        HTML    += '                <img src="styles/theme/'+data.raza_skin+'/imagenes/navegacion/x.png" height="15" width="15" style=" margin-left: -13px;  top: 5px; position: relative;">';
                        HTML    += '            </a>';
                        HTML    += '        </div>';
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
        $('#cons_'+data.build[0].element).progressbar({value: ((data.build[0].time != 0) ? 80 - ((data.build[0].endtime - (serverTime.getTime() / 1000) + ServerTimezoneOffset) / data.build[0].time) * 100 :80)});
        $('.ui-progressbar-value').addClass('ui-corner-right cons').attr("id","testing");
        $('#contrccion_'+data.build[0].element).addClass('activex');
        setInterval(function(){
        var a= 100 - ((data.build[0].endtime - (serverTime.getTime() / 1000) + ServerTimezoneOffset) / data.build[0].time) * 100;
                var h=200;
                var b=Math.round(80-a);
                var cc=-b;
                document.getElementById('cons_'+data.build[0].element).style="height:"+b+"px;";
                document.getElementById('testing').style="margin-top:"+cc+"px; !important";
        
        }, 1000);
        //alert(a);
        return true;
}

function Techlist() {
        var h           = 0;
        var     m               = 0;
        var s           = (data.build[0].endtime - (serverTime.getTime() / 1000) + ServerTimezoneOffset);
        
        if ( s <= 0 ) {
                if(data.build.length == 1){
                        $('#blc').html(Ready + '<br><a href=?page=build>'+data.bd_continue+'</a>');
                        document.title  = Ready + ' - ' + Gamename;
                        window.setTimeout("window.location.href = 'game.php?page=buildings&mode=research'", 1000);
                        return true;
                } else if(data.build[0].reload === true){
                        window.location.href = 'game.php?page=buildings&mode=research';
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
        window.setTimeout('Techlist();', 1000);
}


