{include file="index_header.tpl"}
	<div class="login_page">
		<div class="login_content">
			<div class="form_header">
				<div class="item active">{$login}</div>
				<div class="item" data-role="link" data-link=".register_content" data-current=".login_content">{$register_now}</div>
			</div>

			<div class="login_form">
				<form action="" id="login_form">
					<div class="form_group">
						<label>{$user}</label>
						<input type="text" name="username">
					</div>
					<div class="form_group">
						<label>{$pass}</label>
						<input type="password" name="password">
					</div>
					<button class="btn btn_blue btn_block" id="login">{$login}</button>
				</form>
			</div>

		</div>

		<div class="register_content" style="display: none">
			<div class="form_header">
				<div class="item" data-role="link" data-link=".login_content"  data-current=".register_content">{$login}</div>
				<div class="item active">{$register_now}</div>
			</div>
			<div class="register_form">
				<form id="register_form">
					<div class="form_group">
						<label>{$userR}</label>
						<input type="text" name="character">
					</div>
					<div class="form_group">
						<label>{$email_reg}</label>
						<input type="email" name="email">
					</div>
					<div class="form_group">
						<label>{$pass}</label>
						<input type="password" name="passwordR">
					</div>
					<div class="form_inline">
						<input type="checkbox" name="rgt" id="rgt">
						<label for="rgt">Acepto las <a href="?page=rules">Reglas</a></label>
					</div>
					<button class="btn btn_blue btn_block" id="register">{$register_now}</button>
				</form>
			</div>
		</div>

	</div>

	<div class="footer">
		<div class="rights">
			<div class="footer_content">
				
					<div class="left">
					 	v6.0
					</div>
					<div class="right">
						<ul id="menu">
							<li><a href="javascript:OpenPopup('?page=agb','Terminos & Condiciones', 800, 500);">T&C</a></li> |
							<li><a href="javascript:OpenPopup('?page=faq','Reglas', 800, 500);">FAQ</a></li> |
							<li><a href="javascript:OpenPopup('?page=rules','Reglas', 800, 500);">Reglas</a></li> |
							<li><a href="javascript:OpenPopup('?page=topkb','Salon de la Fama', 800, 500);">Salon de la Fama</a></li> 
							{if !CheckModule(21)}|
							<li><a href="javascript:OpenPopup('?page=banneds','Baneados', 800, 500);">Baneados</a></li>
							{/if}
						</ul>
					</div>
				</div>
			</div>
			<div class="center">
				<div class="footer_content" style="width: auto;">
					<a class="homeLink" href="http://parallelgames.cubava.cu/" target="">
						<img src="./styles/images/login/logo.png" width="50" class="logo">
						© 2020 ParallelGames. Todos los derechos reservados.
					</a>
				</div>
					
			</div>
			
		</div>
{include file="index_footer.tpl"}
<script type="text/javascript">
	$('[data-role="link"]').click(function(){
		$($(this).data('current')).hide();
		$($(this).data('link')).show();
	});

	$('#login').click(function(e){
		e.preventDefault();
		$.ajax({
			url: '?page=login',
			type: 'POST',
			data: $('#login_form').serialize(),
			dataType: 'json'
		}).done(function(data){
			console.log(data)
			if(data.status){
				document.location.href='lobby.php';
			}else{
				$('#login_form').prepend('<div id="error">'+data.error+'</div>');
				window.setTimeout(function(){
					$('#login_form #error').remove();
				}, 3002);
			}
		});
	});

	$('#register').click(function(e){
		e.preventDefault();
		$.ajax({
			url: '?page=reg&mode=send',
			type: 'POST',
			data: $('#register_form').serialize(),
			dataType: 'json'
		}).done(function(data){
			console.log(data)
			if(data.status){
				document.location.href='lobby.php';
			}else{
				$('#register_form').prepend('<div id="error">'+data.error+'</div>');
				window.setTimeout(function(){
					$('#register_form #error').remove();
				}, 3002);
			}
		});
	});
</script>