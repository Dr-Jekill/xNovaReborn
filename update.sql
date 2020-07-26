CREATE TABLE `prefix_accounts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(62) NOT NULL DEFAULT '',
  `u_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `prefix_modules`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NULL DEFAULT NULL,
  `active` enum('0','1') NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS = 1;
DROP TABLE  IF EXISTS prefix_users_valid;
ALTER TABLE prefix_config ADD COLUMN `server_created` INT(11) NOT NULL DEFAULT 0;
UPDATE prefix_config SET `VERSION` = '7';
ALTER TABLE prefix_planets ADD COLUMN `atmosphere` VARCHAR(255) NOT NULL DEFAULT '';
ALTER TABLE prefix_planets ADD COLUMN `image_planet` INT(11) NOT NULL DEFAULT 1;


