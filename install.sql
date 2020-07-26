-- ----------------------------
-- Table structure for prefix_accounts
-- ----------------------------
DROP TABLE IF EXISTS `prefix_accounts`;
CREATE TABLE `prefix_accounts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NULL DEFAULT NULL,
  `password` varchar(255) NULL DEFAULT NULL,
  `email` varchar(255) NULL DEFAULT NULL,
  `u_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_aks
-- ----------------------------
DROP TABLE IF EXISTS `prefix_aks`;
CREATE TABLE `prefix_aks`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teilnehmer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ankunft` int(11) NULL DEFAULT NULL,
  `galaxy` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `system` smallint(5) UNSIGNED NULL DEFAULT NULL,
  `planet` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `planet_type` enum('1','3') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eingeladen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_alliance
-- ----------------------------
DROP TABLE IF EXISTS `prefix_alliance`;
CREATE TABLE `prefix_alliance`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ally_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ally_tag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ally_owner` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ally_register_time` int(11) NOT NULL DEFAULT 0,
  `ally_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ally_web` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ally_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ally_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '10.png',
  `ally_request` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ally_request_waiting` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ally_request_notallow` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `ally_owner_range` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ally_ranks` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ally_members` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `ally_stats` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `ally_diplo` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `ally_universe` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `ally_tag`(`ally_tag`),
  INDEX `ally_name`(`ally_name`),
  INDEX `ally_universe`(`ally_universe`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_banned
-- ----------------------------
DROP TABLE IF EXISTS `prefix_banned`;
CREATE TABLE `prefix_banned`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `who` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `theme` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `who2` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT 0,
  `longer` int(11) NOT NULL DEFAULT 0,
  `author` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `universe` tinyint(3) UNSIGNED NOT NULL,
  INDEX `ID`(`id`),
  INDEX `universe`(`universe`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_buddy
-- ----------------------------
DROP TABLE IF EXISTS `prefix_buddy`;
CREATE TABLE `prefix_buddy`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sender` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `owner` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `active` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `universe` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `universe`(`universe`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_chat
-- ----------------------------
DROP TABLE IF EXISTS `prefix_chat`;
CREATE TABLE `prefix_chat`  (
  `messageid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `ally_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `universe` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`messageid`),
  INDEX `timestamp`(`timestamp`),
  INDEX `ally_id`(`ally_id`),
  INDEX `universe`(`universe`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_config
-- ----------------------------
DROP TABLE IF EXISTS `prefix_config`;
CREATE TABLE `prefix_config`  (
  `uni` int(11) NOT NULL AUTO_INCREMENT,
  `VERSION` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `users_amount` int(11) NOT NULL,
  `game_speed` bigint(20) NOT NULL,
  `fleet_speed` bigint(11) NOT NULL,
  `resource_multiplier` int(11) NOT NULL,
  `halt_speed` int(11) NOT NULL,
  `Fleet_Cdr` tinyint(3) UNSIGNED NOT NULL,
  `Defs_Cdr` tinyint(3) UNSIGNED NOT NULL,
  `initial_fields` int(11) UNSIGNED NOT NULL,
  `bgm_active` tinyint(1) UNSIGNED NOT NULL,
  `bgm_file` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uni_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `game_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `game_disable` tinyint(1) UNSIGNED NOT NULL,
  `close_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `max_galaxy` tinyint(3) UNSIGNED NOT NULL DEFAULT 9,
  `max_system` smallint(5) UNSIGNED NOT NULL DEFAULT 400,
  `max_planets` tinyint(3) UNSIGNED NOT NULL DEFAULT 20,
  `metal_basic_income` int(11) NOT NULL,
  `crystal_basic_income` int(11) NOT NULL,
  `deuterium_basic_income` int(11) NOT NULL,
  `norio_basic_income` int(11) NOT NULL,
  `energy_basic_income` int(11) NOT NULL,
  `planet_factor` float(2, 1) NOT NULL DEFAULT 1,
  `LastSettedGalaxyPos` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `LastSettedSystemPos` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `LastSettedPlanetPos` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `noobprotection` int(11) NOT NULL,
  `noobprotectiontime` int(11) NOT NULL,
  `noobprotectionmulti` int(11) NOT NULL,
  `forum_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adm_attack` tinyint(1) UNSIGNED NOT NULL,
  `debug` tinyint(1) UNSIGNED NOT NULL,
  `lang` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stat` int(11) NOT NULL,
  `stat_level` int(11) NOT NULL,
  `stat_last_update` int(11) NOT NULL,
  `stat_settings` int(11) NOT NULL,
  `stat_update_time` int(11) NOT NULL,
  `stat_last_db_update` int(11) NOT NULL,
  `stats_fly_lock` int(11) NOT NULL,
  `stat_last_banner_update` int(11) NOT NULL,
  `stat_banner_update_time` int(11) NOT NULL,
  `cron_lock` int(11) NOT NULL,
  `ts_modon` tinyint(1) NOT NULL,
  `ts_server` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ts_tcpport` smallint(5) NOT NULL,
  `ts_udpport` smallint(5) NOT NULL,
  `ts_timeout` tinyint(1) NOT NULL,
  `ts_version` tinyint(1) NOT NULL,
  `ts_cron_last` int(11) NOT NULL,
  `ts_cron_interval` smallint(5) NOT NULL,
  `ts_login` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ts_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reg_closed` tinyint(1) NOT NULL,
  `OverviewNewsFrame` tinyint(1) NOT NULL,
  `capaktiv` tinyint(1) NOT NULL,
  `cappublic` varchar(42) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `capprivate` varchar(42) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `min_build_time` tinyint(2) NOT NULL,
  `mail_active` tinyint(1) NOT NULL,
  `mail_use` tinyint(1) NOT NULL,
  `smtp_host` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `smtp_port` smallint(5) NOT NULL,
  `smtp_user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `smtp_pass` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `smtp_ssl` enum('','ssl','tls') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `smtp_sendmail` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `smail_path` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_valid` tinyint(1) NOT NULL,
  `metal_start` int(11) UNSIGNED NOT NULL DEFAULT 500,
  `crystal_start` int(11) UNSIGNED NOT NULL DEFAULT 500,
  `deuterium_start` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `norio_start` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `darkmatter_start` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ftp_server` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ftp_user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ftp_user_pass` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ftp_root_path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fb_on` tinyint(1) NOT NULL,
  `fb_apikey` varchar(42) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fb_skey` varchar(42) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ga_active` varchar(42) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ga_key` varchar(42) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `moduls` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trade_allowed_ships` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trade_charge` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `min_point_for_alliance` int(11) NULL DEFAULT 0,
  `queue_build_init` int(11) NULL DEFAULT 1,
  `queue_build_commander` int(11) NULL DEFAULT 3,
  `queue_research_init` int(11) NULL DEFAULT 1,
  `queue_research_commander` int(11) NULL DEFAULT 3,
  `game_sound` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `build_images` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `resources_images` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `server_created` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`uni`)
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prefix_config
-- ----------------------------
INSERT INTO `prefix_config` VALUES (1, '7.0', 1, 125000, 125000, 50, 50, 30, 0, 250, 0, '', 'Reborn', 'xNova Reborn', 0, 'El juego se encuentra actualmente cerrado.', 9, 400, 15, 20, 10, 0, 0, 0, 1.0, 1, 1, 1, 0, 5000, 5, 'http://parallelgames.cubava.cu/', 1, 1, 'es', 0, 2, 0, 1000, 25, 0, 0, 0, 1440, 0, 0, '127.0.0.1', 8767, 32767, 1, 2, 1588954215, 0, '', '', 0, 1, 0, '', '', 1, 0, 0, '', 0, '', '', '', '', '', 0, 500, 500, 0, 0, 0, '0', '0', '0', '0', 0, '', '', '0', '', '1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;0;1;1;1;1;1;1;1;1;1;1;1;1;1;1', '202,208,207,206', '0.3', 0, 2, 3, 2, 3, '0', '0', '0', 0);

-- ----------------------------
-- Table structure for prefix_diplo
-- ----------------------------
DROP TABLE IF EXISTS `prefix_diplo`;
CREATE TABLE `prefix_diplo`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_1` int(11) UNSIGNED NOT NULL,
  `owner_2` int(11) UNSIGNED NOT NULL,
  `level` tinyint(1) UNSIGNED NOT NULL,
  `accept` tinyint(1) UNSIGNED NOT NULL,
  `accept_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `universe` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `owner_1`(`owner_1`, `owner_2`),
  INDEX `universe`(`universe`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_fleets
-- ----------------------------
DROP TABLE IF EXISTS `prefix_fleets`;
CREATE TABLE `prefix_fleets`  (
  `fleet_id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fleet_owner` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_mission` enum('1','2','3','4','5','6','7','8','9','10','11','15') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '3',
  `fleet_amount` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_array` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fleet_universe` tinyint(3) UNSIGNED NOT NULL,
  `fleet_start_time` int(11) NOT NULL DEFAULT 0,
  `fleet_start_id` int(11) UNSIGNED NOT NULL,
  `fleet_start_galaxy` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_start_system` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_start_planet` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_start_type` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `fleet_end_time` int(11) NOT NULL DEFAULT 0,
  `fleet_end_stay` int(11) NOT NULL DEFAULT 0,
  `fleet_end_id` int(11) UNSIGNED NOT NULL,
  `fleet_end_galaxy` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_end_system` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_end_planet` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_end_type` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `fleet_target_obj` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_resource_metal` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_resource_crystal` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_resource_deuterium` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_resource_darkmatter` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_resource_norio` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_target_owner` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_group` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `fleet_mess` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `start_time` int(11) NULL DEFAULT NULL,
  `fleet_busy` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`fleet_id`),
  INDEX `fleet_mess`(`fleet_mess`),
  INDEX `fleet_target_owner`(`fleet_target_owner`),
  INDEX `fleet_end_stay`(`fleet_end_stay`),
  INDEX `fleet_end_time`(`fleet_end_time`),
  INDEX `fleet_start_time`(`fleet_start_time`),
  INDEX `fleet_start_id`(`fleet_start_id`),
  INDEX `fleet_end_id`(`fleet_end_id`),
  INDEX `fleet_universe`(`fleet_universe`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_fleettrades
-- ----------------------------
DROP TABLE IF EXISTS `prefix_fleettrades`;
CREATE TABLE `prefix_fleettrades`  (
  `fleettrade_id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `trader_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `planet_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `fleettrade_date` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ship_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ship_ammount` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `metal_total` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `crystal_total` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `deuterium_total` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `norio_total` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `darkmatter_total` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`fleettrade_id`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for prefix_messages
-- ----------------------------
DROP TABLE IF EXISTS `prefix_messages`;
CREATE TABLE `prefix_messages`  (
  `message_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `message_owner` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `message_sender` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `message_time` int(11) NOT NULL DEFAULT 0,
  `message_type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `message_from` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message_subject` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `message_unread` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `message_universe` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`message_id`),
  INDEX `message_owner`(`message_owner`),
  INDEX `message_type`(`message_type`),
  INDEX `message_sender`(`message_sender`),
  INDEX `message_unread`(`message_unread`),
  INDEX `message_universe`(`message_universe`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_modules
-- ----------------------------
DROP TABLE IF EXISTS `prefix_modules`;
CREATE TABLE `prefix_modules`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NULL DEFAULT NULL,
  `active` enum('0','1') NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_news
-- ----------------------------
DROP TABLE IF EXISTS `prefix_news`;
CREATE TABLE `prefix_news`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` int(11) NOT NULL,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prefix_news
-- ----------------------------
INSERT INTO `prefix_news` VALUES (1, 'Core', 0, 'Bienvenido', 'Bienvenido a xNova Reborn Core 7.0, por favor pasate por el sitio oficial para que te familiarices con el nuevo entorno y aprendas a desarrollar.');

-- ----------------------------
-- Table structure for prefix_notes
-- ----------------------------
DROP TABLE IF EXISTS `prefix_notes`;
CREATE TABLE `prefix_notes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) UNSIGNED NULL DEFAULT NULL,
  `time` int(11) NULL DEFAULT NULL,
  `priority` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `universe` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `universe`(`universe`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_planets
-- ----------------------------
DROP TABLE IF EXISTS `prefix_planets`;
CREATE TABLE `prefix_planets`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Capital',
  `id_owner` int(11) UNSIGNED NULL DEFAULT NULL,
  `universe` tinyint(3) UNSIGNED NOT NULL,
  `galaxy` tinyint(3) NOT NULL DEFAULT 0,
  `system` smallint(5) NOT NULL DEFAULT 0,
  `planet` tinyint(3) NOT NULL DEFAULT 0,
  `last_update` int(11) NULL DEFAULT NULL,
  `planet_type` enum('1','3') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `destruyed` int(11) NOT NULL DEFAULT 0,
  `b_building` int(11) NOT NULL DEFAULT 0,
  `b_building_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `b_hangar` int(11) NOT NULL DEFAULT 0,
  `b_hangar_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `b_hangar_plus` int(11) NOT NULL DEFAULT 0,
  `image` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'dschjungelplanet05',
  `diameter` int(11) UNSIGNED NOT NULL DEFAULT 12800,
  `field_current` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `field_max` smallint(5) UNSIGNED NOT NULL DEFAULT 163,
  `temp_min` int(3) NOT NULL DEFAULT -17,
  `temp_max` int(3) NOT NULL DEFAULT 23,
  `metal` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `metal_perhour` decimal(10, 0) UNSIGNED NOT NULL DEFAULT 0,
  `metal_max` bigint(20) UNSIGNED NULL DEFAULT 100000,
  `crystal` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `crystal_perhour` decimal(10, 0) UNSIGNED NOT NULL DEFAULT 0,
  `crystal_max` bigint(20) UNSIGNED NULL DEFAULT 100000,
  `deuterium` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `deuterium_used` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `deuterium_perhour` decimal(10, 0) UNSIGNED NOT NULL DEFAULT 0,
  `deuterium_max` bigint(20) UNSIGNED NULL DEFAULT 100000,
  `norio` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `norio_perhour` decimal(10, 0) UNSIGNED NOT NULL DEFAULT 0,
  `norio_max` bigint(20) UNSIGNED NULL DEFAULT 100000,
  `energy_used` bigint(11) NOT NULL DEFAULT 0,
  `energy_max` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `metal_mine` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `crystal_mine` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `deuterium_sintetizer` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `solar_plant` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `fusion_plant` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `robot_factory` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `nano_factory` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hangar` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `metal_store` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `crystal_store` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `deuterium_store` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `norio_store` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `laboratory` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `terraformer` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `university` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `norio_mine` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `ally_deposit` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `silo` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `mondbasis` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `phalanx` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `sprungtor` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `small_ship_cargo` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `big_ship_cargo` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `light_hunter` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `heavy_hunter` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `crusher` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `battle_ship` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `colonizer` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `recycler` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `spy_sonde` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `bomber_ship` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `solar_satelit` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `destructor` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `dearth_star` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `battleship` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lune_noir` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `ev_transporter` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `star_crasher` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `giga_recykler` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `dm_ship` bigint(20) NOT NULL DEFAULT 0,
  `orbital_station` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `misil_launcher` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `small_laser` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `big_laser` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `gauss_canyon` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `ionic_canyon` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `buster_canyon` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `small_protection_shield` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `planet_protector` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `big_protection_shield` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `graviton_canyon` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `interceptor_misil` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `interplanetary_misil` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `metal_mine_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10',
  `crystal_mine_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10',
  `deuterium_sintetizer_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10',
  `norio_mine_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10',
  `solar_plant_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10',
  `fusion_plant_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10',
  `solar_satelit_porcent` enum('0','1','2','3','4','5','6','7','8','9','10') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10',
  `last_jump_time` int(11) NOT NULL DEFAULT 0,
  `der_metal` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `der_crystal` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `der_norio` double(50, 0) UNSIGNED NOT NULL DEFAULT 0,
  `id_luna` int(11) NOT NULL DEFAULT 0,
  `atmosphere` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_planet` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_luna`(`id_luna`),
  INDEX `galaxy`(`galaxy`, `system`, `planet`, `planet_type`),
  INDEX `id_owner`(`id_owner`),
  INDEX `destruyed`(`destruyed`),
  INDEX `universe`(`universe`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_rw
-- ----------------------------
DROP TABLE IF EXISTS `prefix_rw`;
CREATE TABLE `prefix_rw`  (
  `owners` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`rid`)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_session
-- ----------------------------
DROP TABLE IF EXISTS `prefix_session`;
CREATE TABLE `prefix_session`  (
  `sess_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `user_ua` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_side` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_method` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_lastactivity` int(11) NOT NULL,
  PRIMARY KEY (`sess_id`) USING HASH,
  UNIQUE INDEX `user_id`(`user_id`) USING HASH,
  INDEX `user_ip`(`user_ip`, `user_lastactivity`) USING HASH
) ENGINE = MEMORY CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for prefix_statpoints
-- ----------------------------
DROP TABLE IF EXISTS `prefix_statpoints`;
CREATE TABLE `prefix_statpoints`  (
  `id_owner` int(11) UNSIGNED NOT NULL,
  `id_ally` int(11) UNSIGNED NOT NULL,
  `stat_type` tinyint(1) UNSIGNED NOT NULL,
  `universe` tinyint(3) UNSIGNED NOT NULL,
  `tech_rank` int(11) UNSIGNED NOT NULL,
  `tech_old_rank` int(11) UNSIGNED NOT NULL,
  `tech_points` bigint(20) UNSIGNED NOT NULL,
  `tech_count` int(11) UNSIGNED NOT NULL,
  `build_rank` int(11) UNSIGNED NOT NULL,
  `build_old_rank` int(11) UNSIGNED NOT NULL,
  `build_points` bigint(20) UNSIGNED NOT NULL,
  `build_count` int(11) UNSIGNED NOT NULL,
  `defs_rank` int(11) UNSIGNED NOT NULL,
  `defs_old_rank` int(11) UNSIGNED NOT NULL,
  `defs_points` bigint(20) UNSIGNED NOT NULL,
  `defs_count` int(11) UNSIGNED NOT NULL,
  `fleet_rank` int(11) UNSIGNED NOT NULL,
  `fleet_old_rank` int(11) UNSIGNED NOT NULL,
  `fleet_points` bigint(20) UNSIGNED NOT NULL,
  `fleet_count` int(11) UNSIGNED NOT NULL,
  `total_rank` int(11) UNSIGNED NOT NULL,
  `total_old_rank` int(11) UNSIGNED NOT NULL,
  `total_points` bigint(20) UNSIGNED NOT NULL,
  `total_count` int(11) UNSIGNED NOT NULL,
  INDEX `stat_type`(`stat_type`),
  INDEX `id_owner`(`id_owner`),
  INDEX `universe`(`universe`)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for prefix_supp
-- ----------------------------
DROP TABLE IF EXISTS `prefix_supp`;
CREATE TABLE `prefix_supp`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` int(11) UNSIGNED NOT NULL,
  `time` int(11) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `universe` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `player_id`(`player_id`),
  INDEX `universe`(`universe`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_topkb
-- ----------------------------
DROP TABLE IF EXISTS `prefix_topkb`;
CREATE TABLE `prefix_topkb`  (
  `id_owner1` int(11) UNSIGNED NOT NULL,
  `angreifer` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `id_owner2` int(11) UNSIGNED NOT NULL,
  `defender` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `gesamtunits` bigint(20) UNSIGNED NOT NULL,
  `rid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fleetresult` enum('r','a','w') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `universe` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`rid`),
  INDEX `gesamtunits`(`gesamtunits`),
  INDEX `universe`(`universe`)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prefix_users
-- ----------------------------
DROP TABLE IF EXISTS `prefix_users`;
CREATE TABLE `prefix_users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `email_2` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `lang` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'es',
  `authlevel` enum('0','1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `authattack` enum('0','1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `rights` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_planet` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `universe` tinyint(3) UNSIGNED NOT NULL,
  `galaxy` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `system` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `planet` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `darkmatter` int(11) NOT NULL DEFAULT 0,
  `user_lastip` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ip_at_reg` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `register_time` int(11) NOT NULL DEFAULT 0,
  `onlinetime` int(11) NOT NULL DEFAULT 0,
  `dpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'gow',
  `design` tinyint(4) NOT NULL DEFAULT 1,
  `noipcheck` tinyint(4) NOT NULL DEFAULT 1,
  `planet_sort` tinyint(1) NOT NULL DEFAULT 0,
  `planet_sort_order` tinyint(1) NOT NULL DEFAULT 0,
  `spio_anz` tinyint(2) NOT NULL DEFAULT 1,
  `settings_tooltiptime` tinyint(1) UNSIGNED NOT NULL DEFAULT 5,
  `settings_fleetactions` tinyint(2) UNSIGNED NOT NULL DEFAULT 3,
  `settings_planetmenu` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `settings_esp` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `settings_wri` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `settings_bud` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `settings_mis` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `settings_rep` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `settings_tnstor` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `settings_gview` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `urlaubs_modus` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `urlaubs_until` int(11) NOT NULL DEFAULT 0,
  `db_deaktjava` int(11) NOT NULL DEFAULT 0,
  `new_message` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `new_gmessage` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `fleet_shortcut` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `b_tech_planet` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `b_tech` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `b_tech_id` smallint(2) UNSIGNED NOT NULL DEFAULT 0,
  `b_tech_queue` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `spy_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `computer_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `military_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `defence_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `shield_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `energy_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hyperspace_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `combustion_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `impulse_motor_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hyperspace_motor_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `laser_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `ionic_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `buster_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `intergalactic_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `expedition_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `metal_proc_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `crystal_proc_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `deuterium_proc_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `norio_proc_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `darkmatter_moon` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `graviton_tech` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `ally_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ally_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ally_request` int(11) NOT NULL DEFAULT 0,
  `ally_request_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ally_register_time` int(11) NOT NULL DEFAULT 0,
  `ally_rank_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `bana` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `banaday` int(11) NOT NULL DEFAULT 0,
  `hof` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `wons` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `raza` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `commander` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `commander_time` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `admiral` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `admiral_time` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `technocratic` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `technocratic_time` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `engineer` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `engineer_time` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `geologe` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `geologe_time` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `loos` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `draws` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `kbmetal` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `kbcrystal` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `kbnorio` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lostunits` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `desunits` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `uctime` int(11) NOT NULL DEFAULT 0,
  `setmail` int(11) NOT NULL DEFAULT 0,
  `fb_id` bigint(15) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fb_id`(`fb_id`),
  INDEX `authlevel`(`authlevel`),
  INDEX `onlinetime`(`onlinetime`),
  INDEX `username`(`username`),
  INDEX `universe`(`universe`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
