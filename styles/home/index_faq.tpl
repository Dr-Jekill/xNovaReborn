{include file="index_header.tpl"}
<style type="text/css">
	body{
		height: auto !important;
		widows: 95%;
	}
	#table {
	    background: rgba(0, 0, 0, 0.6509803921568628);
	    margin: auto;
	    margin-top: 21px;
	    border-spacing: 0;
	    color: #fff;
	}
	#table thead {
	    background: #000000a1;
	}
	#table th{
		padding: 12px;
	}
	#table td {
	    padding: 5px;
	    width: 100%;
	    display: block;
	    text-align: justify;
	    background: #0000008c;
	    padding: 5px;
	}
	#table tbody th{
		padding: 15px;
	}
	#table tbody {
	    width: 90%;
	    display: block;
	    padding: 16px;
	} 
	#table table td{
		display: table-cell;
	}


</style>
<table width="90%" id="table">

	<thead>
		<tr style="box-shadow: 0 5px 5px -2px #000">
			<th>{$faq_overview}</th>
		</tr>
	</thead>
	
	<tbody>
	{foreach key=Question item=Answer from=$FAQList}
		<tr>
			<th>{$Question}</th>
		</tr>
		<tr>
			<td class="left">
			{$Answer}
			</td>
		</tr>
	{/foreach}
	</tbody>

<h2 align="center"><span style="font-weight: 400"><b><font size="3">{$rules_info2}</font></b>

</table><br>
xNova Reborn 6 &copy; 2020<br />
Development and Design by Jorge Navarrete<br />
	</tr>

		</table>
		<br/>
		</body>
</html>