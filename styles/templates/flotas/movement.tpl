{include file="overall_header.tpl"}
<body id="mercado">
<div id="tooltip" class="tip"></div>
<div class="contenido_big">
<div id="cajaBG">
    <div id="caja">
<div id="topnav" class="header_normal"> 	
		{include file="overall_topnav.tpl"}	
	</div> 
{include file="left_menu.tpl"}
<div id="contenidoMostrado">                               
<div id="elCosoxD">
<div class="coso_izquierda_corto"></div>
<div class="coso_derecha_corto"></div>
<div id="planeta_small" style="background-image: url(styles/theme/{$Raza_skin}/adds/flotas4.jpg);">
    <div id="titular_texto_cabez" style="display: block;">Movimiento de Flotas - {$planetname}</div>
</div>
<div id="titulo_alternativo_corto">
    <ul class="tabsbelow">
        <li style="max-width: 240px;">
              <span><b>{$fl_fleets}:</b> {$flyingfleets} / {$maxfleets}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>{$fl_expeditions}:</b> {$currentexpeditions} / {$maxexpeditions} </span>
        </li>                                    
    </ul>
</div>
<div id="eins">
        <div>

<br>
<div class="movements">

    {foreach item="fleet" from=$fleets}
    <div class="movement" data-fleet="{$fleet.id}">
        <div class="mission_data">
            <div class="time" data-time="{$fleet.end_time}"></div>
            <div class="type">{$fleet.mision}</div>
            {if $fleet.imowner}
            <div class="flee_actions">
                <a href="?page=fleet&action=sendfleetback">Regresar</a>
            </div>
            {/if}

        </div>
        <div class="data">
            <div class="owner_data">
                <div class="planet_coord">
                    <div class="coord"><a href="?page=galaxy{$fleet.owner_p_link}">{$fleet.owner_p_coord}</a></div>
                    <div class="name">{$fleet.owner_p}</div>                    
                </div>
                <div class="planet">
                    <img src="./styles/theme/gultra/planeten/small/s_{$fleet.owner_p_image}.jpg">
                </div>
                
            </div>
            <div class="target_data">
                <div class="planet_coord">
                    <div class="name">{$fleet.owner_t}</div>
                    <div class="coord"><a href="?page=galaxy{$fleet.owner_t_link}">{$fleet.owner_t_coord}</a></div>                    
                </div>
                <div class="planet">
                    {if !empty($fleet.owner_t_image)}
                    <img src="./styles/theme/gultra/planeten/small/s_{$fleet.owner_t_image}.jpg">
                    {/if}
                </div>
            </div>
        </div>
    </div>
    {foreachelse}
    No hay flotas en vuelo
    {/foreach}


</div>

</div>	
</div>
<div class="new_footer"></div>
<br /><br /><br />		
</div>
</div>	
{include file="planet_menu.tpl"}
</div>	
</div>
</div>
{include file="overall_footer.tpl"}

<script type="text/javascript">
    get_end();
    window.setInterval(function(){
        get_end();
    },1000);

    function get_end(){
        fleets = $('[data-fleet]');

        $.each(fleets, function(i, v){
            var now = Date.now() / 1000;

            elemnt = $(v).find('.time');
            end = $(elemnt).data('time');
            
            time = end - now;
            if(time>0)
                $(elemnt).text(GetRestTimeFormat(time))
            else
                $(v).hide();

            if(fleets.length == 1 && time <= 0)
                location.reload(true);
        });
    }
</script>