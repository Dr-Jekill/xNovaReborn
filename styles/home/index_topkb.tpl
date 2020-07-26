{include file="index_header.tpl"}
<style type="text/css">
	body{
		height: auto !important;
	}
	table {
	    background: rgba(0, 0, 0, 0.6509803921568628);
	    margin: auto;
	    margin-top: 21px;
	    border-spacing: 0;
	    color: #fff;
	}
	thead {
	    background: #000000a1;
	}
	th{
		padding: 10px;
	}
	td{
		padding: 5px;
	}
	a.send {
	    color: #1e5ead;
	    text-decoration: none;
	}
	tbody tr:nth-child(2n) {
	    background: rgba(0, 0, 0, 0.32);
	}

	.lose {
	    color: #ff6767;
	    text-shadow: 0 0px 1px #00000052;
	}
	.winner {
	    color: #7cd87c;
	    text-shadow: 0 0px 2px #464646;
	}

</style>

<table width="95%">
	<thead>
		<tr><th colspan="4">{$tkb_gratz}</th></tr>
		<tr style="box-shadow: 0 5px 5px -2px #000">
	        <th>{$tkb_platz}</th>
	        <th>{$tkb_owners}</th>
	        <th>{$tkb_datum}</th>
	        <th>{$tkb_units}</th>
	    </tr>
	</thead>
	<tbody>
   {foreach item=RowInfo key=RowNR from=$TopKBList}
   <tr>
      <td><center>{$RowNR + 1}</center></td>
	    <td>
	      	<center>
	      		{if $RowInfo.result == "a"}
					<span class="winner">{$RowInfo.attacker}</span> vs <span class="lose">{$RowInfo.defender}</span>
				{elseif $RowInfo.result == "r"}
					<span class="lose">{$RowInfo.attacker}</span> vs <span class="winner">{$RowInfo.defender}</span>
				{else}
					{$RowInfo.attacker} vs {$RowInfo.defender}
				{/if}
			</center>
		</td>
      <td><center>{$RowInfo.time}</center></td>
      <td><center>{$RowInfo.units}</center></td>
   </tr>
   {/foreach}
   </tbody>
    <tr>
	   	<td colspan="5" style="text-align: center;">
	   		{$tkb_legende}

	   		<span class="winner">{$tkb_gewinner}</span> <span class="lose">{$tkb_verlierer}</span> <span style="color:#FAC531">{$tkb_unentschieden}</span>
	   	</td>
    </tr>
</table>
	
{include file="index_footer.tpl"}