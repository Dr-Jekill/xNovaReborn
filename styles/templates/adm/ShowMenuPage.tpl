
<ul id="menu">
	<li></li>
	<li class="item_separator"><span>{$mu_general}</span></li>
	{if allowedTo('ShowInformationPage')}<li class="item"><a href="?page=infos">{$mu_game_info}</a></li>{/if}
	{if allowedTo('ShowConfigPage')}<li class="item"><a href="?page=config">{$mu_settings}</a></li>{/if}
	{if allowedTo('ShowTeamspeakPage')}<li class="item"><a href="?page=teamspeak">{$mu_ts_options}</a></li>{/if}
	{if allowedTo('ShowFacebookPage')}<li class="item"><a href="?page=facebook">{$mu_fb_options}</a></li>{/if}
	{if allowedTo('ShowModulePage')}<li class="item"><a href="?page=module">{$mu_module}</a></li>{/if}
	{if allowedTo('ShowStatsPage')}<li class="item"><a href="?page=statsconf">{$mu_stats_options}</a></li>{/if}
	<li class="item_separator"><span>{$mu_users_settings}</span></li>
	{if allowedTo('ShowCreatorPage')}<li class="item"><a href="?page=create">{$new_creator_title}</a></li>{/if}
	{if allowedTo('ShowAccountEditorPage')}<li class="item"><a href="?page=accounteditor">{$mu_add_delete_resources}</a></li>{/if}
	{if allowedTo('ShowBanPage')}<li class="item"><a href="?page=bans">{$mu_ban_options}</a></li>{/if}
	<li class="item_separator"><span>{$mu_observation}</span></li>
	{if allowedTo('ShowSearchPage')}<li class="item"><a href="?page=search&amp;search=online&amp;minimize=on">{$mu_connected}</a></li>{/if}
	{if allowedTo('ShowSupportPage')}<li class="item"><a href="?page=support">{$mu_support}{if $supportticks != 0} ({$supportticks}){/if}</a></li>{/if}
	{if allowedTo('ShowActivePage')}<li class="item"><a href="?page=active">{$mu_vaild_users}</a></li>{/if}
	{if allowedTo('ShowSearchPage')}<li class="item"><a href="?page=search&amp;search=p_connect&amp;minimize=on">{$mu_active_planets}</a></li>{/if}
	{if allowedTo('ShowFlyingFleetPage')}<li class="item"><a href="?page=fleets">{$mu_flying_fleets}</a></li>{/if}
	{if allowedTo('ShowNewsPage')}<li class="item"><a href="?page=news">{$mu_news}</a></li>{/if}
	{if allowedTo('ShowSearchPage')}<li class="item"><a href="?page=search&amp;search=users&amp;minimize=on">{$mu_user_list}</a></li>{/if}
	{if allowedTo('ShowSearchPage')}<li class="item"><a href="?page=search&amp;search=planet&amp;minimize=on">{$mu_planet_list}</a></li>{/if}
	{if allowedTo('ShowSearchPage')}<li class="item"><a href="?page=search&amp;search=moon&amp;minimize=on">{$mu_moon_list}</a></li>{/if}
	{if allowedTo('ShowMessageListPage')}<li class="item"><a href="?page=messagelist">{$mu_mess_list}</a></li>{/if}
	{if allowedTo('ShowAccountDataPage')}<li class="item"><a href="?page=accountdata">{$mu_info_account_page}</a></li>{/if}
	{if allowedTo('ShowSearchPage')}<li class="item"><a href="?page=search">{$mu_search_page}</a></li>{/if}
	{if allowedTo('ShowMultiIPPage')}<li class="item"><a href="?page=multiips">{$mu_multiip_page}</a></li>{/if}
	<li class="item_separator"><span>Actualizacion</span></li>
	{if allowedTo('ShowUpdatePage')}<li class="item"><a href="?page=update">Actualizar Core</a></li>{/if}


	<li class="item_separator"><span>{$mu_tools}</span></li>
	{if allowedTo('ShowSendMessagesPage')}<li class="item"><a href="?page=globalmessage">{$mu_global_message}</a></li>{/if}
	{if allowedTo('ShowPassEncripterPage')}<li class="item"><a href="?page=password">{$mu_md5_encripter}</a></li>{/if}
	{if allowedTo('ShowStatUpdatePage')}<li class="item"><a href="?page=statsupdate" onClick=" return confirm('{$mu_mpu_confirmation}');">{$mu_manual_points_update}</a></li>{/if}
	{if allowedTo('ShowClearCachePage')}<li class="item"><a href="?page=clearcache">{$mu_clear_cache}</a></li>{/if}
	<li style="height:30px;"></li>
</ul>
