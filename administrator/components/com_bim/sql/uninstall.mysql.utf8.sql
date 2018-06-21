DROP TABLE IF EXISTS `#__bim_kpi`;

DELETE FROM `#__content_types` WHERE (type_alias = 'com_bim.kpi');
DROP TABLE IF EXISTS `#__bim_meeting`;

DELETE FROM `#__content_types` WHERE (type_alias = 'com_bim.meeting');
DROP TABLE IF EXISTS `#__bim_values`;

DELETE FROM `#__content_types` WHERE (type_alias = 'com_bim.value');
DROP TABLE IF EXISTS `#__bim_goals`;

DELETE FROM `#__content_types` WHERE (type_alias = 'com_bim.goal');
DROP TABLE IF EXISTS `#__bim_audit`;

DELETE FROM `#__content_types` WHERE (type_alias = 'com_bim.audit');

DROP TABLE IF EXISTS `#__bim_category`;
DELETE FROM `#__content_types` WHERE (type_alias = 'com_bim.category');