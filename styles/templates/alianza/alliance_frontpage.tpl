{include file="overall_header.tpl"}
<body id="mercado">
<div id="tooltip" class="tip"></div>
<div class="contenido_big">
<div id="cajaBG">
    <div id="caja">
<div id="topnav" class="header_g"> 	
		{include file="overall_topnav.tpl"}	
	</div> 
{include file="left_menu.tpl"}
<div id="contenidoMostrado">                               
<div id="elCosoxD">
<div id="planeta_small" style="background-image: url(styles/theme/{$Raza_skin}/adds/alianza.jpg);">
	<div id="titular_texto_cabez" style="display: block; right: 6px;">{$lm_alliance}</div>
	<div class="aliance">
		<div class="aname">
			<span>{$ally_name}</span>
		</div>
		<div class="shield">
			<img data-role="PGtooltip" data-name="{$logo}" data-direction="top" src="{$ally_image}"/>
		</div>
		<div class="mrange">
			<span>Tu rango:</span>
			<span>{$range}</span>
		</div>
	</div>
</div>
<div id="eins">
	<div>
		
		<div id="tabss">
	        <ul class="tabsbelow" id="tab-ally">
	            <li class="tab_ally selected" onclick="tab.ajax('general')" id="general" rel="alli_view" data-ref="?page=alliance&mode=overview">
	                <a href="javascript:void(0);" rel="" class="navi overview">
	                    <span>Visión general</span>
	                </a>
	            </li>
	            {if $rights.admin>0}
	            <li class="tab_ally" onclick="tab.ajax('admin')" id="admin" rel="alli_view" data-ref="?page=alliance&mode=admin&edit=overview">
	                <a href="javascript:void(0);" rel="" class="navi management">
	                    <span>Administración</span>
	                </a>
	            </li>
	            {/if}
	            {if $rights.roundmail>0}               
	            <li class="tab_ally" onclick="tab.ajax('cumi')" id="cumi" rel="alli_view" data-ref="?page=alliance&mode=circular">
	                <a href="javascript:void(0);" rel="" class="navi broadcast">
	                    <span>Comunicación</span>
	                </a>
	            </li>
	            {/if}
	            {if $rights.seeapply>0}
	            <li class="tab_ally" onclick="tab.ajax('soli')" id="soli" rel="alli_view" data-ref="?page=alliance&mode=admin&edit=requests">
	                <a href="javascript:void(0);" rel="" class="navi applications">
	                     <span class="" id="applicationTab">Solicitudes {if $requestcount}({$requestcount}) {/if}                                              <span style="display: inline;" class="newApplications undermark"></span></span>
	                </a>
	            </li>
	            {/if}
	            {if $rights.admin>0 || $rights.righthand>0}
	            <li class="tab_ally" onclick="tab.ajax('diplo')" id="diplo" rel="alli_view" data-ref="?page=alliance&mode=admin&edit=diplo">
	                <a href="javascript:void(0);" rel="" class="navi applications">
	                     <span class="" id="applicationTab">Diplomacia <span style="display: inline;" class="newApplications undermark"></span></span>
	                </a>
	            </li>
	            {/if}
	        </ul>
	        <div id="alli_view"></div>

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
	$(function(){
		tab.ajax('general');
	})
</script>