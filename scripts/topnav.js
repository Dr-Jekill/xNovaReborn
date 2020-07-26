//topnav.js
//RealTimeResources xNova Reborn
// @version 1.0
// @copyright 2020 by Jekill

/*function actualizar(recurso) {
    var now = Date.now();
    var update = $('#current_' + recurso).data('update');
    var maxim = $('#current_' + recurso).data('max');
    window.setInterval(function () {
        calcularR(recurso, maxim, update, now)
    }, 1000);
}

function calcularR(recurso, maxim, update, now) {
    var actual = $('#current_' + recurso).data('actual');
    if (actual < maxim) {

    	Prod_tme = ((Date.now() - now) / 1000);
        raw_resource = actual + (Prod_tme * update / 3600);
       	var resource = Math.max(0, raw_resource);
        $('#current_' + recurso).html('<b>' + NumberGetHumanReadable(resource) + '</b>');
        $('#current_' + recurso).attr('data-actual', raw_resource);
    }
}*/
var now = Date.now();

actualizar = (res) => {
    window.setInterval(function(){
        element = $("#current_"+res);
        actual = element.data('actual');
        update = element.data('update');
        maxim = element.data('max');

        if (actual < maxim) {
            var Prod_tme = ((Date.now() - now) / 1000);
            var raw_resource = actual + (Prod_tme * update / 3600);
            var resource = Math.max(0, raw_resource);
            element.html('<b>' + NumberGetHumanReadable(resource) + '</b>');
            element.attr('data-actual', raw_resource);
        }
    }, 1000);
};

News = () =>{
    self = {
        text: "",
        date: "",
        title: "",
        transition: 5000,
        transition_delay: 500,
        last_new: 0,
        hover: false,
    };

    self.init = () =>{
        news = noticias;
        $.each(news, function(i, v){
            $('#news').append('<li data-role="PGtooltip" data-name="'+v.name+'" data-content="'+v.new+'" data-direction="buttom" style="display:none;"><b>'+v.name+'</b> - '+v.new+'</li>');
        });
        self.show();
    }

    self.show = (id = 0) =>{
        news = $('#news li');

        $.each(news, function(i, v){
            $(v).removeClass('active');
            $(v).css('opacity','0');

            window.setTimeout(function(){
                $(v).css('display','none');
            }, self.transition_delay)
        });

        window.setTimeout(function(){
            $(news[id]).addClass('active');
            $(news[id]).css('display','block');

            window.setTimeout(function(){
                $(news[id]).css('opacity','100');
            }, self.transition_delay)
        }, self.transition_delay + 2)
        
        self.last_new = (id+1 > (news.length - 1))? 0 :(id + 1);
    }

    $('#news').mouseover(function(){
        self.hover = true;
    });
    $('#news').mouseleave(function(){
        self.hover = false;
    });


    window.setInterval(function(){
        if(!self.hover)
            self.show(self.last_new);
    }, self.transition + self.transition_delay);

    self.init();

    return self;
}

Tabs = () => {
    self = {};

    self.tab = (tab)=>{
        var ele = $('#' + tab).attr('rel');
        $('div').find('.anythingWindowAlly').hide();
        $('li.tab_ally').removeClass('selected');
        $('#' + tab).addClass('selected');
        $('#' + ele).show();
    };

    self.sub = (tab, node ='') => {
        nodo = (node == '') ? 'allyNameTage' : node;
        var ele = $('#' + tab).attr('rel');
        $('#' + nodo).find('.subtab').hide();
        $('#' + nodo + ' .tab_ally').removeClass('selected');
        $('#' + tab).addClass('selected');
        $('#' + ele).show();
    };

    self.manage = (tab) =>{
        var ele = $('#' + tab).attr('rel');
        $('#' + ele).slideToggle(300);
    };

    self.AjaxManage = (tab) =>{
        var ele = $('#' + tab).attr('rel');
        var page = $('#' + tab).data('ref');

        $.ajax({
            url:page,
            type:'POST',
            data:{ajax:true},
            dataType:'html'
        }).done(function(data){
            $('#' + ele).html(data);
            $('#' + ele).slideToggle(300);
        });
    };

    self.ajax = (tab) => {
        var ele = $('#' + tab).attr('rel');
        var page = $('#' + tab).data('ref');
        $('div').find('.anythingWindowAlly').hide();
        $('li.tab_ally').removeClass('selected');
        $('#' + tab).addClass('selected');

        $.ajax({
            url:page,
            type:'POST',
            data:{ajax:true},
            dataType:'html'
        }).done(function(data){
            $('#' + ele).html(data);
        });
    }

    return self;
}

tab = Tabs();

function FleetTime() {
        $.each(Fleets, function(id, time) {
                var s           = (time - (serverTime.getTime() / 1000) + ServerTimezoneOffset);
                if(s <= 0) {
                        $('#fleettime_'+id).text('-');
                } else {
                        $('#fleettime_'+id).text(GetRestTimeFormat(s));
                }
        });
        window.setTimeout('FleetTime()', 1000);
}

function GetFleets(init) {
        $.getJSON('ajax.php?action=getfleets&lang='+Lang, function (data) {
                if(data.length == 0) {
                        window.setTimeout('GetFleets()', 60000);
                        return;
                }
               
                Fleets          = {};
                var HTML        = '';
                $.each(data, function(index, val) {
                        HTML    += '<tr class="fleet">';
                        HTML    += '<td id="fleettime_'+index+'"></td>';
                        HTML    += '<td colspan="3">'+val.fleet_descr+'</td></tr>';
                        Fleets[index]   =  val.fleet_return;
                });
                if(HTML != '') {
                        //$('#eventboxBlank').detach();
                        $('.flying_fleet').html('<a href="?page=movement">Hay flotas en vuelo</a>');    
                        $('#eventboxBlank').html('<a href="?page=movement">Hay flotas en vuelo</a>');    
                }
               
                if(typeof init != "undefined")
                        FleetTime();
                       
                window.setTimeout('GetFleets()', 60000);
        });
}

GetFleets()