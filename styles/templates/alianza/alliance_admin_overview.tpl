<div class="section">
    <h3>
        <a id="link21" class="opened" href="javascript:void(0);" rel="allyRanks" onclick="tab.AjaxManage('link21');" data-ref="?page=alliance&mode=admin&edit=rights">
            <span>Configurar privilegios</span>
        </a>
    </h3>
</div>
<div class="sectioncontent" id="allyRanks" style="display: none;">
   
</div>

<div class="section">
    <h3>
        <a id="link23" class="opened" href="javascript:void(0);"  onclick="tab.AjaxManage('link23');" data-ref="?page=alliance&mode=admin&edit=ally" rel="allyText">
            <span>
                Gestionar textos            </span>
        </a>
    </h3>
</div>
<div class="sectioncontent" id="allyText" style="display: none;">
    
</div>

<div class="section">
    <h3>
        <a id="link24" class="opened" href="javascript:void(0);" onclick="tab.AjaxManage('link24');" data-ref="?page=alliance&mode=admin&edit=options" rel="allySettings">
            <span>
                Opciones            </span>
        </a>
    </h3>
</div>
<div class="sectioncontent" id="allySettings" style="display: none;">
    
</div>


<div class="section">
    <h3>
        <a id="link25" class="opened" href="javascript:void(0);" onclick="tab.AjaxManage('link25');" data-ref="?page=alliance&mode=admin&edit=rename" rel="allyNameTage">
            <span>
                Cambiar nombre/etiqueta de la alianza                </span>
        </a>
    </h3>
</div>
<div class="sectioncontent" id="allyNameTage" style="display: none;">
    
</div>
{if $rights.owner>0}
<div class="section">
    <h3>
        <a id="link26" class="opened" href="javascript:void(0);" onclick="tab.AjaxManage('link26','');" rel="allyDissolve" data-ref="?page=alliance&mode=admin&edit=transfer">
            <span>
                Eliminar alianza/Transferir alianza                    </span>
        </a>
    </h3>
</div>
<div class="sectioncontent" id="allyDissolve" style="display: none;">
    
</div>
{/if}