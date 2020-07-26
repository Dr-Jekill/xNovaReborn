<?php

/**
 _  \_/ |\ | /¯¯\ \  / /\    |¯¯) |_¯ \  / /¯¯\ |  |   |´¯|¯` | /¯¯\ |\ |5
 ¯  /¯\ | \| \__/  \/ /--\   |¯¯\ |__  \/  \__/ |__ \_/   |   | \__/ | \|Core Redesigned.
 * @author: Copyright (C) 2011 by Brayan Narvaez (Prinick) developer of xNova Revolution
 * @author web: http://www.bnarvaez.com
 * @link: http://www.xnovarev.com

 * @package 2Moons
 * @author Slaver <slaver7@gmail.com>
 * @copyright 2009 Lucky <douglas@crockford.com> (XGProyecto)
 * @copyright 2011 Slaver <slaver7@gmail.com> (Fork/2Moons)
 * @license http://www.gnu.org/licenses/gpl.html GNU GPLv3 License
 * @version 1.3 (2011-01-21)
 * @link http://code.google.com/p/2moons/

 * Please do not remove the credits
*/

$LNG['Version']     = 'Versi&oacute;n';
$LNG['Description'] = 'Descripci&oacute;n';

$LNG['changelog']   = array(

'<font color="lime" size="1" face="arial"><b>XNOVA 6.0</b></font>' => '<b>xNova Reborn v6.0</b>

- FIX Cola de investigacion arreglada, devolvia recursos al planeta de la ultima investigacion.
- FIX Cola de investigacion arreglada, descontaba los recursos doble cuando se investigaba mas de una investigacion al mismo tiempo.
- FIX mision de Mantener Posicion, permitia mantener pocicion en planetas de otros jugadores.
- FIX la mision Mantener Posicion Aliada, permitia mantener posicion en planetas de jugadores que no pertenecian a la alianza.
- FIX mision de Transportar, permitia transportar a planetas que fueran de jugadores fuera de la alianza.
- FIX invcompatibilidad de la Alianza con PHP 7.
- FIX la incompatibilidad del core con PHP 7.
- FIX las penalizaciones y bonificaciones a la hora de investigar y construir edificios y naves.
- FIX el valor confuso de cierre de juego, hacia cerrar el juego con el valor false y es al revez.
- FIX Corregido y agregados nuevos elementos a la interfaz de la raza voltra.
- FIX  archivo de configuracion de apache htaccess que permitia acceso indebido a carpetas.
- FIX error que dejaba a la flota de expedicion inoperativa.
- FIX error en archivo ajax.php en consulta SQL que no permitia enviar flota a expedicion.
- FIX error de bucle infinito de ganancia de recurso en el mercader.
- FIX desajuste de zona horaria del servidor.
- FIX error que no actualiza el chat al escribir y enviar un mensaje.
- FIX Todos los oficiales.
- FIX Error que permitia contratar oficiales sin tener MO.
- FIX Sensor Phalax.
- FIX administracion, no dejaba entrar otro usuario que no fuera el admin.
- FIX universidad, ahora resta el 8% del tiempo de investigacion.



- ADD Generacion de recursos por tecnologia Plasma.
- ADD norio a escombros de batalla.
- ADD Geologo a la lista de recursos.
- ADD Ingeniero a la lista de recursos.
- ADD Plasma a la lista de recursos.
- ADD Creada e incluida nueva libreria visual `JisGreat` creada por ParallelGames.
- ADD la pagina para las construcciones de recursos separandola de las construcciones.
- ADD disminucion de coste de demolicion por tecnologia Ionica.
- ADD Barra de noticias en la parte superior de la plantilla.


- MOD de tema de la raza gultra a la vision de OGame.
- MOD de la interfaz de ambas razas.
- MOD de la administracion.
- MOD script para actualizacion automatica de recursos.
- MOD del archivo PlanetData.php

',
'XNOVA 5.9' => 'xNovaRevolution v5.9

- FIX: Bug norium production with commander
- FIX: Fix of fix Research time
- FIX: Recycler errors
- FIX: Fields with buildings added by Admin or Bonus Pack
- FIX: Galaxy, System and Planet error position on register with new universe
- FIX: Send Messages To Yourself by Giogio
- FIX: Fleettrader
- MOD: : CreateOnePlanetRecord Function optimized
- MOD: ShowAccountEditorPage.php code optimized

',
);
?>