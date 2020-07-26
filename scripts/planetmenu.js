if($.cookie('pmenu') != null) {
	if($.cookie('pmenu') == "on") {
		$('#planet_menu_content').show();
		$('#menu').css('padding-bottom', '98px');
		$('#content').css('padding-bottom', '98px');
	} else {
		$('#planet_menu_content').hide();
		$('#menu').css('padding-bottom', '26px');
		$('#content').css('padding-bottom', '26px');
	}
} else {
	if($("#planet_menu_content:visible").length == 1) {
		$.cookie('pmenu', 'on');
		$('#menu').css('padding-bottom', '98px');
		$('#content').css('padding-bottom', '98px');
	} else {
		$.cookie('pmenu', 'off');
		$('#menu').css('padding-bottom', '26px');
		$('#content').css('padding-bottom', '26px');
	}	
}

function PlanetMenu() {
	$.each(planetmenu, function(index, val) {
		if(val.length != 0 && val[0] < serverTime.getTime() / 1000 + ServerTimezoneOffset)
			val.shift();
	
		if(val.length == 0)
			$('#planet_'+index).text(Ready);
		else	
			$('#planet_'+index).text(getFormatedTime(val[0] - serverTime.getTime() / 1000 + ServerTimezoneOffset));
	});
	window.setTimeout('PlanetMenu()', 1000);
}
