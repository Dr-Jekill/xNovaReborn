{include file="adm/overall_header.tpl"}
<br>
<table width="90%">
<tr>
	<th><h3>{$ff_id}</h3></th>
	<th><h3>{$ff_ammount}</h3></th>
	<th><h3>{$ff_mission}</h3></th>
	<th><h3>{$ff_beginning}</h3></th>
	<th><h3>{$ff_departure}</h3></th>
	<th><h3>{$ff_departure_hour}</h3></th>
	<th><h3>{$ff_objective}</h3></th>
	<th><h3>{$ff_arrival}</h3></th>
	<th><h3>{$ff_arrival_hour}</h3></th>
    <th><h3>{$ff_hold_position}</h3></th>
    <th><h3>{$ff_lock}</h3></th>
</tr>
{foreach item=FleetItem from=$FleetList}
<tr>
	<td>{$FleetItem.Id}</td>
	<td>{$FleetItem.Fleet}</td>
	<td>{$FleetItem.Mission}</td>
	<td>{$FleetItem.St_Owner}</td>
	<td>{$FleetItem.St_Posit}</td>
	<td>{$FleetItem.St_Time}</td>
	<td>{$FleetItem.En_Owner}</td>
	<td>{$FleetItem.En_Posit}</td>
	<td>{$FleetItem.En_Time}</td>
    <td>{$FleetItem.Wa_Time}</td>
    <td>{$FleetItem.lock}</td>
</tr>
{foreachelse}
<tr>
	<td colspan="11"><center>{$ff_no_fleets}</center></td>
</tr>
{/foreach}
</table>
</body>
{include file="adm/overall_footer.tpl"}