+function ($) {
	'use strict';

	var closse = '[data-close="close"]';
	var PGtooltip = function(el){
		$(el)
		.mouseenter(this.create)
		.mouseleave(this.close);
				
	}
	PGtooltip.state = false;

	PGtooltip.TRANSITION_DURATION = 1000;

	PGtooltip.prototype.close = function(e, state = ''){
		state = (state!='')?state:PGtooltip.state;
		function removeElement() {
			if(PGtooltip.state==false){
				$('.PG_tooltip').html('');
				$('.PG_tooltip').css('display','none');
			}
	    }
	    if(state==true){
			$('.PG_tooltip').css('opacity','0');
		 	setTimeout(removeElement, PGtooltip.TRANSITION_DURATION);
		}
		PGtooltip.state=false;		
	}

	PGtooltip.prototype.create = function(e){
		PGtooltip.state = true;
		var head = '';
		var name = $(this).data('name');
		var contenido = $(this).data('content');

		if($(this).data('type')=='static'){close = '<div data-close="close">x</div>';}else{close = '';}
		$('.PG_tooltip').removeClass('after_top after_left after_right after_buttom');

		if(name && contenido){
			head = '<div class="headTooltip"><h1>'+name+'</h1>'+close+'</div><div class="splitLine"></div>'+contenido;
		}
		if(name && !contenido){
			head = '<div class="headTooltip"><h1>'+name+'</h1>'+close+'</div>';
		}
		if(!name && contenido){
			head = contenido;
		}
		$('.PG_tooltip').html("<div class='htmlTooltip' style=''>"+head+ "</div>");

		var position = $(this).offset();
		var direction = $(this).data('direction');
		var tooltipW = $('.PG_tooltip').width();
		var tooltipH = $('.PG_tooltip').height();
		var margenL = $(document).width();
		var margenT = $(document).height();
		var color = $(this).data('color');
		var tops = 0;
		var left = 0;
		var clas = '';
		var background = '';

		if(direction=='buttom'){
			tops = position.top + ($(this).height() + 10);
			left = position.left - ((tooltipW/2) - ($(this).width()/2));
			clas = 'after_buttom'
		}else if(direction=='top'){
			tops = position.top - (tooltipH + 10);
			left = position.left - ((tooltipW/2) - ($(this).width()/2));
			clas = 'after_top';
		}else if(direction=='right'){
			tops = position.top - ((tooltipH/2)-($(this).height()/2));
			left = position.left + ($(this).width()+10);
			clas = 'after_right'
		}else if(direction=='left'){
			tops = position.top - ((tooltipH/2)-($(this).height()/2));
			left = position.left - (tooltipW + 20);
			clas = 'after_left'
		}
		if(color!='' && color!=undefined){
			background = 'background:linear-gradient(to bottom, '+color+', #000000d6);';
		}else{
			background = ''
		}



		tops 	= (tops < 0)? 20: (tops>margenT)? margenT-20: tops;
		left 	= (left < 0)? 20: ((left + tooltipW)>margenL)? margenL-(tooltipW+30): left;
		
		$('.PG_tooltip').addClass(clas);
		$('.PG_tooltip').attr('style', 'display:; top:'+tops+'px;left:'+left+'px;'+background+'');
		$('.PG_tooltip').css('opacity','1');


		if($(this).data('type')=='static'){
			PGtooltip.state = false;
		}	
	}

	
	function PlugIn(){
	//	$('body').append('<div class="PG_tooltip" style="opacity:0;"></div>');
		return this.each(
			function(){new PGtooltip(this)}
		);
	}

	$.fn.PGtooltip             = PlugIn
  	$.fn.PGtooltip.Constructor = PGtooltip

  	$(document).click( closse, function(){
  		PGtooltip.prototype.close(this, true)
  	});
}(jQuery);
///////////////////////PGMODAL/////////////////////////////
+function($){
	'use strict';
	var dismiss = '[data-dissmiss="PGmodal"]';
	var PGmodal = function(el, options){
		this.type = 'absolute'
		this.close = true
		PGmodal.Options = options
		if(PGmodal.created == false){
			$(el)
			.click(this.init)
		}

		
	}

	PGmodal.Options;
	PGmodal.created = false;

	PGmodal.DEFAULTS = {
		title: 'My PGmodal',
		content: '',
		template: '<div class="PGmodal" style="display:none;"><div class="header"><div id="PGmodal_title" class="text-left left"></div><div class="right dissmiss" data-dissmiss="PGmodal">x</div></div><div class="PGmodal_content"></div><div class="footer"><div class="butons"></div></div></div>',
		buttons: {
			dissmiss: 'Cancelar',
			acept 	: 'Aceptar', 
		},
		set_acept: true,
		set_buttons: true,
		set_action: '',
	};

	PGmodal.prototype.init = function(e){
		if(PGmodal.created == false){
			PGmodal.prototype.create(this);
			PGmodal.created = true;
		}
	}

	PGmodal.prototype.create = function(r){
		PGmodal.created = true;
		var title 	= $(r).data('title');
		var content = $(r).data('content');
		var html 	= $(r).data('target');
		var efects 	= $(r).data('efects');
		PGmodal.close = false;
		
		var buttons = (PGmodal.Options.set_buttons)?PGmodal.DEFAULTS.buttons:[];
		var temp_b	= '';


		if(efects && efects=='background'){
			$(document.body).append('<div class="modal_background"></div>');
		}

		title 	= (title)?title:PGmodal.DEFAULTS.title;
		content = content; 

		if(buttons != []){
			$.each(buttons, function(index, value){
				var cl = (index == 'acept')?'ok':'cancel';
				if((index == 'acept' && PGmodal.Options.set_acept) || index=='dissmiss'){
					temp_b += '<button class="PGbutton '+cl+'" '+((cl=='cancel')?'data-dissmiss="PGmodal"':'')+'>'+value+'</button>';
				}				
			});
		}
		$('.PGmodal .footer .butons').html(temp_b);

		$('.PGmodal #PGmodal_title').html(title);
		if(content && !html){
			$('.PGmodal .PGmodal_content').html(content);
		}else{
			$( "#"+html ).clone().appendTo( ".PGmodal .PGmodal_content" );
			$( ".PGmodal_content #"+html ).css('display','');
		}
		if(PGmodal.Options.set_acept && PGmodal.Options.set_action!=''){
			$('.PGbutton.ok').click(function(){
				eval(PGmodal.Options.set_action)
				PGmodal.prototype.close();
			});
		}

		$(dismiss).click(function(){
	  		PGmodal.prototype.close()
	  	});

		PGmodal.type = $(r).data('type');

		PGmodal.prototype.update(r);
		$(window).resize(PGmodal.prototype.update);

	};
	PGmodal.prototype.close = function(e){
		$('.modal_background').remove();
		$('.PGmodal .PGmodal_content').empty();
		$('.PGmodal #PGmodal_title').empty();
		$('.PGmodal').css('display','none');
		PGmodal.close = true;
		PGmodal.created = false;
	};

	PGmodal.prototype.update = function(e){
		var PGwidth = $('.PGmodal').width();
		var PGheight = $('.PGmodal').height();
		var Wwidth = $(window).width();
		var Wheight = $(window).height();
		var position = PGmodal.type; //fixed, absolute
		position = 'position:'+((position)?position:'absolute')+';';
		if(!PGmodal.close)
			$('.PGmodal').attr('style', position+'top:'+((Wheight/2)-(PGheight/2))+'px;left:'+((Wwidth/2)-(PGwidth/2))+'px;');

		$('.PGmodal').css('display','');
	};

	function PlugIn(){
		$('body').append(PGmodal.DEFAULTS.template);
		return this.each(
			function(){
				var data = $(this).data();
				var options = $.extend({},PGmodal.DEFAULTS, data);
				new PGmodal(this, options)
			}
		);
	}

	$.fn.PGmodal             = PlugIn
  	$.fn.PGmodal.Constructor = PGmodal

  	

}(jQuery);







(function() {

	var fieldSelection = {

		getSelection: function() {

			var e = (this.jquery) ? this[0] : this;

			return (

				/* mozilla / dom 3.0 */
				('selectionStart' in e && function() {
					var l = e.selectionEnd - e.selectionStart;
					return { start: e.selectionStart, end: e.selectionEnd, length: l, text: e.value.substr(e.selectionStart, l) };
				}) ||

				/* exploder */
				(document.selection && function() {

					e.focus();

					var r = document.selection.createRange();
					if (r === null) {
						return { start: 0, end: e.value.length, length: 0 }
					}

					var re = e.createTextRange();
					var rc = re.duplicate();
					re.moveToBookmark(r.getBookmark());
					rc.setEndPoint('EndToStart', re);

					return { start: rc.text.length, end: rc.text.length + r.text.length, length: r.text.length, text: r.text };
				}) ||

				/* browser not supported */
				function() { return null; }

			)();

		},

		setSelection: function() {

			var e = (this.jquery) ? this[0] : this;
			var args = arguments[0] || {};

			return (

				/* mozilla / dom 3.0 */
				('selectionStart' in e && function() {
					var start = typeof args == 'object' ? args.start : args;

					if (start != undefined) {
						e.selectionStart = start;
					}

					if (args.end != undefined) {
						e.selectionEnd = args.end;
					}

					e.focus();
					return this;
				}) ||

				/* exploder */
				(document.selection && function() {
					e.focus();
					var r = document.selection.createRange();
					if (r === null) {
						return this;
					}

					var start = typeof args == 'object' ? args.start : args;

					if (start != undefined) {
						r.moveStart('character', -e.value.length);
						r.moveStart('character', start);
						r.collapse();
					}

					if (args.end != undefined) {
						r.moveEnd('character', args.end - start);
					}

					r.select();
					return this;
				}) ||

				/* browser not supported */
				function() {
					e.focus();
					return jQuery(e);
				}

			)();

		},

		replaceSelection: function() {

			var e = (this.jquery) ? this[0] : this;
			var text = arguments[0] || '';

			return (

				/* mozilla / dom 3.0 */
				('selectionStart' in e && function() {
					e.value = e.value.substr(0, e.selectionStart) + text + e.value.substr(e.selectionEnd, e.value.length);
					return this;
				}) ||

				/* exploder */
				(document.selection && function() {
					e.focus();
					document.selection.createRange().text = text;
					return this;
				}) ||

				/* browser not supported */
				function() {
					e.value += text;
					return jQuery(e);
				}

			)();

		}

	};

	jQuery.each(fieldSelection, function(i) { jQuery.fn[i] = this; });

})();









$(function () {
  $('[data-role="PGtooltip"]').PGtooltip();
  $('[data-role="PGmodal"]').PGmodal();
  $('[data-action="tab"]').click(function(e){
		tabs(e);
	});

})



function tabs(e){
	tab = $(e.currentTarget).data('tab');
	$('[ data-action="tab-target"]').css('display','none');
	$('#'+tab).css('display','');
	$('[data-action="tab"]').removeClass('active');
	$(e.currentTarget).addClass('active');
}



