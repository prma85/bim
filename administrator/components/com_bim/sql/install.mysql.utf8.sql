CREATE TABLE IF NOT EXISTS `#__bim_kpi` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
`asset_id` INT(11)  NOT NULL ,
`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`created` DATETIME NOT NULL ,
`created_by` INT(11)  NOT NULL ,
`modified` DATETIME NOT NULL ,
`modified_by` INT(11)  NOT NULL ,
`title` VARCHAR(255)  NOT NULL ,
`alias` VARCHAR(255) COLLATE utf8_bin NOT NULL ,
`title_fr` VARCHAR(255)  NOT NULL ,
`alias_fr` VARCHAR(255) COLLATE utf8_bin NOT NULL ,
`responsible` INT(11)  NOT NULL ,
`unit` INT NOT NULL ,
`category` INT(11)  NOT NULL ,
`type` VARCHAR(255)  NOT NULL ,
`increase` TINYINT(1)  NOT NULL ,
`periodicity` VARCHAR(255)  NOT NULL ,
`color` VARCHAR(255)  NOT NULL ,
`version` INT(11)  NOT NULL DEFAULT 1,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT COLLATE=utf8_general_ci;


INSERT INTO `#__content_types` (`type_title`, `type_alias`, `table`, `content_history_options`)
SELECT * FROM ( SELECT 'Kpi','com_bim.kpi','{"special":{"dbtable":"#__bim_kpi","key":"id","type":"Kpi","prefix":"BimTable"}}', '{"formFile":"administrator\/components\/com_bim\/models\/forms\/kpi.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"objective","targetTable":"#__bim_objective","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"unit","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"}]}') AS tmp
WHERE NOT EXISTS (
	SELECT type_alias FROM `#__content_types` WHERE (`type_alias` = 'com_bim.kpi')
) LIMIT 1;


CREATE TABLE IF NOT EXISTS `#__bim_meeting` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
`asset_id` INT(11)  NOT NULL ,
`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`created` DATETIME NOT NULL ,
`created_by` INT(11)  NOT NULL ,
`modified` DATETIME NOT NULL ,
`modified_by` INT(11)  NOT NULL ,
`title` VARCHAR(255)  NOT NULL ,
`alias` VARCHAR(255) COLLATE utf8_bin NOT NULL ,
`date` DATE NOT NULL ,
`reference` VARCHAR(255)  NOT NULL ,
`kpi` INT NOT NULL ,
`participants` INT(11)  NOT NULL ,
`facts` TEXT NOT NULL ,
`causes` TEXT NOT NULL ,
`actions` TEXT NOT NULL ,
`version` INT(11)  NOT NULL DEFAULT 1,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT COLLATE=utf8_general_ci;


INSERT INTO `#__content_types` (`type_title`, `type_alias`, `table`, `content_history_options`)
SELECT * FROM ( SELECT 'Meeting','com_bim.meeting','{"special":{"dbtable":"#__bim_meeting","key":"id","type":"Meeting","prefix":"BimTable"}}', '{"formFile":"administrator\/components\/com_bim\/models\/forms\/meeting.xml", "hideFields":["checked_out","checked_out_time","params","language" ,"actions"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"kpi","targetTable":"#__bim_kpi","targetColumn":"id","displayColumn":"title"}]}') AS tmp
WHERE NOT EXISTS (
	SELECT type_alias FROM `#__content_types` WHERE (`type_alias` = 'com_bim.meeting')
) LIMIT 1;


CREATE TABLE IF NOT EXISTS `#__bim_values` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
`asset_id` INT(11)  NOT NULL ,
`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`created` DATETIME NOT NULL ,
`created_by` INT(11)  NOT NULL ,
`modified` DATETIME NOT NULL ,
`modified_by` INT(11)  NOT NULL ,
`kpi` INT NOT NULL ,
`goals` INT NOT NULL ,
`values` TEXT NOT NULL ,
`version` INT(11)  NOT NULL DEFAULT 1,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT COLLATE=utf8_general_ci;


INSERT INTO `#__content_types` (`type_title`, `type_alias`, `table`, `content_history_options`)
SELECT * FROM ( SELECT 'Value','com_bim.value','{"special":{"dbtable":"#__bim_values","key":"id","type":"Value","prefix":"BimTable"}}', '{"formFile":"administrator\/components\/com_bim\/models\/forms\/value.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"kpi","targetTable":"#__bim_kpi","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"goals","targetTable":"#__bim_goals","targetColumn":"id","displayColumn":"year"}]}') AS tmp
WHERE NOT EXISTS (
	SELECT type_alias FROM `#__content_types` WHERE (`type_alias` = 'com_bim.value')
) LIMIT 1;


CREATE TABLE IF NOT EXISTS `#__bim_goals` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
`asset_id` INT(11)  NOT NULL ,
`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`created` DATETIME NOT NULL ,
`created_by` INT(11)  NOT NULL ,
`modified` DATETIME NOT NULL ,
`modified_by` INT(11)  NOT NULL ,
`kpi` INT NOT NULL ,
`year` VARCHAR(4)  NOT NULL ,
`values` TEXT NOT NULL ,
`version` INT(11)  NOT NULL DEFAULT 1,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT COLLATE=utf8_general_ci;


INSERT INTO `#__content_types` (`type_title`, `type_alias`, `table`, `content_history_options`)
SELECT * FROM ( SELECT 'Goal','com_bim.goal','{"special":{"dbtable":"#__bim_goals","key":"id","type":"Goal","prefix":"BimTable"}}', '{"formFile":"administrator\/components\/com_bim\/models\/forms\/goal.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"kpi","targetTable":"#__bim_kpi","targetColumn":"id","displayColumn":"title"}]}') AS tmp
WHERE NOT EXISTS (
	SELECT type_alias FROM `#__content_types` WHERE (`type_alias` = 'com_bim.goal')
) LIMIT 1;


CREATE TABLE IF NOT EXISTS `#__bim_audit` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`modified` DATETIME NOT NULL ,
`modified_by` INT(11)  NOT NULL ,
`original` TEXT NOT NULL ,
`new` TEXT NOT NULL ,
`action` VARCHAR(255)  NOT NULL ,
`where` VARCHAR(255)  NOT NULL ,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT COLLATE=utf8_general_ci;


INSERT INTO `#__content_types` (`type_title`, `type_alias`, `table`, `content_history_options`)
SELECT * FROM ( SELECT 'Audited Item','com_bim.audit','{"special":{"dbtable":"#__bim_audit","key":"id","type":"Audited Item","prefix":"BimTable"}}', '{"formFile":"administrator\/components\/com_bim\/models\/forms\/audit.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}') AS tmp
WHERE NOT EXISTS (
	SELECT type_alias FROM `#__content_types` WHERE (`type_alias` = 'com_bim.audit')
) LIMIT 1;

CREATE TABLE IF NOT EXISTS `#__bim_category` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`created` DATETIME NOT NULL ,
`created_by` INT(11)  NOT NULL ,
`modified` DATETIME NOT NULL ,
`modified_by` INT(11)  NOT NULL ,
`title` VARCHAR(255)  NOT NULL ,
`alias` VARCHAR(255) COLLATE utf8_bin NOT NULL ,
`parent_id` INT NOT NULL ,
`version` INT(11)  NOT NULL DEFAULT 1,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT COLLATE=utf8_general_ci;


INSERT INTO `#__content_types` (`type_title`, `type_alias`, `table`, `content_history_options`)
SELECT * FROM ( SELECT 'Category','com_bim.category','{"special":{"dbtable":"#__bim_category","key":"id","type":"Category","prefix":"BimTable"}}', '{"formFile":"administrator\/components\/com_bim\/models\/forms\/category.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__bim_category","targetColumn":"id","displayColumn":"title"}]}') AS tmp
WHERE NOT EXISTS (
	SELECT type_alias FROM `#__content_types` WHERE (`type_alias` = 'com_bim.category')
) LIMIT 1;
