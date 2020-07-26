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
	tbody tr:nth-child(2n) {
	    background: rgba(0, 0, 0, 0.32);
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

</style>

<table width="95%">
	<thead>
		<tr style="box-shadow: 0 5px 5px -2px #000">
	        <th>{$bn_player}</th>
	        <th>{$bn_reason}</th>
	        <th>{$bn_from}</th>
	        <th>{$bn_until}</th>
	        <th>{$bn_by}</th>
	    </tr>
	</thead>
   {foreach item=PlayerInfo from=$PrangerList name=Pranger}
   <tr>
      <td><center><b>{$PlayerInfo.player}</b></center></td>
      <td><center>{$PlayerInfo.theme}</center></td>
      <td><center>{$PlayerInfo.from}</center></td>
      <td><center>{$PlayerInfo.to}</center></td>
      <td><center><b><a href="mailto:{$PlayerInfo.mail}" class="send" title="{$PlayerInfo.info}">{$PlayerInfo.admin}</a></b></center></td>
   </tr>
   {/foreach}
    <tr>
	   	<td colspan="5" style="text-align: center;">
	   		{if {$smarty.foreach.Pranger.total} == 0}{$bn_no_players_banned}{else}{$bn_exists}{$smarty.foreach.Pranger.total}{$bn_players_banned}{/if}
	   	</td>
    </tr>
</table>
	
{include file="index_footer.tpl"}