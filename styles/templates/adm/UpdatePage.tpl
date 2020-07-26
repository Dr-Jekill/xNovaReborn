{include file="adm/overall_header.tpl"}
<!--<script type="text/javascript" src="scripts/mbContainer.js"></script>
<script type="text/javascript" src="scripts/update.js"></script>
-->
<form action="?page=update" method="POST" enctype="multipart/form-data">
<table width="95%">
	<tr>
		<th colspan="2"><h3>Actualizaciones</h3></th>
	</tr>
	<tr>
		<td>
			<label>Archivo de Actualizacion</label>
		</td>
		<td>
			<input type="file" name="update_pack">
		</td>
	</tr>
	<tr>
		<td>
			<button class="btn btn_blue" type="submit">Actualizar</button>
		</td>
	</tr>
</table>
</form>

{if isset($msg)}
<div>
	<table width="95%">
		<tr>
			<th><h3>Archivos actualizados</h3></th>
		</tr>
		{if is_array($msg)}
			{foreach item="udate" from=$msg.update}
				<tr>
					<td>
						{$udate}
					</td>
				</tr>
			{foreachelse}
				<tr>
					<td>
						No se actualizo ningun archivo
					</td>
				</tr>
			{/foreach}
		{/if}
		<tr>
			<th><h3>Archivos agregados</h3></th>
		</tr>
		{if is_array($msg)}
			{foreach item="udate" from=$msg.new}
				<tr>
					<td>
						{$udate}
					</td>
				</tr>
			{foreachelse}
				<tr>
					<td>
						No se agregaron archivos
					</td>
				</tr>
			{/foreach}
		{/if}
		<tr>
			<th><h3>Archivos borrados</h3></th>
		</tr>
		{if is_array($msg)}
			{foreach item="udate" from=$msg.deleted}
				<tr>
					<td>
						{$udate}
					</td>
				</tr>
			{foreachelse}
				<tr>
					<td>
						No se borro ningun archivo
					</td>
				</tr>
			{/foreach}
		{/if}
		<tr>
			<th><h3>Archivos SQL</h3></th>
		</tr>
		{if is_array($msg)}
			{foreach item="udate" from=$msg.sql}
				<tr>
					<td>
						{$udate}
					</td>
				</tr>
			{foreachelse}
				<tr>
					<td>
						No se borro ningun archivo
					</td>
				</tr>
			{/foreach}
		{/if}
	</table>
</div>
{/if}
{include file="adm/overall_footer.tpl"}