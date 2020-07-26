<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//ES" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>{$servername} - Lobby</title>
<meta name="author" content="Jorge Navarrete" />
<meta name="copyright" content="xNova Reborn 6" />
<meta name="description" content="El apasionante juego de navegador de estrategia espacial basado en xNova Revolution 5" />
	<link rel="icon" href="favicon.ico">
<link rel="stylesheet" type="text/css" href="styles/css/lobby.css" />
	<!--[if lt IE 7]><style media="screen" type="text/css">@import "styles/css/ie6.css";</style><![endif]-->
</head>
<body>

	<div class="container-fluid">
		<div class="row header"></div>
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				{if !empty($accounts)}
				<div class="row lobby-table">
					<div class="col-12 content-header">
						Cuentas
					</div>
					<div class="col-12 inside-table col-12 text-left text-white">
						<div class="col-12 header">
							<div class="row">
								<div class="col-2">Univero</div>
								<div class="col-2 text-center">Categoria</div>
								<div class="col-2">Jugador</div>
								<div class="col-2">Alianza</div>
								<div class="col-2">Ranking</div>
								<div class="col-2 whitespace"></div>
							</div>
						</div>
						<div class="col-12 body">
							{foreach item="account" from=$accounts}
							<div class="row">
								<div class="col-2 bg-t">{$account.u_name}</div>
								<div class="col-2 bg-t text-center p-5">
									<img src="./styles/images/lobby/{$account.category}.png">
								</div>
								<div class="col-2 bg-t">{$account.username}</div>
								<div class="col-2 bg-t whitespace">{$account.ally_name}</div>
								<div class="col-1 bg-t">{$account.total_rank}</div>
								<div class="col-3 btn-center">
									<a href="?transaction=login&universe={$account.universe}" target="_blank">
									<button class="col-12">JUGAR</button>
									</a>
								</div>
								
							</div>
							{/foreach}
						</div>
					</div>
				</div>
				{/if}
				{if !empty($servers)}
				<div class="row lobby-table">
					<div class="col-12 content-header">
						Servidores
					</div>
					<div class="col-12 inside-table col-12 text-left text-white">
						<div class="col-12 header">
							<div class="row">
								<div class="col-2">Univero</div>
								<div class="col-2 text-center">Categoria</div>
								<div class="col-3">Edad en dias</div>
								<div class="col-2 whitespace"></div>
								<div class="col-3 whitespace text-center">Registro de Raza</div>
							</div>
						</div>
						<div class="col-12 body">
							{foreach item="server" from=$servers}
							<div class="row">
								<div class="col-2 bg-t">{$server.uni_name}</div>
								<div class="col-2 bg-t text-center p-5">
									<img src="./styles/images/lobby/{$server.category}.png">
								</div>
								<div class="col-3 bg-t">
									{if $server.days>0}
										{$server.days} dia{if $server.days>1}s{/if}
									{else}
										Hoy mismo
									{/if}
								</div>
								<div class="col-2 bg-t whitespace">
									{if $server.days<=10}
									<span class="new">NUEVO</span>
									{/if}
								</div>
								<div class="col-3 btn-center">
									<a href="?transaction=register&universe={$server.uni}&raza=0" target="_blank">
									<button class="col-6 flex"> 
										<img src="./styles/theme/gultra/imagenes/gultra.png" class="btn_imag">
									</button>
									</a>

									<a href="?transaction=register&universe={$server.uni}&raza=1" target="_blank">
									<button class="col-6 flex"> 
										<img src="./styles/theme/gultra/imagenes/voltra.png" class="btn_imag">
									</button>
									</a>
								</div>
								
							</div>
							{/foreach}
						</div>
					</div>
				</div>
				{/if}
			</div>
		</div>
	</div>