-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 08, 2016 at 01:54 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bim`
--

-- --------------------------------------------------------

--
-- Table structure for table `cs872_assets`
--

CREATE TABLE `cs872_assets` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) UNSIGNED NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_assets`
--

INSERT INTO `cs872_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 135, 0, 'root.1', 'Root Asset', '{"core.login.site":{"10":1,"6":1,"2":1},"core.login.admin":{"10":1,"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"10":1,"12":0,"6":1,"3":1},"core.delete":{"10":1,"12":0,"14":0,"6":1},"core.edit":{"10":1,"12":0,"6":1,"4":1},"core.edit.state":{"10":1,"12":0,"6":1,"5":1},"core.edit.own":{"10":1,"12":0,"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 28, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 29, 30, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 31, 32, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 33, 34, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 35, 36, 1, 'com_login', 'com_login', '{}'),
(13, 1, 37, 38, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 39, 40, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 41, 42, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 43, 44, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 45, 46, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 47, 64, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 65, 68, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 69, 70, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 71, 72, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 73, 74, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 75, 76, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 77, 80, 1, 'com_users', 'com_users', '{"core.admin":{"11":1,"7":1},"core.options":{"11":1},"core.manage":{"11":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(26, 1, 81, 82, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 23, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 66, 67, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 78, 79, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 83, 84, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(35, 27, 19, 20, 3, 'com_content.article.2', 'About Us', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(36, 8, 24, 27, 2, 'com_content.category.8', 'News', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(37, 36, 25, 26, 3, 'com_content.article.3', 'Article 1 Title', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(40, 27, 21, 22, 3, 'com_content.article.6', 'Creating Your Site', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 1, 85, 86, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(42, 1, 87, 88, 1, 'com_tags', 'com_tags', '{"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(43, 1, 89, 90, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(44, 1, 91, 92, 1, 'com_ajax', 'com_ajax', '{}'),
(47, 1, 93, 94, 1, 'com_postinstall', 'com_postinstall', '{}'),
(48, 18, 48, 49, 2, 'com_modules.module.10', 'Logged-in Users', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(49, 18, 50, 51, 2, 'com_modules.module.3', 'Popular Articles', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(50, 18, 52, 53, 2, 'com_modules.module.4', 'Recently Added Articles', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(51, 18, 54, 55, 2, 'com_modules.module.89', 'Site Information', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(52, 18, 56, 57, 2, 'com_modules.module.88', 'Image', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(53, 18, 58, 59, 2, 'com_modules.module.90', 'Release News', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(54, 18, 60, 61, 2, 'com_modules.module.91', 'Language', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(59, 1, 95, 128, 1, 'com_bim', 'com_bim', '{"core.admin":{"11":1},"core.manage":{"10":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(60, 59, 96, 97, 2, 'com_bim.category.11', 'Corporate', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(61, 59, 98, 99, 2, 'com_bim.category.12', 'Sectoral', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(62, 1, 129, 134, 1, 'com_test', 'com_test', '{"core.admin":[],"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(63, 62, 130, 131, 2, 'com_test.category.13', 'Cat 1', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(64, 62, 132, 133, 2, 'com_test.category.14', 'Cat 2', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(65, 59, 100, 101, 2, 'com_bim.goal.1', 'com_bim.goal.1', '{}'),
(66, 59, 102, 103, 2, 'com_bim.goal.2', 'com_bim.goal.2', '{}'),
(68, 59, 104, 105, 2, 'com_bim.goal.4', 'com_bim.goal.4', '{}'),
(69, 59, 106, 107, 2, 'com_bim.meeting.1', 'com_bim.meeting.1', '{}'),
(70, 59, 108, 109, 2, 'com_bim.goal.5', 'com_bim.goal.5', '{}'),
(71, 59, 110, 111, 2, 'com_bim.goal.6', 'com_bim.goal.6', '{}'),
(72, 18, 62, 63, 2, 'com_modules.module.92', 'Main Menu FR', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(73, 59, 112, 113, 2, 'com_bim.value.1', 'com_bim.value.1', '{}'),
(74, 59, 114, 115, 2, 'com_bim.value.2', 'com_bim.value.2', '{}'),
(75, 59, 116, 117, 2, 'com_bim.value.3', 'com_bim.value.3', '{}'),
(76, 59, 118, 119, 2, 'com_bim.value.4', 'com_bim.value.4', '{}'),
(77, 59, 120, 121, 2, 'com_bim.value.5', 'com_bim.value.5', '{}'),
(78, 59, 122, 123, 2, 'com_bim.value.6', 'com_bim.value.6', '{}'),
(79, 59, 124, 125, 2, 'com_bim.value.7', 'com_bim.value.7', '{}'),
(80, 59, 126, 127, 2, 'com_bim.value.8', 'com_bim.value.8', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `cs872_associations`
--

CREATE TABLE `cs872_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_banners`
--

CREATE TABLE `cs872_banners` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_banner_clients`
--

CREATE TABLE `cs872_banner_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_banner_tracks`
--

CREATE TABLE `cs872_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) UNSIGNED NOT NULL,
  `banner_id` int(10) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_bim_audit`
--

CREATE TABLE `cs872_bim_audit` (
  `id` int(11) UNSIGNED NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `original` text NOT NULL,
  `new` text NOT NULL,
  `action` varchar(255) NOT NULL,
  `where` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_bim_audit`
--

INSERT INTO `cs872_bim_audit` (`id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `modified`, `modified_by`, `original`, `new`, `action`, `where`) VALUES
(1, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 15:48:03', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 21:42:41","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 21:45:41","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 21:45:41","modified_by":"762","kpi":"1","year":"2016","values":"{","version":"0"}''', '0', 'goals'),
(2, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 15:48:27', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 21:42:41","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 21:48:03","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 21:48:03","modified_by":"762","kpi":"1","year":"2016","values":"{","version":"0"}''', '0', 'goals'),
(3, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 15:57:27', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 21:56:56","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"sa\\",\\"goal\\":\\"as\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asdasd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 21:56:56","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 21:48:27","modified_by":"762","kpi":"1","year":"2016","values":"{","version":"0"}''', '0', 'goals'),
(4, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 15:58:53', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 21:58:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"sa\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asdasd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 21:58:39","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 21:57:27","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"sa\\",\\"goal\\":\\"as\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asdasd\\"}}","version":"0"}''', '0', 'goals'),
(5, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:00:24', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:00:22","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"sas\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asdasd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:00:22","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 21:58:53","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"sa\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asdasd\\"}}","version":"0"}''', '1', 'goals'),
(6, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:20:48', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:00:24","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"sas\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asdasd\\"}}","version":"0"}''', '1', 'goals'),
(7, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:21:19', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:20:48","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(8, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:21:39', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:21:19","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(9, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:22:39', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:21:39","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(10, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:22:51', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:22:39","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(11, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:23:21', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:22:51","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(12, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:24:39', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:23:21","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(13, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:25:22', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:24:39","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(14, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:26:21', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:25:22","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(15, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:27:03', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:26:21","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(16, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:28:19', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:27:03","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(17, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:29:42', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:28:19","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(18, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:29:55', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:29:42","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(19, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:30:26', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:29:55","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(20, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:32:34', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:30:26","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(21, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:33:02', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:32:34","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(22, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:33:23', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:33:02","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(23, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:34:11', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:33:23","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(24, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:35:09', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:34:11","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(25, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:35:18', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:35:09","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(26, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:37:31', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:35:18","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(27, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:38:35', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:37:31","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(28, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:38:42', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:38:35","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(29, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:39:39', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:38:42","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(30, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:41:19', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:39:39","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(31, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:42:48', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:41:19","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(32, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:43:51', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:42:48","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(33, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:45:02', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:43:51","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(34, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:46:54', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"0","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:45:02","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(35, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:47:02', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:46:54","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(36, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:54:42', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:47:02","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(37, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:55:37', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:54:42","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(38, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 16:58:15', 762, '{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:57:14","created_by":"762","modified_by":"762","kpi":"1","kpihidden":{"1":"1"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"01\\",\\"goal\\":\\"70\\"},\\"1\\":{\\"month\\":\\"02\\",\\"goal\\":\\"70\\"},\\"2\\":{\\"month\\":\\"03\\",\\"goal\\":\\"70\\"},\\"3\\":{\\"month\\":\\"04\\",\\"goal\\":\\"75\\"},\\"4\\":{\\"month\\":\\"05\\",\\"goal\\":\\"75\\"},\\"5\\":{\\"month\\":\\"06\\",\\"goal\\":\\"75\\"},\\"6\\":{\\"month\\":\\"07\\",\\"goal\\":\\"80\\"},\\"7\\":{\\"month\\":\\"08\\",\\"goal\\":\\"80\\"},\\"8\\":{\\"month\\":\\"09\\",\\"goal\\":\\"85\\"},\\"9\\":{\\"month\\":\\"10\\",\\"goal\\":\\"85\\"},\\"10\\":{\\"month\\":\\"11\\",\\"goal\\":\\"90\\"},\\"11\\":{\\"month\\":\\"12\\",\\"goal\\":\\"90\\"}}","version":"0","version_note":""}', '''{"id":"1","asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:57:14","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:55:37","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}''', '1', 'goals'),
(39, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 17:51:53', 762, '{"id":"2","ordering":"2","state":"1","checked_out":"762","checked_out_time":"2016-03-03 23:49:17","title":"Client Satisfaction","alias":"client-satisfaction","title_fr":"La satisfaction des clients","alias_fr":"la-satisfaction-des-clients","responsible":"765","unit":"15","unithidden":{"15":"15"},"category":"1","type":"percentual","increase":"1","periodicity":"1","color":"purple","version":"","version_note":""}', '''{"id":"2","ordering":"2","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-03 18:15:48","created_by":"762","modified":"2016-03-03 23:49:29","modified_by":"762","title":"Client Satisfaction","alias":"client-satisfaction","title_fr":"La satisfaction des clients","alias_fr":"la-satisfaction-des-clients","responsible":"765","unit":"15","category":"1","type":"percentual","increase":"1","periodicity":"1","color":"purple"}''', '1', 'kpi'),
(40, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 18:00:59', 762, '{"id":"","ordering":"","state":"","checked_out":"","checked_out_time":"","title":"teste de novo","alias":"","title_fr":"le test","alias_fr":"","responsible":"765","unit":"17","category":"2","type":"number","increase":"0","periodicity":"12","color":"yellow","version":"","version_note":""}', '''{}''', '0', 'kpi'),
(41, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 18:08:19', 762, '{"id":"4","ordering":"4","state":"1","checked_out":"762","checked_out_time":"2016-03-04 00:08:16","title":"sdfsdfsdf","alias":"teste-de-novo","title_fr":"le test","alias_fr":"le-test","responsible":"765","unit":"17","unithidden":{"17":"17"},"category":"2","type":"number","increase":"0","periodicity":"12","color":"yellow","version":"","version_note":""}', '''{"id":"4","ordering":"4","state":"1","checked_out":"762","checked_out_time":"2016-03-04 00:08:16","created":"2016-03-04 00:00:59","created_by":"762","modified":"2016-03-04 00:00:59","modified_by":"762","title":"teste de novo","alias":"teste-de-novo","title_fr":"le test","alias_fr":"le-test","responsible":"765","unit":"17","category":"2","type":"number","increase":"0","periodicity":"12","color":"yellow"}''', '1', 'kpi'),
(42, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-04 17:14:09', 762, '{"id":"2","ordering":"2","state":"1","checked_out":"762","checked_out_time":"2016-03-04 23:13:16","created":"2016-03-04 23:13:35","created_by":"762","modified":"2016-03-04 23:13:35","modified_by":"762","title":"Client Satisfaction","alias":"client-satisfaction","title_fr":"La satisfaction des clients","alias_fr":"la-satisfaction-des-clients","responsible":"765","unit":"15","unithidden":{"15":"15"},"category":"1","type":"percentual","increase":"1","periodicity":"6","version":"","version_note":""}', '''{"id":"2","ordering":"2","state":"1","checked_out":"762","checked_out_time":"2016-03-04 23:13:16","created":"2016-03-03 18:15:48","created_by":"762","modified":"2016-03-03 23:51:53","modified_by":"762","title":"Client Satisfaction","alias":"client-satisfaction","title_fr":"La satisfaction des clients","alias_fr":"la-satisfaction-des-clients","responsible":"765","unit":"15","category":"1","type":"percentual","increase":"1","periodicity":"1","color":"purple"}''', '1', 'kpi'),
(43, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-04 17:41:06', 762, '{"id":"","asset_id":"","ordering":"","state":"","checked_out":"","checked_out_time":"","created":"2016-03-04 23:40:35","created_by":"762","modified":"2016-03-04 23:40:35","modified_by":"762","kpi":"2","year":"2016","values":"{}","version":"","version_note":""}', '''{}''', '0', 'goals'),
(44, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-04 18:04:02', 762, '{"id":"2","asset_id":"66","ordering":"2","state":"1","checked_out":"762","checked_out_time":"2016-03-04 23:41:50","created_by":"762","modified_by":"762","kpi":"2","kpihidden":{"2":"2"},"year":"2016","values":"{\\"0\\":{\\"month\\":\\"6\\",\\"goal\\":\\"80\\"},\\"1\\":{\\"month\\":\\"12\\",\\"goal\\":\\"85\\"}}","version":"0","version_note":""}', '''{"id":"2","asset_id":"66","ordering":"2","state":"1","checked_out":"762","checked_out_time":"2016-03-04 23:41:50","created":"2016-03-04 23:41:06","created_by":"762","modified":"2016-03-04 23:40:35","modified_by":"762","kpi":"2","year":"2016","values":"{}","version":"0"}''', '1', 'goals'),
(45, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-04 18:04:40', 762, '{"id":"","asset_id":"","ordering":"","state":"","checked_out":"","checked_out_time":"","created":"2016-03-05 00:04:13","created_by":"762","modified":"2016-03-05 00:04:13","modified_by":"762","kpi":"2","year":"2015","values":"{\\"0\\":{\\"month\\":\\"6\\",\\"goal\\":\\"70\\"},\\"1\\":{\\"month\\":\\"12\\",\\"goal\\":\\"75\\"}}","version":"","version_note":""}', '''{}''', '0', 'goals'),
(46, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-04 18:06:08', 762, '{"id":"","asset_id":"","ordering":"","state":"","checked_out":"","checked_out_time":"","created":"2016-03-05 00:04:50","created_by":"762","modified":"2016-03-05 00:04:50","modified_by":"762","kpi":"3","year":"2016","values":"{\\"0\\":{\\"month\\":\\"2\\",\\"goal\\":\\"500000\\"},\\"1\\":{\\"month\\":\\"4\\",\\"goal\\":\\"550000\\"},\\"2\\":{\\"month\\":\\"6\\",\\"goal\\":\\"600000\\"},\\"3\\":{\\"month\\":\\"8\\",\\"goal\\":\\"600000\\"},\\"4\\":{\\"month\\":\\"10\\",\\"goal\\":\\"650000\\"},\\"5\\":{\\"month\\":\\"12\\",\\"goal\\":\\"650000\\"}}","version":"","version_note":""}', '''{}''', '0', 'goals'),
(47, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-04 20:18:11', 762, '{"id":"2","ordering":"2","state":"1","checked_out":"762","checked_out_time":"2016-03-05 02:18:02","title":"Client Satisfaction","alias":"","title_fr":"La satisfaction des clients","alias_fr":"la-satisfaction-des-clients","responsible":"765","unit":"15","unithidden":{"15":"15"},"category":"1","type":"percentual","increase":"1","periodicity":"6","version":"","version_note":""}', '''{"id":"2","ordering":"2","state":"1","checked_out":"762","checked_out_time":"2016-03-05 02:18:02","created":"2016-03-04 23:13:35","created_by":"762","modified":"2016-03-04 23:14:09","modified_by":"762","title":"Client Satisfaction","alias":"client-satisfaction","title_fr":"La satisfaction des clients","alias_fr":"la-satisfaction-des-clients","responsible":"765","unit":"15","category":"1","type":"percentual","increase":"1","periodicity":"6","color":"purple"}''', '1', 'kpi'),
(48, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-04 20:19:06', 762, '{"id":"2","ordering":"2","state":"1","checked_out":"762","checked_out_time":"2016-03-05 02:19:02","title":"Client Satisfaction","alias":"","title_fr":"La satisfaction des clients","alias_fr":"la-satisfaction-des-clients","responsible":"765","unit":"15","unithidden":{"15":"15"},"category":"1","type":"percentual","increase":"1","periodicity":"6","version":"","version_note":""}', '''{"id":"2","ordering":"2","state":"1","checked_out":"762","checked_out_time":"2016-03-05 02:19:02","created":"2016-03-04 23:13:35","created_by":"762","modified":"2016-03-05 02:18:11","modified_by":"762","title":"Client Satisfaction","alias":"client-satisfaction","title_fr":"La satisfaction des clients","alias_fr":"la-satisfaction-des-clients","responsible":"765","unit":"15","category":"1","type":"percentual","increase":"1","periodicity":"6","color":"purple"}''', '1', 'kpi'),
(49, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-04 20:20:01', 762, '{"id":"3","asset_id":"67","ordering":"3","state":"1","checked_out":"762","checked_out_time":"2016-03-05 02:19:28","created_by":"762","modified_by":"762","kpi":"2","kpihidden":{"2":"2"},"year":"2015","values":"{\\"0\\":{\\"month\\":\\"2\\",\\"goal\\":\\"10\\"},\\"1\\":{\\"month\\":\\"3\\",\\"goal\\":\\"20\\"}}","version":"0","version_note":""}', '''{"id":"3","asset_id":"67","ordering":"3","state":"1","checked_out":"762","checked_out_time":"2016-03-05 02:19:28","created":"2016-03-05 00:04:40","created_by":"762","modified":"2016-03-05 00:04:13","modified_by":"762","kpi":"2","year":"2015","values":"{\\"0\\":{\\"month\\":\\"6\\",\\"goal\\":\\"70\\"},\\"1\\":{\\"month\\":\\"12\\",\\"goal\\":\\"75\\"}}","version":"0"}''', '1', 'goals'),
(50, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-04 20:28:52', 762, '{"id":"3","asset_id":"67","ordering":"3","state":"1","checked_out":"762","checked_out_time":"2016-03-05 02:19:28","created_by":"762","modified_by":"762","kpi":"2","kpihidden":{"2":"2"},"year":"2015","values":"{\\"0\\":{\\"month\\":\\"2\\",\\"goal\\":\\"10\\"},\\"1\\":{\\"month\\":\\"3\\",\\"goal\\":\\"20\\"}}","version":"0","version_note":""}', '''{"id":"3","asset_id":"67","ordering":"3","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-05 00:04:40","created_by":"762","modified":"2016-03-05 02:20:01","modified_by":"762","kpi":"2","year":"2015","values":"{\\"0\\":{\\"month\\":\\"2\\",\\"goal\\":\\"10\\"},\\"1\\":{\\"month\\":\\"3\\",\\"goal\\":\\"20\\"}}","version":"0"}''', '1', 'goals'),
(51, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-04 20:31:15', 762, '{"id":"3","asset_id":"67","ordering":"3","state":"1","checked_out":"762","checked_out_time":"2016-03-05 02:19:28","created_by":"762","modified_by":"762","kpi":"2","kpihidden":{"2":"2"},"year":"2015","values":"{\\"0\\":{\\"month\\":\\"2\\",\\"goal\\":\\"10\\"},\\"1\\":{\\"month\\":\\"3\\",\\"goal\\":\\"20\\"}}","version":"0","version_note":""}', '''{"id":"3","asset_id":"67","ordering":"3","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-05 00:04:40","created_by":"762","modified":"2016-03-05 02:28:52","modified_by":"762","kpi":"2","year":"2015","values":"{\\"0\\":{\\"month\\":\\"2\\",\\"goal\\":\\"10\\"},\\"1\\":{\\"month\\":\\"3\\",\\"goal\\":\\"20\\"}}","version":"0"}''', '1', 'goals'),
(52, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-04 20:31:47', 762, '{"id":"3","asset_id":"67","ordering":"3","state":"1","checked_out":"762","checked_out_time":"2016-03-05 02:19:28","created_by":"762","modified_by":"762","kpi":"2","kpihidden":{"2":"2"},"year":"2015","values":"{\\"0\\":{\\"month\\":\\"2\\",\\"goal\\":\\"10\\"},\\"1\\":{\\"month\\":\\"3\\",\\"goal\\":\\"20\\"}}","version":"0","version_note":""}', '''{"id":"3","asset_id":"67","ordering":"3","state":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-05 00:04:40","created_by":"762","modified":"2016-03-05 02:31:15","modified_by":"762","kpi":"2","year":"2015","values":"{\\"0\\":{\\"month\\":\\"2\\",\\"goal\\":\\"10\\"},\\"1\\":{\\"month\\":\\"3\\",\\"goal\\":\\"20\\"}}","version":"0"}''', '1', 'goals'),
(53, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 11:29:51', 762, '{"id":"1","asset_id":"69","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-07 17:25:39","created":"2016-03-07 17:29:27","created_by":"762","modified":"2016-03-07 17:29:27","modified_by":"762","title":"Action Plan - 01\\/2016","alias":"action-plan-01-2016","date":"2016-03-04","reference":"01\\/2016","kpi":"2","kpihidden":{"2":"2"},"participants":{"0":"762","1":"763","2":"765","3":"764"},"facts":"<p>- The KPI is low - Some reclamations about the product<\\/p>","causes":"<p>- Defective products - Webchat not working<\\/p>","actions":"<p>- Contract a new webchat system - Talk with supply about the products - Create marketing on social networks<\\/p>","version":"0","version_note":""}', '''{"id":"1","asset_id":"69","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-07 17:25:39","created":"2016-03-07 17:10:05","created_by":"762","modified":"2016-03-07 17:10:05","modified_by":"762","title":"Action Plan - 01\\/2016","alias":"action-plan-01-2016","date":"2016-03-04","reference":"01\\/2016","kpi":"2","participants":"0","facts":"- The KPI is low\\r\\n- Some reclamations about the product","causes":"- Defective products\\r\\n- Webchat not working","actions":"- Contract a new webchat system\\r\\n- Talk with supply about the products\\r\\n- Create marketing on social networks","version":"0"}''', '1', 'meeting'),
(54, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 11:36:34', 762, '{"id":"1","asset_id":"69","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-07 17:29:51","created_by":"762","modified_by":"762","title":"Action Plan - 01\\/2016","alias":"action-plan-01-2016","date":"2016-03-04","reference":"01\\/2016","kpi":"2","kpihidden":{"2":"2"},"participants":{"0":"762","1":"763","2":"767","3":"765"},"facts":"<p>- The KPI is low - Some reclamations about the product<\\/p>","causes":"<p>- Defective products - Webchat not working<\\/p>","actions":"<p>- Contract a new webchat system - Talk with supply about the products - Create marketing on social networks<\\/p>","version":"0","version_note":""}', '''{"id":"1","asset_id":"69","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-07 17:32:50","created":"2016-03-07 17:29:27","created_by":"762","modified":"2016-03-07 17:32:50","modified_by":"762","title":"Action Plan - 01\\/2016","alias":"action-plan-01-2016","date":"2016-03-04","reference":"01\\/2016","kpi":"2","participants":"0","facts":"- The KPI is low - Some reclamations about the product","causes":"- Defective products - Webchat not working","actions":"- Contract a new webchat system - Talk with supply about the products - Create marketing on social networks","version":"0"}''', '1', 'meeting'),
(55, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 11:59:55', 762, '{"id":"","asset_id":"","ordering":"","state":"","checked_out":"","checked_out_time":"","created":"2016-03-07 17:59:46","created_by":"762","modified":"2016-03-07 17:59:46","modified_by":"762","kpi":"1","year":"sasa","values":"{\\"0\\":{\\"month\\":\\"1\\",\\"goal\\":\\"asdasd\\"}}","version":"","version_note":""}', '''{}''', '0', 'goals'),
(56, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 12:00:11', 762, '{"id":"","asset_id":"","ordering":"","state":"","checked_out":"","checked_out_time":"","created":"2016-03-07 17:59:46","created_by":"762","modified":"2016-03-07 17:59:46","modified_by":"762","kpi":"1","year":"sasa","values":"{\\"0\\":{\\"month\\":\\"1\\",\\"goal\\":\\"asdasd\\"}}","version":"","version_note":""}', '''{}''', '0', 'goals'),
(57, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 12:00:56', 762, '{"id":"3","asset_id":"67","ordering":"3","state":"-2","checked_out":"762","checked_out_time":"2016-03-07 17:49:54","created_by":"762","modified_by":"762","kpi":"2","kpihidden":{"2":"2"},"year":"2015","values":"{''0'':{''month'':''2'',''goal'':''10''},''1'':{''month'':''3'',''goal'':''20''}}","version":"0","version_note":""}', '''{"id":"3","asset_id":"67","ordering":"3","state":"-2","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-05 00:04:40","created_by":"762","modified":"2016-03-05 02:31:47","modified_by":"762","kpi":"2","year":"2015","values":"{\\"0\\":{\\"month\\":\\"2\\",\\"goal\\":\\"10\\"},\\"1\\":{\\"month\\":\\"3\\",\\"goal\\":\\"20\\"}}","version":"0"}''', '1', 'goals');
INSERT INTO `cs872_bim_audit` (`id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `modified`, `modified_by`, `original`, `new`, `action`, `where`) VALUES
(58, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 12:04:03', 762, '{}', '''{"id":"3","asset_id":"67","ordering":"3","state":"-2","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-05 00:04:40","created_by":"762","modified":"2016-03-07 18:00:55","modified_by":"762","kpi":"2","year":"2015","values":"{''0'':{''month'':''2'',''goal'':''10''},''1'':{''month'':''3'',''goal'':''20''}}","version":"0"}''', '3', 'goals'),
(59, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 12:14:44', 762, '{}', '''{"id":"3","asset_id":"67","ordering":"3","state":"-2","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-05 00:04:40","created_by":"762","modified":"2016-03-07 18:00:55","modified_by":"762","kpi":"2","year":"2015","values":"{''0'':{''month'':''2'',''goal'':''10''},''1'':{''month'':''3'',''goal'':''20''}}","version":"0"}''', '3', 'goals'),
(60, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 12:14:59', 762, '{}', '''{"id":"3","asset_id":"67","ordering":"3","state":"-2","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-05 00:04:40","created_by":"762","modified":"2016-03-07 18:00:55","modified_by":"762","kpi":"2","year":"2015","values":"{''0'':{''month'':''2'',''goal'':''10''},''1'':{''month'':''3'',''goal'':''20''}}","version":"0"}''', '3', 'goals'),
(61, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 12:15:43', 762, '{"id":"3"}', '''{"id":"3","asset_id":"67","ordering":"3","state":"-2","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-05 00:04:40","created_by":"762","modified":"2016-03-07 18:00:55","modified_by":"762","kpi":"2","year":"2015","values":"{''0'':{''month'':''2'',''goal'':''10''},''1'':{''month'':''3'',''goal'':''20''}}","version":"0"}''', '3', 'goals'),
(62, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 12:16:22', 762, '{"id":"3"}', '''{"id":"3","asset_id":"67","ordering":"3","state":"-2","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","created":"2016-03-05 00:04:40","created_by":"762","modified":"2016-03-07 18:00:55","modified_by":"762","kpi":"2","year":"2015","values":"{''0'':{''month'':''2'',''goal'':''10''},''1'':{''month'':''3'',''goal'':''20''}}","version":"0"}''', '3', 'goals'),
(63, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 19:16:05', 762, '{"id":"","asset_id":"","ordering":"","state":"","checked_out":"","checked_out_time":"","created":"2016-03-08 01:15:54","created_by":"762","modified":"2016-03-08 01:15:54","modified_by":"762","goals_temp":"2,2","kpi":"2","goals":"2","month":"6","value":"70","version":"","version_note":""}', '''{}''', '0', 'values'),
(64, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 19:16:37', 762, '{"id":"","asset_id":"","ordering":"","state":"","checked_out":"","checked_out_time":"","created":"2016-03-08 01:16:08","created_by":"762","modified":"2016-03-08 01:16:08","modified_by":"762","goals_temp":"4,3","kpi":"3","goals":"4","month":"2","value":"510000","version":"","version_note":""}', '''{}''', '0', 'values'),
(65, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 19:17:11', 762, '{"id":"","asset_id":"","ordering":"","state":"","checked_out":"","checked_out_time":"","created":"2016-03-08 01:16:39","created_by":"762","modified":"2016-03-08 01:16:39","modified_by":"762","goals_temp":"4,3","kpi":"3","goals":"4","month":"4","value":"510000","version":"","version_note":""}', '''{}''', '0', 'values'),
(66, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 19:17:24', 762, '{"id":"","asset_id":"","ordering":"","state":"","checked_out":"","checked_out_time":"","created":"2016-03-08 01:17:13","created_by":"762","modified":"2016-03-08 01:17:13","modified_by":"762","goals_temp":"1,1","kpi":"1","goals":"1","month":"1","value":"68","version":"","version_note":""}', '''{}''', '0', 'values'),
(67, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 19:17:36', 762, '{"id":"","asset_id":"","ordering":"","state":"","checked_out":"","checked_out_time":"","created":"2016-03-08 01:17:27","created_by":"762","modified":"2016-03-08 01:17:27","modified_by":"762","goals_temp":"1,1","kpi":"1","goals":"1","month":"2","value":"71","version":"","version_note":""}', '''{}''', '0', 'values'),
(68, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 19:17:49', 762, '{"id":"","asset_id":"","ordering":"","state":"","checked_out":"","checked_out_time":"","created":"2016-03-08 01:17:39","created_by":"762","modified":"2016-03-08 01:17:39","modified_by":"762","goals_temp":"1,1","kpi":"1","goals":"1","month":"3","value":"60","version":"","version_note":""}', '''{}''', '0', 'values'),
(69, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 19:18:07', 762, '{"id":"","asset_id":"","ordering":"","state":"","checked_out":"","checked_out_time":"","created":"2016-03-08 01:17:52","created_by":"762","modified":"2016-03-08 01:17:52","modified_by":"762","goals_temp":"1,1","kpi":"1","goals":"1","month":"4","value":"79","version":"","version_note":""}', '''{}''', '0', 'values'),
(70, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-08 13:21:47', 762, '{"id":"","asset_id":"","ordering":"","state":"","checked_out":"","checked_out_time":"","created":"2016-03-08 19:21:00","created_by":"762","modified":"2016-03-08 19:21:00","modified_by":"762","goals_temp":"2,2","kpi":"2","goals":"2","month":"12","value":"90","version":"","version_note":""}', '''{}''', '0', 'values');

-- --------------------------------------------------------

--
-- Table structure for table `cs872_bim_category`
--

CREATE TABLE `cs872_bim_category` (
  `id` int(11) UNSIGNED NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `parent_id` int(11) NOT NULL,
  `version` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_bim_category`
--

INSERT INTO `cs872_bim_category` (`id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created`, `created_by`, `modified`, `modified_by`, `title`, `alias`, `parent_id`, `version`) VALUES
(1, 1, 1, 0, '0000-00-00 00:00:00', '2016-02-12 02:34:44', 762, '2016-02-12 02:37:48', 762, 'Corporate', 'corporate', 0, 1),
(2, 2, 1, 0, '0000-00-00 00:00:00', '2016-02-12 02:35:13', 762, '2016-02-12 02:35:13', 762, 'Sectoral', 'sectoral', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_bim_goals`
--

CREATE TABLE `cs872_bim_goals` (
  `id` int(11) UNSIGNED NOT NULL,
  `asset_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `kpi` int(11) NOT NULL,
  `year` varchar(4) NOT NULL,
  `values` text NOT NULL,
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_bim_goals`
--

INSERT INTO `cs872_bim_goals` (`id`, `asset_id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created`, `created_by`, `modified`, `modified_by`, `kpi`, `year`, `values`, `version`) VALUES
(1, 65, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-03 18:36:40', 762, '2016-03-03 22:58:15', 762, 1, '2016', '{"0":{"month":"01","goal":"70"},"1":{"month":"02","goal":"70"},"2":{"month":"03","goal":"70"},"3":{"month":"04","goal":"75"},"4":{"month":"05","goal":"75"},"5":{"month":"06","goal":"75"},"6":{"month":"07","goal":"80"},"7":{"month":"08","goal":"80"},"8":{"month":"09","goal":"85"},"9":{"month":"10","goal":"85"},"10":{"month":"11","goal":"90"},"11":{"month":"12","goal":"90"}}', 0),
(2, 66, 2, 1, 0, '0000-00-00 00:00:00', '2016-03-04 23:41:06', 762, '2016-03-04 23:40:35', 762, 2, '2016', '{"0":{"month":"6","goal":"80"},"1":{"month":"12","goal":"85"}}', 0),
(4, 68, 4, 1, 0, '0000-00-00 00:00:00', '2016-03-05 00:06:08', 762, '2016-03-05 00:06:08', 762, 3, '2016', '{"0":{"month":"2","goal":"500000"},"1":{"month":"4","goal":"550000"},"2":{"month":"6","goal":"600000"},"3":{"month":"8","goal":"600000"},"4":{"month":"10","goal":"650000"},"5":{"month":"12","goal":"650000"}}', 0),
(5, 70, 5, -2, 0, '0000-00-00 00:00:00', '2016-03-07 17:59:55', 762, '2016-03-07 17:59:55', 762, 1, 'sasa', '{"0":{"month":"1","goal":"asdasd"}}', 0),
(6, 71, 6, -2, 0, '0000-00-00 00:00:00', '2016-03-07 18:00:11', 762, '2016-03-07 18:00:11', 762, 1, 'sasa', '{"0":{"month":"1","goal":"asdasd"}}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_bim_kpi`
--

CREATE TABLE `cs872_bim_kpi` (
  `id` int(11) UNSIGNED NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `title_fr` varchar(255) NOT NULL,
  `alias_fr` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `responsible` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `increase` tinyint(1) NOT NULL,
  `periodicity` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_bim_kpi`
--

INSERT INTO `cs872_bim_kpi` (`id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created`, `created_by`, `modified`, `modified_by`, `title`, `alias`, `title_fr`, `alias_fr`, `responsible`, `unit`, `category`, `type`, `increase`, `periodicity`, `color`) VALUES
(1, 1, 1, 0, '0000-00-00 00:00:00', '2016-02-12 00:06:28', 762, '2016-03-03 21:51:02', 762, 'Services attended before the deadline', 'services-attended-before-the-deadline', 'Les services ont assisté avant la date limite', 'les-services-ont-assiste-avant-la-date-limite', 765, 17, 1, 'percentual', 1, '1', 'blue'),
(2, 2, 1, 0, '0000-00-00 00:00:00', '2016-03-04 23:13:35', 762, '2016-03-05 02:19:06', 762, 'Client Satisfaction', 'client-satisfaction', 'La satisfaction des clients', 'la-satisfaction-des-clients', 765, 15, 1, 'percentual', 1, '6', 'purple'),
(3, 3, 1, 0, '0000-00-00 00:00:00', '2016-03-03 18:16:58', 762, '2016-03-03 21:51:09', 762, 'Sales volume of two months', 'sales-volume-of-two-months', 'Le volume des ventes de deux mois', 'le-volume-des-ventes-de-deux-mois', 766, 16, 1, 'currency', 1, '2', 'red');

-- --------------------------------------------------------

--
-- Table structure for table `cs872_bim_meeting`
--

CREATE TABLE `cs872_bim_meeting` (
  `id` int(11) UNSIGNED NOT NULL,
  `asset_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `kpi` int(11) NOT NULL,
  `participants` varchar(255) NOT NULL,
  `facts` text NOT NULL,
  `causes` text NOT NULL,
  `actions` text NOT NULL,
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_bim_meeting`
--

INSERT INTO `cs872_bim_meeting` (`id`, `asset_id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created`, `created_by`, `modified`, `modified_by`, `title`, `alias`, `date`, `reference`, `kpi`, `participants`, `facts`, `causes`, `actions`, `version`) VALUES
(1, 69, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-07 17:29:27', 762, '2016-03-07 17:41:40', 762, 'Action Plan - 01/2016', 'action-plan-01-2016', '2016-03-04', '01/2016', 2, '762,763,767,765', '- The KPI is low - Some reclamations about the product', '- Defective products - Webchat not working', '- Contract a new webchat system - Talk with supply about the products - Create marketing on social networks', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_bim_values`
--

CREATE TABLE `cs872_bim_values` (
  `id` int(11) UNSIGNED NOT NULL,
  `asset_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `kpi` int(11) NOT NULL,
  `goals` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `month` int(2) NOT NULL,
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_bim_values`
--

INSERT INTO `cs872_bim_values` (`id`, `asset_id`, `ordering`, `state`, `checked_out`, `checked_out_time`, `created`, `created_by`, `modified`, `modified_by`, `kpi`, `goals`, `value`, `month`, `version`) VALUES
(1, 73, 1, 1, 0, '0000-00-00 00:00:00', '2016-03-08 01:16:05', 762, '2016-03-08 01:33:55', 762, 2, 2, '70', 6, 0),
(2, 74, 2, 1, 0, '0000-00-00 00:00:00', '2016-03-08 01:16:37', 762, '2016-03-08 02:02:33', 762, 3, 4, '510000', 2, 0),
(3, 75, 3, 1, 0, '0000-00-00 00:00:00', '2016-03-08 01:17:11', 762, '2016-03-08 02:02:24', 762, 3, 4, '510000', 4, 0),
(4, 76, 4, 1, 0, '0000-00-00 00:00:00', '2016-03-08 01:17:24', 762, '2016-03-08 02:02:05', 762, 1, 1, '68', 1, 0),
(5, 77, 5, 1, 0, '0000-00-00 00:00:00', '2016-03-08 01:17:36', 762, '2016-03-08 02:01:45', 762, 1, 1, '71', 2, 0),
(6, 78, 6, 1, 0, '0000-00-00 00:00:00', '2016-03-08 01:17:49', 762, '2016-03-08 02:02:52', 762, 1, 1, '60', 3, 0),
(7, 79, 7, 1, 0, '0000-00-00 00:00:00', '2016-03-08 01:18:07', 762, '2016-03-08 02:02:15', 762, 1, 1, '79', 4, 0),
(8, 80, 8, 1, 0, '0000-00-00 00:00:00', '2016-03-08 19:21:47', 762, '2016-03-08 19:21:47', 762, 2, 2, '90', 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_categories`
--

CREATE TABLE `cs872_categories` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_categories`
--

INSERT INTO `cs872_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 25, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 762, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 762, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 762, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 762, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 762, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 762, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(8, 36, 1, 11, 12, 1, 'news', 'com_content', 'News', 'news', '', '<p>This is the latest new from us.</p><p>You can edit this description in the Content Category Manager.</p><p>This will show the most recent article. You can easily change it to show more if you wish.</p><p>The module on the left shows a list of older articles.</p>', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 762, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(11, 60, 1, 17, 18, 1, '', 'com_bim', 'Corporate', 'corporate', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 762, '2016-02-12 00:01:28', 0, '2016-02-12 00:01:28', 0, '*', 1),
(12, 61, 1, 19, 20, 1, '', 'com_bim', 'Sectoral', 'sectoral', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 762, '2016-02-12 00:03:04', 762, '2016-02-12 00:04:23', 0, '*', 1),
(13, 63, 1, 21, 22, 1, '', 'com_test', 'Cat 1', 'cat-1', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 762, '2016-02-12 01:55:26', 0, '2016-02-12 01:55:26', 0, '*', 1),
(14, 64, 1, 23, 24, 1, 'cat-2', 'com_test', 'Cat 2', 'cat-2', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 762, '2016-02-12 01:56:10', 0, '2016-02-12 01:56:10', 0, '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_contact_details`
--

CREATE TABLE `cs872_contact_details` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_contact_details`
--

INSERT INTO `cs872_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`, `sortname1`, `sortname2`, `sortname3`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`, `version`, `hits`) VALUES
(1, 'Your Name', 'your-name', '', 'This is a contact form which you can edit in the contact manager. Put your address or other information here. This can be a good place to put things like business hours too.Don''t forget to put a real email address.You also may want to enable Captcha in the global configurationto prevent spam submissions of contact forms. ', '', '', '', '', '', '', '', '', 'email@example.com', 0, 1, 0, '0000-00-00 00:00:00', 1, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"","linka_name":"","linka":"","linkb_name":"","linkb":"","linkc_name":"","linkc":"","linkd_name":"","linkd":"","linke_name":"","linke":"","contact_layout":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 0, 4, 1, '', '', '', '', '', '*', '2011-01-01 00:00:01', 762, 'Joomla', '0000-00-00 00:00:00', 0, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_content`
--

CREATE TABLE `cs872_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_content`
--

INSERT INTO `cs872_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(2, 35, 'About Us', 'about-us', '<p>Put more information on this page.</p>', '', 1, 2, '2011-01-01 00:00:01', 762, 'Joomla', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-01-04 03:06:07', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":"","urlatext":"","targeta":"","urlb":"","urlbtext":"","targetb":"","urlc":"","urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 1, '', '', 1, 7, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(3, 37, 'Article 1 Title', 'article-1-title', '<p>Here is a news article.</p>', '', 1, 8, '2011-01-01 00:00:01', 762, 'Joomla', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2012-01-04 03:10:06', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":"","urlatext":"","targeta":"","urlb":"","urlbtext":"","targetb":"","urlc":"","urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(6, 40, 'Creating Your Site', 'creating-your-site', '<p>Joomla! is all about allowing you to create a site that matches your vision. The possibilities are limitless; this sample site will get you started.</p>\r\n<p>There are a few things you should know to get you started. A</p>\r\n<p>Every Joomla! Web site has two parts: the Site (which is what your site visitors see) and the Administrator (which is where you will do a lot of the site management). You need to log in to the Administrator separately with the same username and password. There is a link to the administrator on the top menu that you will see when you log in.</p>\r\n<p>You can edit articles in the Site by clicking on the edit icon. You can create a new article by clicking on the Create Article link in the top menu.</p>\r\n<p>To do basic changes to the appearance your site click Home, Site Settings and Home, Template Settings.</p>\r\n<p>To do more advanced things, like edit the contact form, manage users, or install a new template or extension, login to the Administrator.</p>\r\n<p>Some quick tips for working in the Administrator</p>\r\n<ul>\r\n<li>To change the image on all the pages: Go to the Module Manager and click on Image Module.</li>\r\n<li>To edit the Side Module: Go to Extensions, Module Manager and click on Side Module.</li>\r\n<li>To edit the Contact Form: Go to Components, Contacts. Click on Your Name.</li>\r\n</ul>\r\n<p>Once you have your basic site you may want to install your own template (that controls the overall design of your site) and then, perhaps additional extensions.</p>\r\n<p>There is a lot of help available for Joomla!. You can visit the <a href="http://forum.joomla.org">Joomla! forums</a> and the<a href="https://docs.joomla.org" target="_blank"> Joomla! documentation site</a> to get started.</p>', '', 1, 2, '2011-01-01 00:00:01', 762, 'Joomla', '2016-02-11 06:28:53', 762, 0, '0000-00-00 00:00:00', '2012-01-04 04:27:11', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"0","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 9, 0, '', '', 1, 249, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `cs872_contentitem_tag_map`
--

CREATE TABLE `cs872_contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- Table structure for table `cs872_content_frontpage`
--

CREATE TABLE `cs872_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_content_rating`
--

CREATE TABLE `cs872_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rating_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_content_types`
--

CREATE TABLE `cs872_content_types` (
  `type_id` int(10) UNSIGNED NOT NULL,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) DEFAULT NULL COMMENT 'JSON string for com_contenthistory options'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_content_types`
--

INSERT INTO `cs872_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}, "special":{"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute', '{"formFile":"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml", "hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(2, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute', '{"formFile":"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml","hideFields":["default_con","checked_out","checked_out_time","version","xreference"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[ {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{"formFile":"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml","hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(4, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{}}', 'UsersHelperRoute::getUserRoute', ''),
(5, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(6, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(8, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute', '{"formFile":"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml", "hideFields":["checked_out","checked_out_time","version", "lft", "rgt", "level", "path", "urls", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(9, 'Banner', 'com_banners.banner', '{"special":{"dbtable":"#__banners","key":"id","type":"Banner","prefix":"BannersTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"null","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"null", "asset_id":"null"}, "special":{"imptotal":"imptotal", "impmade":"impmade", "clicks":"clicks", "clickurl":"clickurl", "custombannercode":"custombannercode", "cid":"cid", "purchase_type":"purchase_type", "track_impressions":"track_impressions", "track_clicks":"track_clicks"}}', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml", "hideFields":["checked_out","checked_out_time","version", "reset"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "imptotal", "impmade", "reset"], "convertToInt":["publish_up", "publish_down", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"cid","targetTable":"#__banner_clients","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(11, 'Banner Client', 'com_banners.client', '{"special":{"dbtable":"#__banner_clients","key":"id","type":"Client","prefix":"BannersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml", "hideFields":["checked_out","checked_out_time"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":[], "displayLookup":[]}'),
(12, 'User Notes', 'com_users.note', '{"special":{"dbtable":"#__user_notes","key":"id","type":"Note","prefix":"UsersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml", "hideFields":["checked_out","checked_out_time", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(13, 'User Notes Category', 'com_users.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(15, 'Kpi', 'com_bim.kpi', '{"special":{"dbtable":"#__bim_kpi","key":"id","type":"Kpi","prefix":"BimTable"}}', '', '', '', '{"formFile":"administrator/components/com_bim/models/forms/kpi.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"objective","targetTable":"#__bim_objective","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"unit","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"}]}'),
(16, 'Meeting', 'com_bim.meeting', '{"special":{"dbtable":"#__bim_meeting","key":"id","type":"Meeting","prefix":"BimTable"}}', '', '', '', '{"formFile":"administrator/components/com_bim/models/forms/meeting.xml", "hideFields":["checked_out","checked_out_time","params","language" ,"actions"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"kpi","targetTable":"#__bim_kpi","targetColumn":"id","displayColumn":"title"}]}'),
(17, 'Value', 'com_bim.value', '{"special":{"dbtable":"#__bim_values","key":"id","type":"Value","prefix":"BimTable"}}', '', '', '', '{"formFile":"administrator/components/com_bim/models/forms/value.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"kpi","targetTable":"#__bim_kpi","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"goals","targetTable":"#__bim_goals","targetColumn":"id","displayColumn":"year"}]}'),
(18, 'Goal', 'com_bim.goal', '{"special":{"dbtable":"#__bim_goals","key":"id","type":"Goal","prefix":"BimTable"}}', '', '', '', '{"formFile":"administrator/components/com_bim/models/forms/goal.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"kpi","targetTable":"#__bim_kpi","targetColumn":"id","displayColumn":"title"}]}'),
(19, 'Audited Item', 'com_bim.audit', '{"special":{"dbtable":"#__bim_audit","key":"id","type":"Audited Item","prefix":"BimTable"}}', '', '', '', '{"formFile":"administrator/components/com_bim/models/forms/audit.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(20, 'Item', 'com_test.item', '{"special":{"dbtable":"#__test_item","key":"id","type":"Item","prefix":"TestTable"}}', '', '', '', '{"formFile":"administrator/components/com_test/models/forms/item.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"#__usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(21, 'Category', 'com_bim.category', '{"special":{"dbtable":"#__bim_category","key":"id","type":"Category","prefix":"BimTable"}}', '', '', '', '{"formFile":"administrator/components/com_bim/models/forms/category.xml", "hideFields":["checked_out","checked_out_time","params","language"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"catid","targetTable":"cs872_categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"group_id","targetTable":"cs872_usergroups","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"cs872_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"cs872_viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"cs872_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"cs872_bim_category","targetColumn":"id","displayColumn":"title"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `cs872_core_log_searches`
--

CREATE TABLE `cs872_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_extensions`
--

CREATE TABLE `cs872_extensions` (
  `extension_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_extensions`
--

INSERT INTO `cs872_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":"","filename":"mailto"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":"","filename":"wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":"","filename":"banners"}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '{"show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":"","filename":"search"}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"0","upload_limit":"2","image_formats":"gif,bmp,jpg,jpeg,png","source_formats":"txt,less,ini,xml,js,php,css","font_formats":"woff,ttf,otf","compressed_formats":"zip"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","show_publishing_options":"1","show_article_options":"1","save_history":"1","history_limit":10,"show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"10":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"11":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"12":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"14":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"17":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"15":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"16":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"13":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"9":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":"","filename":"users"}', '{"allowUserRegistration":"0","new_usertype":"2","guest_usergroup":"9","sendpassword":"1","useractivation":"1","mail_to_admin":"0","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"4","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"tag_layout":"_:default","save_history":"1","history_limit":5,"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","show_tag_num_items":"0","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '{"name":"com_contenthistory","type":"component","creationDate":"May 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_CONTENTHISTORY_XML_DESCRIPTION","group":"","filename":"contenthistory"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 0, '{"name":"com_ajax","type":"component","creationDate":"August 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_AJAX_XML_DESCRIPTION","group":"","filename":"ajax"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{"name":"com_postinstall","type":"component","creationDate":"September 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_POSTINSTALL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":"","filename":"simplepie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":"","filename":"phputf8"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"mediaversion":"451df3c6a54bba8ed9c43745e8a49188"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 'IDNA Convert', 'library', 'idna_convert', '', 0, 1, 1, 1, '{"name":"IDNA Convert","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":"","filename":"idna_convert"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{"name":"FOF","type":"library","creationDate":"2015-04-22 13:15:32","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2015 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"2.4.3","description":"LIB_FOF_XML_DESCRIPTION","group":"","filename":"fof"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 'PHPass', 'library', 'phpass', '', 0, 1, 1, 1, '{"name":"PHPass","type":"library","creationDate":"2004-2006","author":"Solar Designer","copyright":"","authorEmail":"solar@openwall.com","authorUrl":"http:\\/\\/www.openwall.com\\/phpass\\/","version":"0.3","description":"LIB_PHPASS_XML_DESCRIPTION","group":"","filename":"phpass"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":"","filename":"mod_articles_archive"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_articles_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":"","filename":"mod_banners"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":"","filename":"mod_breadcrumbs"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":"","filename":"mod_footer"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_news"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":"","filename":"mod_random_image"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":"","filename":"mod_related_items"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":"","filename":"mod_search"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":"","filename":"mod_syndicate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":"","filename":"mod_users_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":"","filename":"mod_whosonline"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":"","filename":"mod_wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":"","filename":"mod_articles_category"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":"","filename":"mod_articles_categories"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":"","filename":"mod_languages"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":"","filename":"mod_finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":"","filename":"mod_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":"","filename":"mod_logged"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":"","filename":"mod_quickicon"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":"","filename":"mod_status"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":"","filename":"mod_submenu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":"","filename":"mod_title"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":"","filename":"mod_toolbar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":"","filename":"mod_multilangstatus"}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":"","filename":"mod_version"}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats_admin"}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_tags_popular"}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":"","filename":"mod_tags_similar"}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":"","filename":"gmail"}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":"","filename":"ldap"}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '{"name":"plg_content_contact","type":"plugin","creationDate":"January 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.2","description":"PLG_CONTENT_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":"","filename":"emailcloak"}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":"","filename":"loadmodule"}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":"","filename":"pagenavigation"}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":"","filename":"vote"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"Copyright (C) 2014 by Marijn Haverbeke <marijnh@gmail.com> and others","authorEmail":"marijnh@gmail.com","authorUrl":"http:\\/\\/codemirror.net\\/","version":"5.6","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":"","filename":"codemirror"}', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"September 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":"","filename":"none"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2014","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com","version":"4.1.7","description":"PLG_TINY_XML_DESCRIPTION","group":"","filename":"tinymce"}', '{"mode":"1","skin":"0","mobile":"0","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","html_height":"550","html_width":"750","resizing":"1","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","colors":"1","table":"1","smilies":"1","hr":"1","link":"1","media":"1","print":"1","directionality":"1","fullscreen":"1","alignment":"1","visualchars":"1","visualblocks":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":"","filename":"article"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":"","filename":"image"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0);
INSERT INTO `cs872_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":"","filename":"readmore"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 1, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":"","filename":"languagefilter"}', '{"detect_browser":"0","automatic_change":"1","item_associations":"1","remove_default_prefix":"1","lang_cookie":"0","alternate_meta":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":"","filename":"p3p"}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":"","filename":"cache"}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":"","filename":"debug"}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":"","filename":"log"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION","group":"","filename":"redirect"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":"","filename":"remember"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":"","filename":"sef"}', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":"","filename":"logout"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":"","filename":"contactcreator"}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":"","filename":"profile"}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":"","filename":"languagecode"}', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":"","filename":"joomlaupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":"","filename":"extensionupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":"","filename":"recaptcha"}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":"","filename":"highlight"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_totp","type":"plugin","creationDate":"August 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION","group":"","filename":"totp"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{"name":"plg_authentication_cookie","type":"plugin","creationDate":"July 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_COOKIE_XML_DESCRIPTION","group":"","filename":"cookie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_yubikey","type":"plugin","creationDate":"September 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION","group":"","filename":"yubikey"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '{"name":"plg_search_tags","type":"plugin","creationDate":"March 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"search_limit":"50","show_tagged_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (en-GB)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.3","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (en-GB)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2015 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.3","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"December 2015","author":"Joomla! Project","copyright":"(C) 2005 - 2015 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.8","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 'French_fr-FR', 'language', 'fr-FR', '', 0, 1, 0, 0, '{"name":"French_fr-FR","type":"language","creationDate":"22\\/10\\/2015","author":"French translation team : joomla.fr","copyright":"Copyright (C) 2005 - 2015 Joomla.fr and Open Source Matters, Inc. All rights reserved.","authorEmail":"traduction@joomla.fr","authorUrl":"http:\\/\\/joomla.fr","version":"3.4.8.1","description":"fr-FR_site language","group":"","filename":"install"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10004, 'French_fr-FR', 'language', 'fr-FR', '', 1, 1, 0, 0, '{"name":"French_fr-FR","type":"language","creationDate":"22\\/10\\/2015","author":"French translation team : joomla.fr","copyright":"Copyright (C) 2005 - 2015 Joomla.fr and Open Source Matters, Inc. All rights reserved.","authorEmail":"traduction@joomla.fr","authorUrl":"http:\\/\\/joomla.fr","version":"3.4.8.1","description":"fr-FR_admin language","group":"","filename":"install"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10005, 'French_fr-FR', 'package', 'pkg_fr-FR', '', 0, 1, 1, 0, '{"name":"French_fr-FR","type":"package","creationDate":"22\\/10\\/2015","author":"French translation team : joomla.fr","copyright":"Copyright (C) 2005 - 2015 Joomla.fr and Open Source Matters, Inc. All rights reserved.","authorEmail":"traduction@joomla.fr","authorUrl":"http:\\/\\/joomla.fr","version":"3.4.8.1","description":"<div style=\\"text-align:left;\\">\\n\\n<h3>Joomla! 3.4.8 Full French (fr-FR) Language Package - Version 3.4.8.1<\\/h3>\\n\\n<h3>Paquet de langue Joomla! 3.4.8 fran\\u00e7ais (fr-FR) complet - Version 3.4.8.1<\\/h3>\\n\\n<\\/div>","group":"","filename":"pkg_fr-FR"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 'com_bim', 'component', 'com_bim', '', 1, 1, 0, 0, '{"name":"com_bim","type":"component","creationDate":"2016-02-11","author":"Paulo Andrade & Vaikunth Vijayaraghavan","copyright":"Copyright (C) 2016. All rights reserved.","authorEmail":"martinsp@uregina.ca","authorUrl":"https:\\/\\/www.behance.net\\/prma","version":"CVS: 1.0.0","description":"A system used to manage and to monitor the KPIs of one company with workflow.","group":"","filename":"bim"}', '{"admin":"11","responsible":"13","employee":"14","auditor":"12","from":"BIM System Reminder","email":"martinsp@uregina.ca","save_history":"1","history_limit":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10008, 'com_test', 'component', 'com_test', '', 1, 1, 0, 0, '{"name":"com_test","type":"component","creationDate":"2016-02-12","author":"Paulo Andrade","copyright":"Copyright (C) 2016. All rights reserved.","authorEmail":"martinsp@uregina.ca","authorUrl":"https:\\/\\/www.behance.net\\/prma","version":"CVS: 1.0.0","description":"Classes Test","group":"","filename":"test"}', '{"save_history":"0","history_limit":5}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_filters`
--

CREATE TABLE `cs872_finder_filters` (
  `filter_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links`
--

CREATE TABLE `cs872_finder_links` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double UNSIGNED NOT NULL DEFAULT '0',
  `sale_price` double UNSIGNED NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_terms0`
--

CREATE TABLE `cs872_finder_links_terms0` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_terms1`
--

CREATE TABLE `cs872_finder_links_terms1` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_terms2`
--

CREATE TABLE `cs872_finder_links_terms2` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_terms3`
--

CREATE TABLE `cs872_finder_links_terms3` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_terms4`
--

CREATE TABLE `cs872_finder_links_terms4` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_terms5`
--

CREATE TABLE `cs872_finder_links_terms5` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_terms6`
--

CREATE TABLE `cs872_finder_links_terms6` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_terms7`
--

CREATE TABLE `cs872_finder_links_terms7` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_terms8`
--

CREATE TABLE `cs872_finder_links_terms8` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_terms9`
--

CREATE TABLE `cs872_finder_links_terms9` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_termsa`
--

CREATE TABLE `cs872_finder_links_termsa` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_termsb`
--

CREATE TABLE `cs872_finder_links_termsb` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_termsc`
--

CREATE TABLE `cs872_finder_links_termsc` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_termsd`
--

CREATE TABLE `cs872_finder_links_termsd` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_termse`
--

CREATE TABLE `cs872_finder_links_termse` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_links_termsf`
--

CREATE TABLE `cs872_finder_links_termsf` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_taxonomy`
--

CREATE TABLE `cs872_finder_taxonomy` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `access` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_finder_taxonomy`
--

INSERT INTO `cs872_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_taxonomy_map`
--

CREATE TABLE `cs872_finder_taxonomy_map` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `node_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_terms`
--

CREATE TABLE `cs872_finder_terms` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float UNSIGNED NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_terms_common`
--

CREATE TABLE `cs872_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_finder_terms_common`
--

INSERT INTO `cs872_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_tokens`
--

CREATE TABLE `cs872_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float UNSIGNED NOT NULL DEFAULT '1',
  `context` tinyint(1) UNSIGNED NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_tokens_aggregate`
--

CREATE TABLE `cs872_finder_tokens_aggregate` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `phrase` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `term_weight` float UNSIGNED NOT NULL,
  `context` tinyint(1) UNSIGNED NOT NULL DEFAULT '2',
  `context_weight` float UNSIGNED NOT NULL,
  `total_weight` float UNSIGNED NOT NULL,
  `language` char(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_finder_types`
--

CREATE TABLE `cs872_finder_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_languages`
--

CREATE TABLE `cs872_languages` (
  `lang_id` int(11) UNSIGNED NOT NULL,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_languages`
--

INSERT INTO `cs872_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en_gb', '', '', '', '', 1, 1, 1),
(2, 'fr-FR', 'French (CA)', 'French (CA)', 'fr', 'fr_fr', '', '', '', 'BIM Système', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_menu`
--

CREATE TABLE `cs872_menu` (
  `id` int(11) NOT NULL,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_menu`
--

INSERT INTO `cs872_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 99, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 21, 30, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 22, 23, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 24, 25, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 26, 27, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 28, 29, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 31, 36, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 32, 33, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 34, 35, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 37, 42, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 38, 39, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 40, 41, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 43, 48, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 44, 45, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 46, 47, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 55, 56, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 53, 54, 0, '*', 1),
(21, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 51, 52, 0, '*', 1),
(22, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 49, 50, 0, '*', 1),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=article&id=6', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"0","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"0","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 1, 8, 1, 'en-GB', 0),
(102, 'mainmenu', 'About Us', 'about-us', '', 'about-us', 'index.php?option=com_content&view=article&id=2', 'component', -2, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"0","show_category":"0","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"0","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"0","show_item_navigation":"0","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"0","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 9, 10, 0, 'en-GB', 0),
(103, 'mainmenu', 'Dashboard', 'news', '', 'news', 'index.php?option=com_bim&view=dashboards', 'component', 1, 1, 1, 10007, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"0","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 11, 12, 0, 'en-GB', 0),
(104, 'mainmenu', 'Login', 'login', '', 'login', 'index.php?option=com_users&view=login', 'component', 1, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"login_redirect_url":"","logindescription_show":"1","login_description":"","login_image":"","logout_redirect_url":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"0","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 15, 16, 0, 'en-GB', 0),
(105, 'mainmenu', 'Edit Profile', 'edit-profile', '', 'edit-profile', 'index.php?option=com_users&view=profile&layout=edit', 'component', -2, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 2, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 17, 18, 0, 'en-GB', 0),
(106, 'mainmenu', 'Contact Us', 'contact-us', '', 'contact-us', 'index.php?option=com_contact&view=contact&id=1', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"presentation_style":"","show_contact_category":"","show_contact_list":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 13, 14, 0, 'en-GB', 0),
(107, 'mainmenu', 'Administrator', '2012-01-04-04-05-24', '', '2012-01-04-04-05-24', 'administrator', 'url', -2, 1, 1, 0, 0, '0000-00-00 00:00:00', 1, 3, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 57, 58, 0, 'en-GB', 0),
(109, 'mainmenu', 'Create an Article', 'create-an-article', '', 'create-an-article', 'index.php?option=com_content&view=form&layout=edit', 'component', -2, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 3, '', 0, '{"enable_category":"0","catid":"2","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 19, 20, 0, 'en-GB', 0),
(110, 'menu', 'com_tags', 'com-tags', '', 'com-tags', 'index.php?option=com_tags', 'component', 0, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 59, 60, 0, '', 1),
(111, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 0, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 61, 62, 0, '*', 1),
(112, 'mainmenu', 'Welcome', 'welcome', '', 'home/welcome', 'index.php?option=com_content&view=article&id=2', 'component', -2, 101, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"0","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 2, 3, 0, 'en-GB', 0),
(113, 'mainmenu', 'Template Settings', 'template-settings', '', 'home/template-settings', 'index.php?option=com_config&view=templates&controller=config.display.templates', 'component', -2, 101, 2, 23, 0, '0000-00-00 00:00:00', 0, 6, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 4, 5, 0, '*', 0),
(115, 'mainmenu', 'Bienvenue', 'bienvenue', '', 'home/bienvenue', 'index.php?option=com_content&view=article&id=2', 'component', -2, 101, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 6, 7, 0, 'en-GB', 0),
(116, 'main-fr', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=article&id=6', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"0","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"0","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 63, 70, 1, 'fr-FR', 0),
(117, 'main-fr', 'Welcome', 'welcome', '', 'home/welcome', 'index.php?option=com_content&view=article&id=2', 'component', -2, 116, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"0","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 64, 65, 0, 'fr-FR', 0),
(118, 'main-fr', 'Bienvenue', 'bienvenue', '', 'home/bienvenue', 'index.php?option=com_content&view=article&id=2', 'component', -2, 116, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_tags":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 66, 67, 0, 'fr-FR', 0),
(119, 'main-fr', 'About Us (2)', 'about-us-2', '', 'about-us-2', 'index.php?option=com_content&view=article&id=2', 'component', -2, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"0","show_category":"0","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"0","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"0","show_item_navigation":"0","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"0","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 71, 72, 0, 'fr-FR', 0),
(120, 'main-fr', 'News (2)', 'news-2', '', 'news-2', 'index.php?option=com_content&view=category&layout=blog&id=8', 'component', -2, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"layout_type":"blog","show_category_title":"","show_description":"1","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"1","num_intro_articles":"0","num_columns":"1","num_links":"3","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"published","show_pagination":"0","show_pagination_results":"0","show_title":"","link_titles":"","show_intro":"","show_category":"0","link_category":"","show_parent_category":"","link_parent_category":"","info_bloc_position":"0","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"0","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 73, 74, 0, 'fr-FR', 0),
(121, 'main-fr', 'Contact Us (2)', 'contact-us-2', '', 'contact-us-2', 'index.php?option=com_contact&view=contact&id=1', 'component', -2, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"presentation_style":"","show_contact_category":"","show_contact_list":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 75, 76, 0, 'fr-FR', 0),
(122, 'main-fr', 'Login (2)', 'login-2', '', 'login-2', 'index.php?option=com_users&view=login', 'component', -2, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 4, ' ', 0, '{"login_redirect_url":"","logindescription_show":"1","login_description":"","login_image":"","logout_redirect_url":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 77, 78, 0, 'fr-FR', 0),
(123, 'main-fr', 'Edit Profile (2)', 'edit-profile-2', '', 'edit-profile-2', 'index.php?option=com_users&view=profile&layout=edit', 'component', -2, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 2, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 79, 80, 0, 'fr-FR', 0),
(124, 'main-fr', 'Create an Article (2)', 'create-an-article-2', '', 'create-an-article-2', 'index.php?option=com_content&view=form&layout=edit', 'component', -2, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 3, ' ', 0, '{"enable_category":"0","catid":"2","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 81, 82, 0, 'fr-FR', 0),
(125, 'main-fr', 'Administrator (2)', '2012-01-04-04-05-25', '', '2012-01-04-04-05-25', 'administrator', 'url', -2, 1, 1, 0, 0, '0000-00-00 00:00:00', 1, 3, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 83, 84, 0, 'fr-FR', 0),
(126, 'main-fr', 'Template Settings', 'template-settings', '', 'home/template-settings', 'index.php?option=com_config&view=templates&controller=config.display.templates', 'component', -2, 116, 2, 23, 0, '0000-00-00 00:00:00', 0, 6, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 68, 69, 0, 'fr-FR', 0),
(137, 'main', 'COM_BIM', 'com-bim', '', 'com-bim', 'index.php?option=com_bim', 'component', 0, 1, 1, 10007, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_bim/images/s_com_bim.png', 0, '{}', 85, 86, 0, '', 1),
(146, 'main', 'COM_TEST', 'com-test', '', 'com-test', 'index.php?option=com_test', 'component', 0, 1, 1, 10008, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_test/images/s_com_test.png', 0, '{}', 87, 92, 0, '', 1),
(147, 'main', 'COM_TEST_TITLE_ITEMS', 'com-test-title-items', '', 'com-test/com-test-title-items', 'index.php?option=com_test&view=items', 'component', 0, 146, 2, 10008, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_test/images/s_items.png', 0, '{}', 88, 89, 0, '', 1),
(148, 'main', 'COM_TEST_ITEMS_CATEGORY', 'com-test-items-category', '', 'com-test/com-test-items-category', 'index.php?option=com_categories&extension=com_test', 'component', 0, 146, 2, 10008, 0, '0000-00-00 00:00:00', 0, 1, 'media/com_test/images/s_items.png', 0, '{}', 90, 91, 0, '', 1),
(149, 'main-fr', 'Tableau de bord', 'tableau-de-bord', '', 'tableau-de-bord', 'index.php?option=com_bim&view=dashboards', 'component', 1, 1, 1, 10007, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"0","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 93, 94, 0, 'fr-FR', 0),
(150, 'main-fr', 'Contactez nous', 'contactez-nous', '', 'contactez-nous', 'index.php?option=com_contact&view=contact&id=1', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"presentation_style":"","show_contact_category":"","show_contact_list":"","show_tags":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","articles_display_num":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"0","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 95, 96, 0, 'fr-FR', 0),
(151, 'main-fr', 'S''identifier', 's-identifier', '', 's-identifier', 'index.php?option=com_users&view=login', 'component', 1, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 1, ' ', 0, '{"login_redirect_url":"","logindescription_show":"1","login_description":"","login_image":"","logout_redirect_url":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"0","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 97, 98, 0, 'fr-FR', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_menu_types`
--

CREATE TABLE `cs872_menu_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_menu_types`
--

INSERT INTO `cs872_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(3, 'main-fr', 'Main-FR', '');

-- --------------------------------------------------------

--
-- Table structure for table `cs872_messages`
--

CREATE TABLE `cs872_messages` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `user_id_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id_to` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_messages_cfg`
--

CREATE TABLE `cs872_messages_cfg` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_modules`
--

CREATE TABLE `cs872_modules` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_modules`
--

INSERT INTO `cs872_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 0, 'Main Menu', '', '', 1, 'position-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":" nav-pills","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(2, 0, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 49, 'Popular Articles', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"6","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
(4, 50, 'Recently Added Articles', '', '', 1, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"6","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
(8, 0, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 0, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 48, 'Logged-in Users', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"6","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
(12, 0, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 0, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 0, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 0, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 0, 'Login Form', '', '', 2, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"pretext":"","posttext":"","login":"","logout":"","greeting":"1","name":"0","usesecure":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(17, 0, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"","showComponent":"1","separator":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(79, 0, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(80, 0, 'Search', '', '', -2, 'position-0', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_search', 1, 0, '{"label":"","width":"20","text":"","button":"","button_pos":"right","imagebutton":"","button_text":"","opensearch":"1","opensearch_title":"","set_itemid":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(82, 0, 'News Flash', '', '', 1, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_news', 1, 1, '{"catid":["8"],"image":"0","item_title":"1","link_titles":"1","item_heading":"h4","showLastSeparator":"0","readmore":"0","count":"5","ordering":"a.publish_up","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(83, 0, 'Side Module', '', '<p>This is a module where you might want to add some more information or an image,  a link to your social media presence, or whatever makes sense for your site.  </p><p>You can edit this module in the module manager. Look for the Side Module.</p>', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(86, 0, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 0, 'Footer', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_footer', 1, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(88, 52, 'Image', '', '<p><img src="images/headers/windows.jpg" alt="" /></p>', 1, 'position-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(89, 51, 'Site Information', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_stats_admin', 6, 1, '{"serverinfo":"1","siteinfo":"1","counter":"1","increase":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"6","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
(90, 53, 'Release News', '', '', 0, 'postinstall', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_feed', 1, 1, '{"rssurl":"http:\\/\\/www.joomla.org\\/announcements\\/release-news.feed","rssrtl":"0","rsstitle":"1","rssdesc":"1","rssimage":"1","rssitems":"3","rssitemdesc":"1","word_count":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
(91, 54, 'Language', '', '', 1, 'position-0', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_languages', 1, 1, '{"header_text":"","footer_text":"","dropdown":"0","image":"1","inline":"0","show_active":"1","full_name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(92, 72, 'Main Menu FR', '', '', 1, 'position-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"main-fr","base":"","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":" nav-pills","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `cs872_modules_menu`
--

CREATE TABLE `cs872_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_modules_menu`
--

INSERT INTO `cs872_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(80, 0),
(83, 0),
(85, 0),
(86, 0),
(88, 0),
(91, 0),
(92, 116),
(92, 149),
(92, 150),
(92, 151);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_newsfeeds`
--

CREATE TABLE `cs872_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `cache_time` int(10) UNSIGNED NOT NULL DEFAULT '3600',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `images` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_overrider`
--

CREATE TABLE `cs872_overrider` (
  `id` int(10) NOT NULL COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_postinstall_messages`
--

CREATE TABLE `cs872_postinstall_messages` (
  `postinstall_message_id` bigint(20) UNSIGNED NOT NULL,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) NOT NULL DEFAULT '',
  `language_extension` varchar(255) NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_postinstall_messages`
--

INSERT INTO `cs872_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 0),
(2, 700, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_redirect_links`
--

CREATE TABLE `cs872_redirect_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) DEFAULT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_schemas`
--

CREATE TABLE `cs872_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_schemas`
--

INSERT INTO `cs872_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.4.0-2015-02-26');

-- --------------------------------------------------------

--
-- Table structure for table `cs872_session`
--

CREATE TABLE `cs872_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `guest` tinyint(4) UNSIGNED DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_session`
--

INSERT INTO `cs872_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('c1gl14fps40qoeic2g7ljt6s31', 1, 0, '1457466059', 'joomla|s:14896:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTozMzM7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNDU3MzcxNTA5O3M6NDoibGFzdCI7aToxNDU3NDY2MDU0O3M6Mzoibm93IjtpOjE0NTc0NjYwNTk7fXM6NToidG9rZW4iO3M6MzI6IjcwNWEyNGZkMWE5Nzc1YmZlOTU0YTk2ZGI3ODgxZGE1Ijt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjg6e3M6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImxhbmciO3M6MDoiIjt9czoxMzoiY29tX2luc3RhbGxlciI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo3OiJtZXNzYWdlIjtzOjA6IiI7czoxNzoiZXh0ZW5zaW9uX21lc3NhZ2UiO3M6MDoiIjt9czoxMDoiY29tX2NvbmZpZyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo2OiJjb25maWciO086ODoic3RkQ2xhc3MiOjE6e3M6NjoiZ2xvYmFsIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6ImRhdGEiO2E6OTE6e3M6Nzoib2ZmbGluZSI7czoxOiIwIjtzOjE1OiJvZmZsaW5lX21lc3NhZ2UiO3M6Njk6IlRoaXMgc2l0ZSBpcyBkb3duIGZvciBtYWludGVuYW5jZS48YnIgLz5QbGVhc2UgY2hlY2sgYmFjayBhZ2FpbiBzb29uLiI7czoyMzoiZGlzcGxheV9vZmZsaW5lX21lc3NhZ2UiO3M6MToiMSI7czoxMzoib2ZmbGluZV9pbWFnZSI7czowOiIiO3M6ODoic2l0ZW5hbWUiO3M6MTA6IkJJTSBTeXN0ZW0iO3M6NjoiZWRpdG9yIjtzOjc6InRpbnltY2UiO3M6NzoiY2FwdGNoYSI7czoxOiIwIjtzOjEwOiJsaXN0X2xpbWl0IjtzOjI6IjIwIjtzOjY6ImFjY2VzcyI7czoxOiIxIjtzOjU6ImRlYnVnIjtzOjE6IjAiO3M6MTA6ImRlYnVnX2xhbmciO3M6MToiMCI7czo2OiJkYnR5cGUiO3M6NjoibXlzcWxpIjtzOjQ6Imhvc3QiO3M6OToibG9jYWxob3N0IjtzOjQ6InVzZXIiO3M6NDoicm9vdCI7czo4OiJwYXNzd29yZCI7czowOiIiO3M6MjoiZGIiO3M6MzoiYmltIjtzOjg6ImRicHJlZml4IjtzOjY6ImNzODcyXyI7czo5OiJsaXZlX3NpdGUiO3M6MDoiIjtzOjY6InNlY3JldCI7czoxNjoibmdFa0JwMjV1c1BkTmFaZCI7czo0OiJnemlwIjtzOjE6IjAiO3M6MTU6ImVycm9yX3JlcG9ydGluZyI7czo3OiJkZWZhdWx0IjtzOjc6ImhlbHB1cmwiO3M6OTA6Imh0dHBzOi8vaGVscC5qb29tbGEub3JnL3Byb3h5L2luZGV4LnBocD9vcHRpb249Y29tX2hlbHAma2V5cmVmPUhlbHB7bWFqb3J9e21pbm9yfTp7a2V5cmVmfSI7czo4OiJmdHBfaG9zdCI7czowOiIiO3M6ODoiZnRwX3BvcnQiO3M6MDoiIjtzOjg6ImZ0cF91c2VyIjtzOjA6IiI7czo4OiJmdHBfcGFzcyI7czowOiIiO3M6ODoiZnRwX3Jvb3QiO3M6MDoiIjtzOjEwOiJmdHBfZW5hYmxlIjtzOjE6IjAiO3M6Njoib2Zmc2V0IjtzOjM6IlVUQyI7czoxMDoibWFpbG9ubGluZSI7czoxOiIxIjtzOjY6Im1haWxlciI7czo0OiJzbXRwIjtzOjg6Im1haWxmcm9tIjtzOjE5OiJtYXJ0aW5zcEB1cmVnaW5hLmNhIjtzOjg6ImZyb21uYW1lIjtzOjEwOiJCSU0gU3lzdGVtIjtzOjg6InNlbmRtYWlsIjtzOjE4OiIvdXNyL3NiaW4vc2VuZG1haWwiO3M6ODoic210cGF1dGgiO3M6MToiMSI7czo4OiJzbXRwdXNlciI7czo4OiJtYXJ0aW5zcCI7czo4OiJzbXRwcGFzcyI7czo2OiIwMzA5ODUiO3M6ODoic210cGhvc3QiO3M6MTU6InNtdHAudXJlZ2luYS5jYSI7czoxMDoic210cHNlY3VyZSI7czo0OiJub25lIjtzOjg6InNtdHBwb3J0IjtzOjI6IjI1IjtzOjc6ImNhY2hpbmciO3M6MToiMCI7czoxMzoiY2FjaGVfaGFuZGxlciI7czo0OiJmaWxlIjtzOjk6ImNhY2hldGltZSI7czoyOiIxNSI7czo4OiJNZXRhRGVzYyI7czoxNDM6IlRoZSDigJxCdXNpbmVzcyBJbmRpY2F0b3IgTWFuYWdlbWVudOKAnSBvciDigJxCSU0gU3lzdGVt4oCdIGlzIGEgc29mdHdhcmUgdGhhdCB3aWxsIGhlbHAgeW91IHRvIG1hbmFnZXIgYW5kIHRvIG1vbml0b3IgdGhlIEtQSXMgb2YgeW91ciBjb21wYW55IjtzOjg6Ik1ldGFLZXlzIjtzOjA6IiI7czo5OiJNZXRhVGl0bGUiO3M6MToiMSI7czoxMDoiTWV0YUF1dGhvciI7czoxOiIxIjtzOjExOiJNZXRhVmVyc2lvbiI7czoxOiIwIjtzOjY6InJvYm90cyI7czowOiIiO3M6Mzoic2VmIjtzOjE6IjEiO3M6MTE6InNlZl9yZXdyaXRlIjtzOjE6IjAiO3M6MTA6InNlZl9zdWZmaXgiO3M6MToiMCI7czoxMjoidW5pY29kZXNsdWdzIjtzOjE6IjAiO3M6MTA6ImZlZWRfbGltaXQiO3M6MjoiMTAiO3M6ODoibG9nX3BhdGgiO3M6NDY6Ii9BcHBsaWNhdGlvbnMvWEFNUFAveGFtcHBmaWxlcy9odGRvY3MvYmltL2xvZ3MiO3M6ODoidG1wX3BhdGgiO3M6NDU6Ii9BcHBsaWNhdGlvbnMvWEFNUFAveGFtcHBmaWxlcy9odGRvY3MvYmltL3RtcCI7czo4OiJsaWZldGltZSI7czo0OiIxNTAwIjtzOjE1OiJzZXNzaW9uX2hhbmRsZXIiO3M6ODoiZGF0YWJhc2UiO3M6MTY6Im1lbWNhY2hlX3BlcnNpc3QiO3M6MToiMSI7czoxNzoibWVtY2FjaGVfY29tcHJlc3MiO3M6MToiMCI7czoyMDoibWVtY2FjaGVfc2VydmVyX2hvc3QiO3M6OToibG9jYWxob3N0IjtzOjIwOiJtZW1jYWNoZV9zZXJ2ZXJfcG9ydCI7czo1OiIxMTIxMSI7czoxNzoibWVtY2FjaGVkX3BlcnNpc3QiO3M6MToiMSI7czoxODoibWVtY2FjaGVkX2NvbXByZXNzIjtzOjE6IjAiO3M6MjE6Im1lbWNhY2hlZF9zZXJ2ZXJfaG9zdCI7czo5OiJsb2NhbGhvc3QiO3M6MjE6Im1lbWNhY2hlZF9zZXJ2ZXJfcG9ydCI7czo1OiIxMTIxMSI7czoxMzoicmVkaXNfcGVyc2lzdCI7czoxOiIxIjtzOjE3OiJyZWRpc19zZXJ2ZXJfaG9zdCI7czo5OiJsb2NhbGhvc3QiO3M6MTc6InJlZGlzX3NlcnZlcl9wb3J0IjtzOjQ6IjYzNzkiO3M6MTc6InJlZGlzX3NlcnZlcl9hdXRoIjtzOjA6IiI7czoxNToicmVkaXNfc2VydmVyX2RiIjtzOjE6IjAiO3M6MTI6InByb3h5X2VuYWJsZSI7czoxOiIwIjtzOjEwOiJwcm94eV9ob3N0IjtzOjA6IiI7czoxMDoicHJveHlfcG9ydCI7czowOiIiO3M6MTA6InByb3h5X3VzZXIiO3M6MDoiIjtzOjEwOiJwcm94eV9wYXNzIjtzOjA6IiI7czoxMToibWFzc21haWxvZmYiO3M6MToiMCI7czoxMDoiTWV0YVJpZ2h0cyI7czowOiIiO3M6MTk6InNpdGVuYW1lX3BhZ2V0aXRsZXMiO3M6MToiMCI7czo5OiJmb3JjZV9zc2wiO3M6MToiMCI7czoyODoic2Vzc2lvbl9tZW1jYWNoZV9zZXJ2ZXJfaG9zdCI7czo5OiJsb2NhbGhvc3QiO3M6Mjg6InNlc3Npb25fbWVtY2FjaGVfc2VydmVyX3BvcnQiO3M6NToiMTEyMTEiO3M6Mjk6InNlc3Npb25fbWVtY2FjaGVkX3NlcnZlcl9ob3N0IjtzOjk6ImxvY2FsaG9zdCI7czoyOToic2Vzc2lvbl9tZW1jYWNoZWRfc2VydmVyX3BvcnQiO3M6NToiMTEyMTEiO3M6MTI6ImZyb250ZWRpdGluZyI7czoxOiIxIjtzOjEwOiJmZWVkX2VtYWlsIjtzOjY6ImF1dGhvciI7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjA6IiI7czo4OiJhc3NldF9pZCI7aToxO3M6NzoiZmlsdGVycyI7YToxNzp7aToxO2E6Mzp7czoxMToiZmlsdGVyX3R5cGUiO3M6MjoiTkgiO3M6MTE6ImZpbHRlcl90YWdzIjtzOjA6IiI7czoxNzoiZmlsdGVyX2F0dHJpYnV0ZXMiO3M6MDoiIjt9aToxMDthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6IkJMIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6MTE7YTozOntzOjExOiJmaWx0ZXJfdHlwZSI7czoyOiJCTCI7czoxMToiZmlsdGVyX3RhZ3MiO3M6MDoiIjtzOjE3OiJmaWx0ZXJfYXR0cmlidXRlcyI7czowOiIiO31pOjEyO2E6Mzp7czoxMToiZmlsdGVyX3R5cGUiO3M6MjoiQkwiO3M6MTE6ImZpbHRlcl90YWdzIjtzOjA6IiI7czoxNzoiZmlsdGVyX2F0dHJpYnV0ZXMiO3M6MDoiIjt9aToxNDthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6IkJMIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6MTc7YTozOntzOjExOiJmaWx0ZXJfdHlwZSI7czoyOiJCTCI7czoxMToiZmlsdGVyX3RhZ3MiO3M6MDoiIjtzOjE3OiJmaWx0ZXJfYXR0cmlidXRlcyI7czowOiIiO31pOjE1O2E6Mzp7czoxMToiZmlsdGVyX3R5cGUiO3M6MjoiQkwiO3M6MTE6ImZpbHRlcl90YWdzIjtzOjA6IiI7czoxNzoiZmlsdGVyX2F0dHJpYnV0ZXMiO3M6MDoiIjt9aToxNjthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6IkJMIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6MTM7YTozOntzOjExOiJmaWx0ZXJfdHlwZSI7czoyOiJCTCI7czoxMToiZmlsdGVyX3RhZ3MiO3M6MDoiIjtzOjE3OiJmaWx0ZXJfYXR0cmlidXRlcyI7czowOiIiO31pOjk7YTozOntzOjExOiJmaWx0ZXJfdHlwZSI7czoyOiJCTCI7czoxMToiZmlsdGVyX3RhZ3MiO3M6MDoiIjtzOjE3OiJmaWx0ZXJfYXR0cmlidXRlcyI7czowOiIiO31pOjY7YTozOntzOjExOiJmaWx0ZXJfdHlwZSI7czoyOiJCTCI7czoxMToiZmlsdGVyX3RhZ3MiO3M6MDoiIjtzOjE3OiJmaWx0ZXJfYXR0cmlidXRlcyI7czowOiIiO31pOjc7YTozOntzOjExOiJmaWx0ZXJfdHlwZSI7czo0OiJOT05FIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6MjthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6Ik5IIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6MzthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6IkJMIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6NDthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6IkJMIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6NTthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6IkJMIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6ODthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjQ6Ik5PTkUiO3M6MTE6ImZpbHRlcl90YWdzIjtzOjA6IiI7czoxNzoiZmlsdGVyX2F0dHJpYnV0ZXMiO3M6MDoiIjt9fXM6NToicnVsZXMiO2E6MTA6e3M6MTU6ImNvcmUubG9naW4uc2l0ZSI7YToxNzp7aToxO3M6MDoiIjtpOjEwO3M6MToiMSI7aToxMTtzOjA6IiI7aToxMjtzOjA6IiI7aToxNDtzOjA6IiI7aToxNztzOjA6IiI7aToxNTtzOjA6IiI7aToxNjtzOjA6IiI7aToxMztzOjA6IiI7aTo5O3M6MDoiIjtpOjY7czoxOiIxIjtpOjc7czowOiIiO2k6MjtzOjE6IjEiO2k6MztzOjA6IiI7aTo0O3M6MDoiIjtpOjU7czowOiIiO2k6ODtzOjA6IiI7fXM6MTY6ImNvcmUubG9naW4uYWRtaW4iO2E6MTc6e2k6MTtzOjA6IiI7aToxMDtzOjE6IjEiO2k6MTE7czowOiIiO2k6MTI7czowOiIiO2k6MTQ7czowOiIiO2k6MTc7czowOiIiO2k6MTU7czowOiIiO2k6MTY7czowOiIiO2k6MTM7czowOiIiO2k6OTtzOjA6IiI7aTo2O3M6MToiMSI7aTo3O3M6MDoiIjtpOjI7czowOiIiO2k6MztzOjA6IiI7aTo0O3M6MDoiIjtpOjU7czowOiIiO2k6ODtzOjA6IiI7fXM6MTg6ImNvcmUubG9naW4ub2ZmbGluZSI7YToxNzp7aToxO3M6MDoiIjtpOjEwO3M6MDoiIjtpOjExO3M6MDoiIjtpOjEyO3M6MDoiIjtpOjE0O3M6MDoiIjtpOjE3O3M6MDoiIjtpOjE1O3M6MDoiIjtpOjE2O3M6MDoiIjtpOjEzO3M6MDoiIjtpOjk7czowOiIiO2k6NjtzOjE6IjEiO2k6NztzOjA6IiI7aToyO3M6MDoiIjtpOjM7czowOiIiO2k6NDtzOjA6IiI7aTo1O3M6MDoiIjtpOjg7czowOiIiO31zOjEwOiJjb3JlLmFkbWluIjthOjE3OntpOjE7czowOiIiO2k6MTA7czowOiIiO2k6MTE7czowOiIiO2k6MTI7czowOiIiO2k6MTQ7czowOiIiO2k6MTc7czowOiIiO2k6MTU7czowOiIiO2k6MTY7czowOiIiO2k6MTM7czowOiIiO2k6OTtzOjA6IiI7aTo2O3M6MDoiIjtpOjc7czowOiIiO2k6MjtzOjA6IiI7aTozO3M6MDoiIjtpOjQ7czowOiIiO2k6NTtzOjA6IiI7aTo4O3M6MToiMSI7fXM6MTE6ImNvcmUubWFuYWdlIjthOjE3OntpOjE7czowOiIiO2k6MTA7czowOiIiO2k6MTE7czowOiIiO2k6MTI7czowOiIiO2k6MTQ7czowOiIiO2k6MTc7czowOiIiO2k6MTU7czowOiIiO2k6MTY7czowOiIiO2k6MTM7czowOiIiO2k6OTtzOjA6IiI7aTo2O3M6MDoiIjtpOjc7czoxOiIxIjtpOjI7czowOiIiO2k6MztzOjA6IiI7aTo0O3M6MDoiIjtpOjU7czowOiIiO2k6ODtzOjA6IiI7fXM6MTE6ImNvcmUuY3JlYXRlIjthOjE3OntpOjE7czowOiIiO2k6MTA7czoxOiIxIjtpOjExO3M6MDoiIjtpOjEyO3M6MToiMCI7aToxNDtzOjA6IiI7aToxNztzOjA6IiI7aToxNTtzOjA6IiI7aToxNjtzOjA6IiI7aToxMztzOjA6IiI7aTo5O3M6MDoiIjtpOjY7czoxOiIxIjtpOjc7czowOiIiO2k6MjtzOjA6IiI7aTozO3M6MToiMSI7aTo0O3M6MDoiIjtpOjU7czowOiIiO2k6ODtzOjA6IiI7fXM6MTE6ImNvcmUuZGVsZXRlIjthOjE3OntpOjE7czowOiIiO2k6MTA7czoxOiIxIjtpOjExO3M6MDoiIjtpOjEyO3M6MToiMCI7aToxNDtzOjE6IjAiO2k6MTc7czowOiIiO2k6MTU7czowOiIiO2k6MTY7czowOiIiO2k6MTM7czowOiIiO2k6OTtzOjA6IiI7aTo2O3M6MToiMSI7aTo3O3M6MDoiIjtpOjI7czowOiIiO2k6MztzOjA6IiI7aTo0O3M6MDoiIjtpOjU7czowOiIiO2k6ODtzOjA6IiI7fXM6OToiY29yZS5lZGl0IjthOjE3OntpOjE7czowOiIiO2k6MTA7czoxOiIxIjtpOjExO3M6MDoiIjtpOjEyO3M6MToiMCI7aToxNDtzOjA6IiI7aToxNztzOjA6IiI7aToxNTtzOjA6IiI7aToxNjtzOjA6IiI7aToxMztzOjA6IiI7aTo5O3M6MDoiIjtpOjY7czoxOiIxIjtpOjc7czowOiIiO2k6MjtzOjA6IiI7aTozO3M6MDoiIjtpOjQ7czoxOiIxIjtpOjU7czowOiIiO2k6ODtzOjA6IiI7fXM6MTU6ImNvcmUuZWRpdC5zdGF0ZSI7YToxNzp7aToxO3M6MDoiIjtpOjEwO3M6MToiMSI7aToxMTtzOjA6IiI7aToxMjtzOjE6IjAiO2k6MTQ7czowOiIiO2k6MTc7czowOiIiO2k6MTU7czowOiIiO2k6MTY7czowOiIiO2k6MTM7czowOiIiO2k6OTtzOjA6IiI7aTo2O3M6MToiMSI7aTo3O3M6MDoiIjtpOjI7czowOiIiO2k6MztzOjA6IiI7aTo0O3M6MDoiIjtpOjU7czoxOiIxIjtpOjg7czowOiIiO31zOjEzOiJjb3JlLmVkaXQub3duIjthOjE3OntpOjE7czowOiIiO2k6MTA7czoxOiIxIjtpOjExO3M6MDoiIjtpOjEyO3M6MToiMCI7aToxNDtzOjA6IiI7aToxNztzOjA6IiI7aToxNTtzOjA6IiI7aToxNjtzOjA6IiI7aToxMztzOjA6IiI7aTo5O3M6MDoiIjtpOjY7czoxOiIxIjtpOjc7czowOiIiO2k6MjtzOjA6IiI7aTozO3M6MToiMSI7aTo0O3M6MDoiIjtpOjU7czowOiIiO2k6ODtzOjA6IiI7fX19fX19czo3OiJjb21fYmltIjtPOjg6InN0ZENsYXNzIjo3OntzOjc6ImRlZmF1bHQiO086ODoic3RkQ2xhc3MiOjE6e3M6ODoib3JkZXJjb2wiO3M6NzoiYS50aXRsZSI7fXM6ODoibWVldGluZ3MiO086ODoic3RkQ2xhc3MiOjE6e3M6ODoib3JkZXJjb2wiO3M6NzoiYS50aXRsZSI7fXM6NDoiZWRpdCI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJtZWV0aW5nIjtPOjg6InN0ZENsYXNzIjoyOntzOjI6ImlkIjthOjA6e31zOjQ6ImRhdGEiO047fXM6NDoiZ29hbCI7Tzo4OiJzdGRDbGFzcyI6Mjp7czoyOiJpZCI7YTowOnt9czo0OiJkYXRhIjtOO31zOjU6InZhbHVlIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImRhdGEiO047czoyOiJpZCI7YTowOnt9fX1zOjU6ImdvYWxzIjtPOjg6InN0ZENsYXNzIjo0OntzOjg6Im9yZGVyY29sIjtzOjU6ImEua3BpIjtzOjY6ImZpbHRlciI7Tzo4OiJzdGRDbGFzcyI6NDp7czo2OiJzZWFyY2giO3M6MDoiIjtzOjU6InN0YXRlIjtzOjA6IiI7czoxMDoiY3JlYXRlZF9ieSI7czoxOiIwIjtzOjM6ImtwaSI7czoxOiIwIjt9czo5OiJvcmRlcmRpcm4iO3M6MzoiYXNjIjtzOjEwOiJsaW1pdHN0YXJ0IjtzOjE6IjAiO31zOjY6ImF1ZGl0cyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo4OiJvcmRlcmNvbCI7czo0OiJhLmlkIjt9czo2OiJ2YWx1ZXMiO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoib3JkZXJjb2wiO3M6NzoiYS5ga3BpYCI7czo2OiJmaWx0ZXIiO086ODoic3RkQ2xhc3MiOjQ6e3M6Njoic2VhcmNoIjtzOjA6IiI7czo1OiJzdGF0ZSI7czowOiIiO3M6MTA6ImNyZWF0ZWRfYnkiO3M6MToiMCI7czozOiJrcGkiO3M6MToiMCI7fXM6OToib3JkZXJkaXJuIjtzOjM6ImFzYyI7czoxMDoibGltaXRzdGFydCI7czoxOiIwIjt9czo0OiJrcGlzIjtPOjg6InN0ZENsYXNzIjo0OntzOjg6Im9yZGVyY29sIjtzOjc6ImEudGl0bGUiO3M6NjoiZmlsdGVyIjtPOjg6InN0ZENsYXNzIjo3OntzOjY6InNlYXJjaCI7czowOiIiO3M6NToic3RhdGUiO3M6MDoiIjtzOjExOiJyZXNwb25zaWJsZSI7czoxOiIwIjtzOjQ6InVuaXQiO3M6MToiMCI7czo4OiJjYXRlZ29yeSI7czowOiIiO3M6NDoidHlwZSI7czowOiIiO3M6MTE6InBlcmlvZGljaXR5IjtzOjA6IiI7fXM6OToib3JkZXJkaXJuIjtzOjM6ImFzYyI7czoxMDoibGltaXRzdGFydCI7czoxOiIwIjt9fXM6NjoiZ2xvYmFsIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6Imxpc3QiO086ODoic3RkQ2xhc3MiOjE6e3M6NToibGltaXQiO2k6MjU7fX1zOjExOiJjb21fbW9kdWxlcyI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo3OiJtb2R1bGVzIjtPOjg6InN0ZENsYXNzIjo0OntzOjY6ImZpbHRlciI7Tzo4OiJzdGRDbGFzcyI6ODp7czoxODoiY2xpZW50X2lkX3ByZXZpb3VzIjtpOjA7czo2OiJzZWFyY2giO3M6NDoibWVudSI7czo2OiJhY2Nlc3MiO2k6MDtzOjU6InN0YXRlIjtzOjA6IiI7czo4OiJwb3NpdGlvbiI7czowOiIiO3M6NjoibW9kdWxlIjtzOjA6IiI7czo5OiJjbGllbnRfaWQiO2k6MDtzOjg6Imxhbmd1YWdlIjtzOjA6IiI7fXM6ODoib3JkZXJjb2wiO3M6ODoicG9zaXRpb24iO3M6OToib3JkZXJkaXJuIjtzOjM6ImFzYyI7czoxMDoibGltaXRzdGFydCI7aTowO31zOjQ6ImVkaXQiO086ODoic3RkQ2xhc3MiOjE6e3M6NjoibW9kdWxlIjtPOjg6InN0ZENsYXNzIjoyOntzOjI6ImlkIjthOjA6e31zOjQ6ImRhdGEiO047fX1zOjM6ImFkZCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo2OiJtb2R1bGUiO086ODoic3RkQ2xhc3MiOjI6e3M6MTI6ImV4dGVuc2lvbl9pZCI7TjtzOjY6InBhcmFtcyI7Tjt9fX1zOjk6ImNvbV9tZW51cyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo1OiJpdGVtcyI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo4OiJtZW51dHlwZSI7czo3OiJtYWluLWZyIjtzOjEwOiJsaW1pdHN0YXJ0IjtpOjA7czo0OiJsaXN0IjthOjQ6e3M6OToiZGlyZWN0aW9uIjtzOjM6ImFzYyI7czo1OiJsaW1pdCI7aToyMDtzOjg6Im9yZGVyaW5nIjtzOjU6ImEubGZ0IjtzOjU6InN0YXJ0IjtkOjA7fX1zOjQ6ImVkaXQiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiaXRlbSI7Tzo4OiJzdGRDbGFzcyI6NDp7czoyOiJpZCI7YTowOnt9czo0OiJkYXRhIjtOO3M6NDoidHlwZSI7TjtzOjQ6ImxpbmsiO047fX19czo5OiJjb21fdXNlcnMiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZWRpdCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1c2VyIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImRhdGEiO047czoyOiJpZCI7YTowOnt9fX19fXM6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjI4OntzOjk6IgAqAGlzUm9vdCI7YjoxO3M6MjoiaWQiO3M6MzoiNzYyIjtzOjQ6Im5hbWUiO3M6MTM6IkFkbWluaXN0cmF0b3IiO3M6ODoidXNlcm5hbWUiO3M6MTA6InN1cGVyYWRtaW4iO3M6NToiZW1haWwiO3M6MTk6Im1hcnRpbnNwQHVyZWdpbmEuY2EiO3M6ODoicGFzc3dvcmQiO3M6NjA6IiQyeSQxMCRDeEFIMVE1VnZ6d0lBY1RDUi5TUlNlUVlYZnRYWDd2YkF4UWZTTjJVUElOdkpLRTdaTUhvSyI7czoxNDoicGFzc3dvcmRfY2xlYXIiO3M6MDoiIjtzOjU6ImJsb2NrIjtzOjE6IjAiO3M6OToic2VuZEVtYWlsIjtzOjE6IjEiO3M6MTI6InJlZ2lzdGVyRGF0ZSI7czoxOToiMjAxNi0wMS0yOSAwMDo0MTo0MSI7czoxMzoibGFzdHZpc2l0RGF0ZSI7czoxOToiMjAxNi0wMy0wNyAxNzowNTo0NCI7czoxMDoiYWN0aXZhdGlvbiI7czoxOiIwIjtzOjY6InBhcmFtcyI7czo5MjoieyJhZG1pbl9zdHlsZSI6IiIsImFkbWluX2xhbmd1YWdlIjoiIiwibGFuZ3VhZ2UiOiIiLCJlZGl0b3IiOiIiLCJoZWxwc2l0ZSI6IiIsInRpbWV6b25lIjoiIn0iO3M6NjoiZ3JvdXBzIjthOjE6e2k6ODtzOjE6IjgiO31zOjU6Imd1ZXN0IjtpOjA7czoxMzoibGFzdFJlc2V0VGltZSI7czoxOToiMDAwMC0wMC0wMCAwMDowMDowMCI7czoxMDoicmVzZXRDb3VudCI7czoxOiIwIjtzOjEyOiJyZXF1aXJlUmVzZXQiO3M6MToiMCI7czoxMDoiACoAX3BhcmFtcyI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjY6e3M6MTE6ImFkbWluX3N0eWxlIjtzOjA6IiI7czoxNDoiYWRtaW5fbGFuZ3VhZ2UiO3M6MDoiIjtzOjg6Imxhbmd1YWdlIjtzOjA6IiI7czo2OiJlZGl0b3IiO3M6MDoiIjtzOjg6ImhlbHBzaXRlIjtzOjA6IiI7czo4OiJ0aW1lem9uZSI7czowOiIiO31zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czoxNDoiACoAX2F1dGhHcm91cHMiO2E6Mjp7aTowO2k6MTtpOjE7aTo4O31zOjE0OiIAKgBfYXV0aExldmVscyI7YTo1OntpOjA7aToxO2k6MTtpOjE7aToyO2k6MjtpOjM7aTozO2k6NDtpOjY7fXM6MTU6IgAqAF9hdXRoQWN0aW9ucyI7TjtzOjEyOiIAKgBfZXJyb3JNc2ciO047czoxMzoiACoAdXNlckhlbHBlciI7TzoxODoiSlVzZXJXcmFwcGVySGVscGVyIjowOnt9czoxMDoiACoAX2Vycm9ycyI7YTowOnt9czozOiJhaWQiO2k6MDtzOjY6Im90cEtleSI7czowOiIiO3M6NDoib3RlcCI7czowOiIiO31zOjExOiJhcHBsaWNhdGlvbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJxdWV1ZSI7Tjt9fX1zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 762, 'superadmin'),
('h328g2uh5epkrc9e73nbe4u9c4', 1, 0, '1457464826', 'joomla|s:2576:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aTo1O3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTQ1NzQ2NDQ1OTtzOjQ6Imxhc3QiO2k6MTQ1NzQ2NDc5MjtzOjM6Im5vdyI7aToxNDU3NDY0ODI1O31zOjU6InRva2VuIjtzOjMyOiJlMTA2NDc4M2IyMWZmMGE5ZjdkN2MwNjdhODJlYzU0YyI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mjp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjoyOntzOjExOiJhcHBsaWNhdGlvbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJsYW5nIjtzOjA6IiI7fXM6NzoiY29tX2JpbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo3OiJkZWZhdWx0IjtPOjg6InN0ZENsYXNzIjoxOntzOjg6Im9yZGVyY29sIjtzOjc6ImEudGl0bGUiO31zOjQ6ImtwaXMiO086ODoic3RkQ2xhc3MiOjE6e3M6ODoib3JkZXJjb2wiO3M6NzoiYS50aXRsZSI7fX19czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7Tzo1OiJKVXNlciI6Mjg6e3M6OToiACoAaXNSb290IjtiOjA7czoyOiJpZCI7czozOiI3NjUiO3M6NDoibmFtZSI7czoxMzoiUGF1bG8gQW5kcmFkZSI7czo4OiJ1c2VybmFtZSI7czo1OiJwYXVsbyI7czo1OiJlbWFpbCI7czoxOToicGF1bG84NWJyQGdtYWlsLmNvbSI7czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEwJGk0MDNSNDVHRVZQSHRlWmtBZVVLaE9KQjNyby5LQm5DVjdYZEhJTi5oUHltLjhuTHZEQnZPIjtzOjE0OiJwYXNzd29yZF9jbGVhciI7czowOiIiO3M6NToiYmxvY2siO3M6MToiMCI7czo5OiJzZW5kRW1haWwiO3M6MToiMCI7czoxMjoicmVnaXN0ZXJEYXRlIjtzOjE5OiIyMDE2LTAzLTAzIDE4OjEyOjAwIjtzOjEzOiJsYXN0dmlzaXREYXRlIjtzOjE5OiIwMDAwLTAwLTAwIDAwOjAwOjAwIjtzOjEwOiJhY3RpdmF0aW9uIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6OTI6InsiYWRtaW5fc3R5bGUiOiIiLCJhZG1pbl9sYW5ndWFnZSI6IiIsImxhbmd1YWdlIjoiIiwiZWRpdG9yIjoiIiwiaGVscHNpdGUiOiIiLCJ0aW1lem9uZSI6IiJ9IjtzOjY6Imdyb3VwcyI7YTozOntpOjI7czoxOiIyIjtpOjEwO3M6MjoiMTAiO2k6MTM7czoyOiIxMyI7fXM6NToiZ3Vlc3QiO2k6MDtzOjEzOiJsYXN0UmVzZXRUaW1lIjtzOjE5OiIwMDAwLTAwLTAwIDAwOjAwOjAwIjtzOjEwOiJyZXNldENvdW50IjtzOjE6IjAiO3M6MTI6InJlcXVpcmVSZXNldCI7czoxOiIwIjtzOjEwOiIAKgBfcGFyYW1zIjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjI6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6Njp7czoxMToiYWRtaW5fc3R5bGUiO3M6MDoiIjtzOjE0OiJhZG1pbl9sYW5ndWFnZSI7czowOiIiO3M6ODoibGFuZ3VhZ2UiO3M6MDoiIjtzOjY6ImVkaXRvciI7czowOiIiO3M6ODoiaGVscHNpdGUiO3M6MDoiIjtzOjg6InRpbWV6b25lIjtzOjA6IiI7fXM6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjE0OiIAKgBfYXV0aEdyb3VwcyI7YTo0OntpOjA7aToxO2k6MTtpOjI7aTozO2k6MTA7aTo2O2k6MTM7fXM6MTQ6IgAqAF9hdXRoTGV2ZWxzIjthOjQ6e2k6MDtpOjE7aToxO2k6MTtpOjI7aToyO2k6MztpOjM7fXM6MTU6IgAqAF9hdXRoQWN0aW9ucyI7TjtzOjEyOiIAKgBfZXJyb3JNc2ciO047czoxMzoiACoAdXNlckhlbHBlciI7TzoxODoiSlVzZXJXcmFwcGVySGVscGVyIjowOnt9czoxMDoiACoAX2Vycm9ycyI7YTowOnt9czozOiJhaWQiO2k6MDtzOjY6Im90cEtleSI7czowOiIiO3M6NDoib3RlcCI7czowOiIiO319fXM6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=";', 765, 'paulo'),
('ogcchae1946dsuo7n0l7ctnri4', 0, 1, '1457464457', 'joomla|s:1452:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTQ1NzQ2NDQ1NztzOjQ6Imxhc3QiO2k6MTQ1NzQ2NDQ1NztzOjM6Im5vdyI7aToxNDU3NDY0NDU3O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjU6IkpVc2VyIjoyNjp7czo5OiIAKgBpc1Jvb3QiO047czoyOiJpZCI7aTowO3M6NDoibmFtZSI7TjtzOjg6InVzZXJuYW1lIjtOO3M6NToiZW1haWwiO047czo4OiJwYXNzd29yZCI7TjtzOjE0OiJwYXNzd29yZF9jbGVhciI7czowOiIiO3M6NToiYmxvY2siO047czo5OiJzZW5kRW1haWwiO2k6MDtzOjEyOiJyZWdpc3RlckRhdGUiO047czoxMzoibGFzdHZpc2l0RGF0ZSI7TjtzOjEwOiJhY3RpdmF0aW9uIjtOO3M6NjoicGFyYW1zIjtOO3M6NjoiZ3JvdXBzIjthOjE6e2k6MDtzOjE6IjkiO31zOjU6Imd1ZXN0IjtpOjE7czoxMzoibGFzdFJlc2V0VGltZSI7TjtzOjEwOiJyZXNldENvdW50IjtOO3M6MTI6InJlcXVpcmVSZXNldCI7TjtzOjEwOiIAKgBfcGFyYW1zIjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjI6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6MDp7fXM6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjE0OiIAKgBfYXV0aEdyb3VwcyI7TjtzOjE0OiIAKgBfYXV0aExldmVscyI7YTozOntpOjA7aToxO2k6MTtpOjE7aToyO2k6NTt9czoxNToiACoAX2F1dGhBY3Rpb25zIjtOO3M6MTI6IgAqAF9lcnJvck1zZyI7TjtzOjEzOiIAKgB1c2VySGVscGVyIjtPOjE4OiJKVXNlcldyYXBwZXJIZWxwZXIiOjA6e31zOjEwOiIAKgBfZXJyb3JzIjthOjA6e31zOjM6ImFpZCI7aTowO319fXM6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=";', 0, ''),
('qe4ff5bpj2smcad18hrpan0ms7', 0, 1, '1457464456', 'joomla|s:1812:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToxO3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTQ1NzQ2NDQ1NjtzOjQ6Imxhc3QiO2k6MTQ1NzQ2NDQ1NjtzOjM6Im5vdyI7aToxNDU3NDY0NDU2O31zOjU6InRva2VuIjtzOjMyOiI2MGMyMzNjMWI4M2NmYzgwMjI1ZjQ0Mjk1NTU5ZTdhNSI7fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mjp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fXM6NDoidXNlciI7Tzo1OiJKVXNlciI6MjY6e3M6OToiACoAaXNSb290IjtiOjA7czoyOiJpZCI7aTowO3M6NDoibmFtZSI7TjtzOjg6InVzZXJuYW1lIjtOO3M6NToiZW1haWwiO047czo4OiJwYXNzd29yZCI7TjtzOjE0OiJwYXNzd29yZF9jbGVhciI7czowOiIiO3M6NToiYmxvY2siO047czo5OiJzZW5kRW1haWwiO2k6MDtzOjEyOiJyZWdpc3RlckRhdGUiO047czoxMzoibGFzdHZpc2l0RGF0ZSI7TjtzOjEwOiJhY3RpdmF0aW9uIjtOO3M6NjoicGFyYW1zIjtOO3M6NjoiZ3JvdXBzIjthOjE6e2k6MDtzOjE6IjkiO31zOjU6Imd1ZXN0IjtpOjE7czoxMzoibGFzdFJlc2V0VGltZSI7TjtzOjEwOiJyZXNldENvdW50IjtOO3M6MTI6InJlcXVpcmVSZXNldCI7TjtzOjEwOiIAKgBfcGFyYW1zIjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjI6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6MDp7fXM6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjE0OiIAKgBfYXV0aEdyb3VwcyI7YToyOntpOjA7aToxO2k6MTtpOjk7fXM6MTQ6IgAqAF9hdXRoTGV2ZWxzIjthOjM6e2k6MDtpOjE7aToxO2k6MTtpOjI7aTo1O31zOjE1OiIAKgBfYXV0aEFjdGlvbnMiO047czoxMjoiACoAX2Vycm9yTXNnIjtOO3M6MTM6IgAqAHVzZXJIZWxwZXIiO086MTg6IkpVc2VyV3JhcHBlckhlbHBlciI6MDp7fXM6MTA6IgAqAF9lcnJvcnMiO2E6MDp7fXM6MzoiYWlkIjtpOjA7fXM6MTA6ImNvbV9tYWlsdG8iO086ODoic3RkQ2xhc3MiOjE6e3M6NToibGlua3MiO2E6MTp7czo0MDoiZTRmY2E1YjNmMmQ2ZTZmOGExMmEwYmYzMWM0Mjk3NDc3YjkyNjJhNyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJsaW5rIjtzOjMwOiJodHRwOi8vbG9jYWxob3N0L2JpbS9pbmRleC5waHAiO3M6NjoiZXhwaXJ5IjtpOjE0NTc0NjQ0NTY7fX19fX1zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 0, ''),
('qjratevg8sunhgc0cinf33nj75', 0, 1, '1457403694', 'joomla|s:2008:"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToyMztzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjozOntzOjU6InN0YXJ0IjtpOjE0NTczNzQ5MzU7czo0OiJsYXN0IjtpOjE0NTc0MDAxMDc7czozOiJub3ciO2k6MTQ1NzQwMzY5NDt9czo1OiJ0b2tlbiI7czozMjoiN2E0ODJkMmY5YjEwZWVhZmVhNDU1NTBlMWMzNzIzOWEiO31zOjg6InJlZ2lzdHJ5IjtPOjI0OiJKb29tbGFcUmVnaXN0cnlcUmVnaXN0cnkiOjI6e3M6NzoiACoAZGF0YSI7Tzo4OiJzdGRDbGFzcyI6MDp7fXM6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjI2OntzOjk6IgAqAGlzUm9vdCI7YjowO3M6MjoiaWQiO2k6MDtzOjQ6Im5hbWUiO047czo4OiJ1c2VybmFtZSI7TjtzOjU6ImVtYWlsIjtOO3M6ODoicGFzc3dvcmQiO047czoxNDoicGFzc3dvcmRfY2xlYXIiO3M6MDoiIjtzOjU6ImJsb2NrIjtOO3M6OToic2VuZEVtYWlsIjtpOjA7czoxMjoicmVnaXN0ZXJEYXRlIjtOO3M6MTM6Imxhc3R2aXNpdERhdGUiO047czoxMDoiYWN0aXZhdGlvbiI7TjtzOjY6InBhcmFtcyI7TjtzOjY6Imdyb3VwcyI7YToxOntpOjA7czoxOiI5Ijt9czo1OiJndWVzdCI7aToxO3M6MTM6Imxhc3RSZXNldFRpbWUiO047czoxMDoicmVzZXRDb3VudCI7TjtzOjEyOiJyZXF1aXJlUmVzZXQiO047czoxMDoiACoAX3BhcmFtcyI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czoxNDoiACoAX2F1dGhHcm91cHMiO2E6Mjp7aTowO2k6MTtpOjE7aTo5O31zOjE0OiIAKgBfYXV0aExldmVscyI7YTozOntpOjA7aToxO2k6MTtpOjE7aToyO2k6NTt9czoxNToiACoAX2F1dGhBY3Rpb25zIjtOO3M6MTI6IgAqAF9lcnJvck1zZyI7TjtzOjEzOiIAKgB1c2VySGVscGVyIjtPOjE4OiJKVXNlcldyYXBwZXJIZWxwZXIiOjA6e31zOjEwOiIAKgBfZXJyb3JzIjthOjA6e31zOjM6ImFpZCI7aTowO31zOjEwOiJjb21fbWFpbHRvIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6ImxpbmtzIjthOjI6e3M6NDA6ImU0ZmNhNWIzZjJkNmU2ZjhhMTJhMGJmMzFjNDI5NzQ3N2I5MjYyYTciO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibGluayI7czozMDoiaHR0cDovL2xvY2FsaG9zdC9iaW0vaW5kZXgucGhwIjtzOjY6ImV4cGlyeSI7aToxNDU3Mzc1Nzk5O31zOjQwOiJhMWFkYWZmM2M4MjE2YzFhZTUwM2JhOGQ4ZjY0ZGYzODEzMjRiZTgyIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImxpbmsiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3QvYmltL2luZGV4LnBocC9mci8iO3M6NjoiZXhwaXJ5IjtpOjE0NTczNzU1Mzg7fX19fX1zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9";', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `cs872_tags`
--

CREATE TABLE `cs872_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_tags`
--

INSERT INTO `cs872_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 762, '2011-01-01 00:00:01', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cs872_template_styles`
--

CREATE TABLE `cs872_template_styles` (
  `id` int(10) UNSIGNED NOT NULL,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_template_styles`
--

INSERT INTO `cs872_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.png","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '1', 'My Default Style (Protostar)', '{"templateColor":"#696969","templateBackgroundColor":"#E3E3E3","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"#000000","logoFile":"","admin_menus":1,"displayHeader":1,"statusFixed":1,"stickyToolbar":1}');

-- --------------------------------------------------------

--
-- Table structure for table `cs872_test_item`
--

CREATE TABLE `cs872_test_item` (
  `id` int(11) UNSIGNED NOT NULL,
  `ordering` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_ucm_base`
--

CREATE TABLE `cs872_ucm_base` (
  `ucm_id` int(10) UNSIGNED NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_ucm_content`
--

CREATE TABLE `cs872_ucm_content` (
  `core_content_id` int(10) UNSIGNED NOT NULL,
  `core_type_alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(255) NOT NULL,
  `core_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_version` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains core content data in name spaced fields';

-- --------------------------------------------------------

--
-- Table structure for table `cs872_ucm_history`
--

CREATE TABLE `cs872_ucm_history` (
  `version_id` int(10) UNSIGNED NOT NULL,
  `ucm_item_id` int(10) UNSIGNED NOT NULL,
  `ucm_type_id` int(10) UNSIGNED NOT NULL,
  `version_note` varchar(255) NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `character_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_ucm_history`
--

INSERT INTO `cs872_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(1, 6, 1, '', '2016-02-11 06:28:53', 762, 3491, '3ed045c6ef4af3d4d2801df8f616c0688506e759', '{"id":6,"asset_id":"40","title":"Creating Your Site","alias":"creating-your-site","introtext":"<p>Joomla! is all about allowing you to create a site that matches your vision. The possibilities are limitless; this sample site will get you started.<\\/p>\\r\\n<p>There are a few things you should know to get you started. A<\\/p>\\r\\n<p>Every Joomla! Web site has two parts: the Site (which is what your site visitors see) and the Administrator (which is where you will do a lot of the site management). You need to log in to the Administrator separately with the same username and password. There is a link to the administrator on the top menu that you will see when you log in.<\\/p>\\r\\n<p>You can edit articles in the Site by clicking on the edit icon. You can create a new article by clicking on the Create Article link in the top menu.<\\/p>\\r\\n<p>To do basic changes to the appearance your site click Home, Site Settings and Home, Template Settings.<\\/p>\\r\\n<p>To do more advanced things, like edit the contact form, manage users, or install a new template or extension, login to the Administrator.<\\/p>\\r\\n<p>Some quick tips for working in the Administrator<\\/p>\\r\\n<ul>\\r\\n<li>To change the image on all the pages: Go to the Module Manager and click on Image Module.<\\/li>\\r\\n<li>To edit the Side Module: Go to Extensions, Module Manager and click on Side Module.<\\/li>\\r\\n<li>To edit the Contact Form: Go to Components, Contacts. Click on Your Name.<\\/li>\\r\\n<\\/ul>\\r\\n<p>Once you have your basic site you may want to install your own template (that controls the overall design of your site) and then, perhaps additional extensions.<\\/p>\\r\\n<p>There is a lot of help available for Joomla!. You can visit the <a href=\\"http:\\/\\/forum.joomla.org\\">Joomla! forums<\\/a> and the<a href=\\"https:\\/\\/docs.joomla.org\\" target=\\"_blank\\"> Joomla! documentation site<\\/a> to get started.<\\/p>","fulltext":"","state":1,"catid":"2","created":"2011-01-01 00:00:01","created_by":"762","created_by_alias":"Joomla","modified":"2016-02-11 06:28:53","modified_by":"762","checked_out":"762","checked_out_time":"2016-02-11 06:28:38","publish_up":"2012-01-04 04:27:11","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"0\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":9,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"221","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(4, 1, 15, '', '2016-02-12 00:06:28', 762, 391, '335d89c9920516072a668efc3ea52215e27ed5bd', '{"id":1,"ordering":1,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-02-12 00:06:28","created_by":"762","modified":"2016-02-12 00:06:28","modified_by":"762","title":"Teste","alias":"teste","title_fr":"","alias_fr":"2016-02-11-18-06-28","objective":"","responsible":"762","unit":"3","category":"12","type":"percentual","increase":"1","periodicity":"1","color":"000000"}', 0),
(5, 1, 15, '', '2016-02-12 00:08:56', 762, 400, '3ef2f0950ab4b898f1a25beb792afbca5ee41d7f', '{"id":1,"ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-02-12 00:06:36","created":"2016-02-12 00:06:28","created_by":"762","modified":"2016-02-12 00:08:56","modified_by":"762","title":"Test","alias":"test","title_fr":"Teste","alias_fr":"teste","objective":"","responsible":"762","unit":"3","category":"12","type":"percentual","increase":"1","periodicity":"1","color":"000000"}', 0),
(6, 1, 21, '', '2016-02-12 02:34:44', 762, 250, '2ae3880b0c1eaa6b0eeb71c4199556bc363da4ca', '{"id":1,"ordering":1,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-02-12 02:34:44","created_by":"762","modified":"2016-02-12 02:34:34","modified_by":"762","title":"Corporate","alias":"corporate","parent_id":"","version":null}', 0),
(7, 2, 21, '', '2016-02-12 02:35:13', 762, 248, '6c4f3b707a5b3ea66e7e5999c94a125d4df772c8', '{"id":2,"ordering":2,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-02-12 02:35:13","created_by":"762","modified":"2016-02-12 02:35:13","modified_by":"762","title":"Sectoral","alias":"sectoral","parent_id":"","version":null}', 0),
(8, 1, 21, '', '2016-02-12 02:37:48', 762, 269, 'cb627c3cc57a2803f9f1fa7b4cb979a149f7ab50', '{"id":1,"ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-02-12 02:36:13","created":"2016-02-12 02:34:44","created_by":"762","modified":"2016-02-12 02:37:48","modified_by":"762","title":"Corporate","alias":"corporate","parent_id":"","version":"1"}', 0),
(9, 1, 15, '', '2016-02-25 15:12:35', 762, 383, 'af6cd6e9e604a2ad6e6d729ae9ebec262b1290d8', '{"id":1,"ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-02-25 15:04:59","created":"2016-02-12 00:06:28","created_by":"762","modified":"2016-02-25 15:12:35","modified_by":"762","title":"Test","alias":"test","title_fr":"Teste","alias_fr":"teste","responsible":"762","unit":"16","category":"1","type":"percentual","increase":"1","periodicity":"1","color":"blue"}', 0),
(10, 1, 15, '', '2016-03-03 18:09:37', 762, 534, '6c563ad119f6bf7977f24843b748fa1ebd9a3d81', '{"id":1,"ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 18:07:49","created":"2016-02-12 00:06:28","created_by":"762","modified":"2016-03-03 18:09:37","modified_by":"762","title":"Services attended before the deadline","alias":"services-attended-before-the-deadline","title_fr":"Les services ont assist\\u00e9 avant la date limite","alias_fr":"les-services-ont-assiste-avant-la-date-limite","responsible":"762","unit":"17","category":"1","type":"percentual","increase":"1","periodicity":"1","color":"blue"}', 0),
(11, 1, 15, '', '2016-03-03 18:14:48', 762, 534, 'a624557a384f10d286c18a7ef11912309bb00004', '{"id":1,"ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 18:14:33","created":"2016-02-12 00:06:28","created_by":"762","modified":"2016-03-03 18:14:48","modified_by":"762","title":"Services attended before the deadline","alias":"services-attended-before-the-deadline","title_fr":"Les services ont assist\\u00e9 avant la date limite","alias_fr":"les-services-ont-assiste-avant-la-date-limite","responsible":"766","unit":"17","category":"1","type":"percentual","increase":"1","periodicity":"1","color":"blue"}', 0),
(12, 2, 15, '', '2016-03-03 18:15:48', 762, 434, 'a49244fc41acd620aabcfd1266b23f583733fe5a', '{"id":2,"ordering":2,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-03 18:15:48","created_by":762,"modified":"2016-03-03 18:14:54","modified_by":762,"title":"Client Satisfaction","alias":"client-satisfaction","title_fr":"La satisfaction des clients","alias_fr":"la-satisfaction-des-clients","responsible":"765","unit":"15","category":"1","type":"percentual","increase":"1","periodicity":"1","color":"green"}', 0),
(13, 3, 15, '', '2016-03-03 18:16:58', 762, 456, '0573bd6acd83c959d51f4de69856cff4fd7362ee', '{"id":3,"ordering":3,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-03 18:16:58","created_by":762,"modified":"2016-03-03 18:16:58","modified_by":762,"title":"Sales volume of two months","alias":"sales-volume-of-two-months","title_fr":"Le volume des ventes de deux mois","alias_fr":"le-volume-des-ventes-de-deux-mois","responsible":"765","unit":"16","category":"1","type":"currency","increase":"1","periodicity":"2","color":"red"}', 0),
(14, 1, 18, '', '2016-03-03 18:36:40', 762, 760, '1c286d237d1f9fefe50933fbe71bd4863f91d433', '{"id":1,"asset_id":65,"ordering":1,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-03 18:36:40","created_by":762,"modified":"2016-03-03 18:34:50","modified_by":762,"kpi":"1","year":"2016","values":"{\\"0\\":{\\"months\\":\\"01\\",\\"goals\\":\\"80\\"},\\"1\\":{\\"months\\":\\"02\\",\\"goals\\":\\"80\\"},\\"2\\":{\\"months\\":\\"03\\",\\"goals\\":\\"80\\"},\\"3\\":{\\"months\\":\\"04\\",\\"goals\\":\\"85\\"},\\"4\\":{\\"months\\":\\"05\\",\\"goals\\":\\"85\\"},\\"5\\":{\\"months\\":\\"06\\",\\"goals\\":\\"85\\"},\\"6\\":{\\"months\\":\\"07\\",\\"goals\\":\\"85\\"},\\"7\\":{\\"months\\":\\"08\\",\\"goals\\":\\"90\\"},\\"8\\":{\\"months\\":\\"09\\",\\"goals\\":\\"90\\"},\\"9\\":{\\"months\\":\\"10\\",\\"goals\\":\\"90\\"},\\"10\\":{\\"months\\":\\"11\\",\\"goals\\":\\"90\\"},\\"11\\":{\\"months\\":\\"12\\",\\"goals\\":\\"95\\"}}","version":null}', 0),
(15, 1, 18, '', '2016-03-03 20:33:42', 762, 761, 'ed5a492e628912d1859f30ea79f23d9b8023fae5', '{"id":1,"asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 20:30:52","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 20:33:42","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"01\\",\\"goal\\":\\"80\\"},\\"1\\":{\\"month\\":\\"02\\",\\"goal\\":\\"80\\"},\\"2\\":{\\"month\\":\\"03\\",\\"goal\\":\\"80\\"},\\"3\\":{\\"month\\":\\"04\\",\\"goal\\":\\"85\\"},\\"4\\":{\\"month\\":\\"05\\",\\"goal\\":\\"85\\"},\\"5\\":{\\"month\\":\\"06\\",\\"goal\\":\\"85\\"},\\"6\\":{\\"month\\":\\"07\\",\\"goal\\":\\"85\\"},\\"7\\":{\\"month\\":\\"08\\",\\"goal\\":\\"90\\"},\\"8\\":{\\"month\\":\\"09\\",\\"goal\\":\\"90\\"},\\"9\\":{\\"month\\":\\"10\\",\\"goal\\":\\"90\\"},\\"10\\":{\\"month\\":\\"11\\",\\"goal\\":\\"90\\"},\\"11\\":{\\"month\\":\\"12\\",\\"goal\\":\\"95\\"}}","version":"0"}', 0),
(16, 1, 18, '', '2016-03-03 21:42:43', 762, 267, 'de9b78cacf548fcdf0e2c981da7bb72b7a3d5266', '{"id":1,"asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 21:42:41","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 21:42:43","modified_by":"762","kpi":"1","year":"2016","values":"{","version":"0"}', 0),
(17, 1, 15, '', '2016-03-03 21:51:02', 762, 534, '2ed346b1fedf6b051ea38d4bf5534a7a68b14284', '{"id":1,"ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 21:50:56","created":"2016-02-12 00:06:28","created_by":"762","modified":"2016-03-03 21:51:02","modified_by":"762","title":"Services attended before the deadline","alias":"services-attended-before-the-deadline","title_fr":"Les services ont assist\\u00e9 avant la date limite","alias_fr":"les-services-ont-assiste-avant-la-date-limite","responsible":"765","unit":"17","category":"1","type":"percentual","increase":"1","periodicity":"1","color":"blue"}', 0),
(18, 3, 15, '', '2016-03-03 21:51:09', 762, 480, '3cc2cc992aba501f7a48618e3883af41415896eb', '{"id":3,"ordering":"3","state":"1","checked_out":"762","checked_out_time":"2016-03-03 21:51:04","created":"2016-03-03 18:16:58","created_by":"762","modified":"2016-03-03 21:51:09","modified_by":"762","title":"Sales volume of two months","alias":"sales-volume-of-two-months","title_fr":"Le volume des ventes de deux mois","alias_fr":"le-volume-des-ventes-de-deux-mois","responsible":"766","unit":"16","category":"1","type":"currency","increase":"1","periodicity":"2","color":"red"}', 0),
(19, 1, 18, '', '2016-03-03 21:57:27', 762, 397, '24518939dc6b6a8677cd9b0a007a42edea450276', '{"id":1,"asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 21:56:56","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 21:57:27","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"sa\\",\\"goal\\":\\"as\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asdasd\\"}}","version":"0"}', 0),
(20, 1, 18, '', '2016-03-03 21:58:53', 762, 398, '59bd5ce1bb49ac7d07840ec8823e162bcf52a10b', '{"id":1,"asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 21:58:39","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 21:58:53","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"sa\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asdasd\\"}}","version":"0"}', 0),
(21, 1, 18, '', '2016-03-03 22:00:24', 762, 399, 'fe9e986a3a11376c342849633813b65bba3118ba', '{"id":1,"asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:00:22","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:00:24","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"sas\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asdasd\\"}}","version":"0"}', 0),
(22, 1, 18, '', '2016-03-03 22:20:48', 762, 398, 'fbd2fd3769667bc7f1f2e66ba538939fe4b1fb55', '{"id":1,"asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:20:39","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:20:48","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"teste\\",\\"goal\\":\\"aaa\\"},\\"1\\":{\\"month\\":\\"sad\\",\\"goal\\":\\"asd\\"},\\"2\\":{\\"month\\":\\"asd\\",\\"goal\\":\\"asd\\"}}","version":"0"}', 0),
(23, 1, 18, '', '2016-03-03 22:58:15', 762, 761, '045f91cd61a3c56e5df32d2d48008ec83ac7b32d', '{"id":1,"asset_id":"65","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-03 22:57:14","created":"2016-03-03 18:36:40","created_by":"762","modified":"2016-03-03 22:58:15","modified_by":"762","kpi":"1","year":"2016","values":"{\\"0\\":{\\"month\\":\\"01\\",\\"goal\\":\\"70\\"},\\"1\\":{\\"month\\":\\"02\\",\\"goal\\":\\"70\\"},\\"2\\":{\\"month\\":\\"03\\",\\"goal\\":\\"70\\"},\\"3\\":{\\"month\\":\\"04\\",\\"goal\\":\\"75\\"},\\"4\\":{\\"month\\":\\"05\\",\\"goal\\":\\"75\\"},\\"5\\":{\\"month\\":\\"06\\",\\"goal\\":\\"75\\"},\\"6\\":{\\"month\\":\\"07\\",\\"goal\\":\\"80\\"},\\"7\\":{\\"month\\":\\"08\\",\\"goal\\":\\"80\\"},\\"8\\":{\\"month\\":\\"09\\",\\"goal\\":\\"85\\"},\\"9\\":{\\"month\\":\\"10\\",\\"goal\\":\\"85\\"},\\"10\\":{\\"month\\":\\"11\\",\\"goal\\":\\"90\\"},\\"11\\":{\\"month\\":\\"12\\",\\"goal\\":\\"90\\"}}","version":"0"}', 0),
(24, 2, 15, '', '2016-03-03 23:49:29', 762, 459, '912a765137507ee6d1b821100a85a6fdf08506c2', '{"id":2,"ordering":"2","state":"1","checked_out":"762","checked_out_time":"2016-03-03 23:49:17","created":"2016-03-03 18:15:48","created_by":"762","modified":"2016-03-03 23:49:29","modified_by":"762","title":"Client Satisfaction","alias":"client-satisfaction","title_fr":"La satisfaction des clients","alias_fr":"la-satisfaction-des-clients","responsible":"765","unit":"15","category":"1","type":"percentual","increase":"1","periodicity":"1","color":"purple"}', 0),
(27, 2, 15, '', '2016-03-04 23:14:09', 762, 459, 'ee1a986f1edf80e28440881f2163ad196c3a5cd7', '{"id":2,"ordering":"2","state":"1","checked_out":"762","checked_out_time":"2016-03-04 23:13:16","created":"2016-03-04 23:13:35","created_by":"762","modified":"2016-03-04 23:14:09","modified_by":"762","title":"Client Satisfaction","alias":"client-satisfaction","title_fr":"La satisfaction des clients","alias_fr":"la-satisfaction-des-clients","responsible":"765","unit":"15","category":"1","type":"percentual","increase":"1","periodicity":"6","color":"purple"}', 0),
(28, 2, 18, '', '2016-03-04 23:41:06', 762, 247, 'e4324b2b4ba79d4ee2943b7ec0021db25c5234ce', '{"id":2,"asset_id":66,"ordering":2,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-04 23:41:06","created_by":"762","modified":"2016-03-04 23:40:35","modified_by":"762","kpi":"2","year":"2016","values":"{}","version":null}', 0),
(29, 2, 18, '', '2016-03-05 00:04:02', 762, 348, '7ac6b615926df0af64dced5781d3cb78b31546d9', '{"id":2,"asset_id":"66","ordering":"2","state":"1","checked_out":"762","checked_out_time":"2016-03-04 23:41:50","created":"2016-03-04 23:41:06","created_by":"762","modified":"2016-03-04 23:40:35","modified_by":"762","kpi":"2","year":"2016","values":"{\\"0\\":{\\"month\\":\\"6\\",\\"goal\\":\\"80\\"},\\"1\\":{\\"month\\":\\"12\\",\\"goal\\":\\"85\\"}}","version":"0"}', 0),
(31, 4, 18, '', '2016-03-05 00:06:08', 762, 512, '784f0af24ffb034a7088b56dc4dd1088f7df9475', '{"id":4,"asset_id":68,"ordering":4,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-05 00:06:08","created_by":"762","modified":"2016-03-05 00:06:08","modified_by":"762","kpi":"3","year":"2016","values":"{\\"0\\":{\\"month\\":\\"2\\",\\"goal\\":\\"500000\\"},\\"1\\":{\\"month\\":\\"4\\",\\"goal\\":\\"550000\\"},\\"2\\":{\\"month\\":\\"6\\",\\"goal\\":\\"600000\\"},\\"3\\":{\\"month\\":\\"8\\",\\"goal\\":\\"600000\\"},\\"4\\":{\\"month\\":\\"10\\",\\"goal\\":\\"650000\\"},\\"5\\":{\\"month\\":\\"12\\",\\"goal\\":\\"650000\\"}}","version":null}', 0),
(33, 1, 16, '', '2016-03-07 17:10:05', 762, 617, 'c2c1084023e2828841c84d73f05c69aa6f767faa', '{"id":1,"asset_id":69,"ordering":1,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-07 17:10:05","created_by":"762","modified":"2016-03-07 17:10:05","modified_by":"762","title":"Action Plan - 01\\/2016","alias":"action-plan-01-2016","date":"2016-03-04","reference":"01\\/2016","kpi":"2","participants":["762","763","767","765"],"facts":"- The KPI is low\\r\\n- Some reclamations about the product","causes":"- Defective products\\r\\n- Webchat not working","actions":"- Contract a new webchat system\\r\\n- Talk with supply about the products\\r\\n- Create marketing on social networks","version":null}', 0),
(34, 1, 16, '', '2016-03-07 17:29:51', 762, 626, '454d1f8472bb663ec9c7966401a43ab8768f2d97', '{"id":1,"asset_id":"69","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-07 17:25:39","created":"2016-03-07 17:29:27","created_by":"762","modified":"2016-03-07 17:29:51","modified_by":"762","title":"Action Plan - 01\\/2016","alias":"action-plan-01-2016","date":"2016-03-04","reference":"01\\/2016","kpi":"2","participants":["762","763","765","764"],"facts":"- The KPI is low - Some reclamations about the product","causes":"- Defective products - Webchat not working","actions":"- Contract a new webchat system - Talk with supply about the products - Create marketing on social networks","version":"0"}', 0),
(35, 1, 16, '', '2016-03-07 17:31:08', 762, 626, '9fb0327ebd8a6093dc69f9408554ce4c3d8b7128', '{"id":1,"asset_id":"69","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-07 17:29:51","created":"2016-03-07 17:29:27","created_by":"762","modified":"2016-03-07 17:31:08","modified_by":"762","title":"Action Plan - 01\\/2016","alias":"action-plan-01-2016","date":"2016-03-04","reference":"01\\/2016","kpi":"2","participants":["762","763","767","765"],"facts":"- The KPI is low - Some reclamations about the product","causes":"- Defective products - Webchat not working","actions":"- Contract a new webchat system - Talk with supply about the products - Create marketing on social networks","version":"0"}', 0),
(36, 1, 16, '', '2016-03-07 17:36:24', 762, 618, '9677dec428d71603371a536c3e68a96fdf821384', '{"id":1,"asset_id":"69","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-07 17:32:50","created":"2016-03-07 17:29:27","created_by":"762","modified":"2016-03-07 17:36:24","modified_by":"762","title":"Action Plan - 01\\/2016","alias":"action-plan-01-2016","date":"2016-03-04","reference":"01\\/2016","kpi":"2","participants":"762,763,767,765","facts":"- The KPI is low - Some reclamations about the product","causes":"- Defective products - Webchat not working","actions":"- Contract a new webchat system - Talk with supply about the products - Create marketing on social networks","version":"0"}', 0),
(37, 5, 18, '', '2016-03-07 17:59:55', 762, 290, 'ef713de06bf57cb8f6110e7bbed018abcbd76ed0', '{"id":5,"asset_id":70,"ordering":5,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-07 17:59:55","created_by":"762","modified":"2016-03-07 17:59:55","modified_by":"762","kpi":"1","year":"sasa","values":"{\\"0\\":{\\"month\\":\\"1\\",\\"goal\\":\\"asdasd\\"}}","version":null}', 0),
(38, 6, 18, '', '2016-03-07 18:00:11', 762, 290, 'd82ac983ed8fd7deb073cab99bfe6b76e07ff692', '{"id":6,"asset_id":71,"ordering":6,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-07 18:00:11","created_by":"762","modified":"2016-03-07 18:00:11","modified_by":"762","kpi":"1","year":"sasa","values":"{\\"0\\":{\\"month\\":\\"1\\",\\"goal\\":\\"asdasd\\"}}","version":null}', 0),
(40, 1, 17, '', '2016-03-08 01:16:05', 762, 254, '0141efbe7aaca1b454cb2f98462a4d9ee919ef55', '{"id":1,"asset_id":73,"ordering":1,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-08 01:16:05","created_by":"762","modified":"2016-03-08 01:15:54","modified_by":"762","kpi":"","goals":"","value":"70","month":"6","version":null}', 0),
(41, 2, 17, '', '2016-03-08 01:16:37', 762, 258, '19f9794160ba126a565b7d1cab8b025ca9d7d29b', '{"id":2,"asset_id":74,"ordering":2,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-08 01:16:37","created_by":"762","modified":"2016-03-08 01:16:08","modified_by":"762","kpi":"","goals":"","value":"510000","month":"2","version":null}', 0),
(42, 3, 17, '', '2016-03-08 01:17:11', 762, 258, '1f9329ee558b6c32b0eb5e47315c59714679d372', '{"id":3,"asset_id":75,"ordering":3,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-08 01:17:11","created_by":"762","modified":"2016-03-08 01:16:39","modified_by":"762","kpi":"","goals":"","value":"510000","month":"4","version":null}', 0),
(43, 4, 17, '', '2016-03-08 01:17:24', 762, 254, 'b3287defe841a514950d3fe26ff9f74a65da8b6b', '{"id":4,"asset_id":76,"ordering":4,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-08 01:17:24","created_by":"762","modified":"2016-03-08 01:17:13","modified_by":"762","kpi":"","goals":"","value":"68","month":"1","version":null}', 0),
(44, 5, 17, '', '2016-03-08 01:17:36', 762, 254, 'cf79a5ac6f688034a7a2a6127708045aa532778b', '{"id":5,"asset_id":77,"ordering":5,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-08 01:17:36","created_by":"762","modified":"2016-03-08 01:17:27","modified_by":"762","kpi":"","goals":"","value":"71","month":"2","version":null}', 0),
(45, 6, 17, '', '2016-03-08 01:17:49', 762, 254, '12236dd2fb3868811832409c96298e08e1331938', '{"id":6,"asset_id":78,"ordering":6,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-08 01:17:49","created_by":"762","modified":"2016-03-08 01:17:39","modified_by":"762","kpi":"","goals":"","value":"60","month":"3","version":null}', 0),
(46, 7, 17, '', '2016-03-08 01:18:07', 762, 254, '838d07a3a7a7278ab65675a424a811c47cb98c96', '{"id":7,"asset_id":79,"ordering":7,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-08 01:18:07","created_by":"762","modified":"2016-03-08 01:18:07","modified_by":"762","kpi":"","goals":"","value":"79","month":"4","version":null}', 0),
(47, 1, 17, '', '2016-03-08 01:30:18', 762, 277, 'cf6f06c36a5780a587f5b2d073d68ca12882a5cb', '{"id":1,"asset_id":"73","ordering":"1","state":"1","checked_out":"762","checked_out_time":"2016-03-08 01:18:55","created":"2016-03-08 01:16:05","created_by":"762","modified":"2016-03-08 01:30:18","modified_by":"762","kpi":"2","goals":"2","value":"70","month":"6","version":"0"}', 0),
(48, 5, 17, '', '2016-03-08 02:01:45', 762, 277, '5e7013260d66a6266b5d6f9473a5d26a9cc1f694', '{"id":5,"asset_id":"77","ordering":"5","state":"1","checked_out":"762","checked_out_time":"2016-03-08 02:01:31","created":"2016-03-08 01:17:36","created_by":"762","modified":"2016-03-08 02:01:45","modified_by":"762","kpi":"1","goals":"1","value":"71","month":"2","version":"0"}', 0),
(49, 4, 17, '', '2016-03-08 02:02:05', 762, 277, '76a8a6abd5f2236409ba3777566fc790c3e282db', '{"id":4,"asset_id":"76","ordering":"4","state":"1","checked_out":"762","checked_out_time":"2016-03-08 02:02:01","created":"2016-03-08 01:17:24","created_by":"762","modified":"2016-03-08 02:02:05","modified_by":"762","kpi":"1","goals":"1","value":"68","month":"1","version":"0"}', 0),
(50, 7, 17, '', '2016-03-08 02:02:15', 762, 277, '11016fa68bebf2d126fd703c1e2ea5fe8c90aa9c', '{"id":7,"asset_id":"79","ordering":"7","state":"1","checked_out":"762","checked_out_time":"2016-03-08 02:02:10","created":"2016-03-08 01:18:07","created_by":"762","modified":"2016-03-08 02:02:15","modified_by":"762","kpi":"1","goals":"1","value":"79","month":"4","version":"0"}', 0),
(51, 3, 17, '', '2016-03-08 02:02:24', 762, 281, '76e47951dc2b84b5376b3358e13378e092bb3ea3', '{"id":3,"asset_id":"75","ordering":"3","state":"1","checked_out":"762","checked_out_time":"2016-03-08 02:02:20","created":"2016-03-08 01:17:11","created_by":"762","modified":"2016-03-08 02:02:24","modified_by":"762","kpi":"3","goals":"4","value":"510000","month":"4","version":"0"}', 0),
(52, 2, 17, '', '2016-03-08 02:02:33', 762, 281, '5e0d470eba407c8589141962d0ec0eaae3868997', '{"id":2,"asset_id":"74","ordering":"2","state":"1","checked_out":"762","checked_out_time":"2016-03-08 02:02:29","created":"2016-03-08 01:16:37","created_by":"762","modified":"2016-03-08 02:02:33","modified_by":"762","kpi":"3","goals":"4","value":"510000","month":"2","version":"0"}', 0),
(53, 6, 17, '', '2016-03-08 02:02:52', 762, 277, '4d8959ae4e983490ad655d69c2e28a7bf44a400f', '{"id":6,"asset_id":"78","ordering":"6","state":"1","checked_out":"762","checked_out_time":"2016-03-08 02:02:48","created":"2016-03-08 01:17:49","created_by":"762","modified":"2016-03-08 02:02:52","modified_by":"762","kpi":"1","goals":"1","value":"60","month":"3","version":"0"}', 0),
(54, 8, 17, '', '2016-03-08 19:21:47', 762, 257, 'c42962e5b3e21f6d0706ab200e7a94221d246d99', '{"id":8,"asset_id":80,"ordering":8,"state":"1","checked_out":null,"checked_out_time":null,"created":"2016-03-08 19:21:47","created_by":"762","modified":"2016-03-08 19:21:47","modified_by":"762","kpi":"2","goals":"2","value":"90","month":"12","version":null}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_updates`
--

CREATE TABLE `cs872_updates` (
  `update_id` int(11) NOT NULL,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  `extra_query` varchar(1000) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available Updates';

-- --------------------------------------------------------

--
-- Table structure for table `cs872_update_sites`
--

CREATE TABLE `cs872_update_sites` (
  `update_site_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Update Sites';

--
-- Dumping data for table `cs872_update_sites`
--

INSERT INTO `cs872_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla! Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1457371530, ''),
(2, 'Joomla! Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1457371530, ''),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist_3.xml', 1, 0, ''),
(4, 'Joomla! Update Component Update Site', 'extension', 'http://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `cs872_update_sites_extensions`
--

CREATE TABLE `cs872_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Dumping data for table `cs872_update_sites_extensions`
--

INSERT INTO `cs872_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(3, 10005),
(4, 28);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_usergroups`
--

CREATE TABLE `cs872_usergroups` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_usergroups`
--

INSERT INTO `cs872_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 34, 'Public'),
(2, 1, 24, 31, 'Registered'),
(3, 2, 25, 30, 'Author'),
(4, 3, 26, 29, 'Editor'),
(5, 4, 27, 28, 'Publisher'),
(6, 1, 20, 23, 'Manager'),
(7, 6, 21, 22, 'Administrator'),
(8, 1, 32, 33, 'Super Users'),
(9, 1, 18, 19, 'Guest'),
(10, 1, 2, 17, 'BIM System'),
(11, 10, 3, 4, 'Administrator'),
(12, 10, 5, 6, 'Auditor'),
(13, 10, 15, 16, 'KPI Responsible'),
(14, 10, 7, 14, 'Employee'),
(15, 14, 10, 11, 'Marketing'),
(16, 14, 12, 13, 'Sales'),
(17, 14, 8, 9, 'I.T.');

-- --------------------------------------------------------

--
-- Table structure for table `cs872_users`
--

CREATE TABLE `cs872_users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_users`
--

INSERT INTO `cs872_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
(762, 'Administrator', 'superadmin', 'martinsp@uregina.ca', '$2y$10$CxAH1Q5VvzwIAcTCR.SRSeQYXftXX7vbAxQfSN2UPINvJKE7ZMHoK', 0, 1, '2016-01-29 00:41:41', '2016-03-07 17:25:10', '0', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
(763, 'Administrator', 'admin', 'system@bim.comlu.com', '$2y$10$XDJGTbN56caU3W4nFh7dz.9jZVeYi2pzdDPMHzo/wG.ZslJpLVQfG', 0, 1, '2016-02-23 01:56:58', '2016-03-08 19:14:18', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
(764, 'Samira Sadaoui', 'samira', 'samira.sadaoui@uregina.ca', '$2y$10$hpE.BInW3j5sw7mhK0cHd.l7wQzvrXwBzQnclLHFi5v8AisMvGkgK', 0, 0, '2016-03-03 18:11:17', '2016-03-08 19:12:59', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
(765, 'Paulo Andrade', 'paulo', 'paulo85br@gmail.com', '$2y$10$i403R45GEVPHteZkAeUKhOJB3ro.KBnCV7XdHIN.hPym.8nLvDBvO', 0, 0, '2016-03-03 18:12:00', '2016-03-08 19:19:38', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
(766, 'Vaikunth Vijayaraghavan', 'vaikunth', 'vaikunth92@gmail.com', '$2y$10$7BvxOfRpTcQF21NJJSPZN.EM4Scs0yqxXENp7uRWcau43pxES5Xd6', 0, 0, '2016-03-03 18:12:45', '0000-00-00 00:00:00', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
(767, 'Employee 1', 'user', 'user1@bim.ca', '$2y$10$jJUUnFqP0fqcME0OkzFC8OHzj0XSTxjbXsVbTRXCbdCUyLsAft2AW', 0, 0, '2016-03-03 18:14:20', '2016-03-04 22:20:06', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0),
(768, 'Employee 2', 'user2', 'vijayarv@uregina.ca', '$2y$10$QTLiHRdYcF1wXuEaaq4bxebHlbHRC3VB/1uougDmPSP4PbwqgxvkS', 0, 1, '2016-03-08 19:17:59', '0000-00-00 00:00:00', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_user_keys`
--

CREATE TABLE `cs872_user_keys` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `series` varchar(255) NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) NOT NULL,
  `uastring` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_user_notes`
--

CREATE TABLE `cs872_user_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `catid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) UNSIGNED NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs872_user_profiles`
--

CREATE TABLE `cs872_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Table structure for table `cs872_user_usergroup_map`
--

CREATE TABLE `cs872_user_usergroup_map` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_user_usergroup_map`
--

INSERT INTO `cs872_user_usergroup_map` (`user_id`, `group_id`) VALUES
(762, 8),
(763, 2),
(763, 11),
(764, 2),
(764, 10),
(764, 12),
(765, 2),
(765, 10),
(765, 13),
(766, 2),
(766, 10),
(766, 13),
(767, 2),
(767, 10),
(767, 14),
(768, 2),
(768, 10),
(768, 16);

-- --------------------------------------------------------

--
-- Table structure for table `cs872_viewlevels`
--

CREATE TABLE `cs872_viewlevels` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs872_viewlevels`
--

INSERT INTO `cs872_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[10,11,12,14,13,6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cs872_assets`
--
ALTER TABLE `cs872_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_asset_name` (`name`),
  ADD KEY `idx_lft_rgt` (`lft`,`rgt`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indexes for table `cs872_associations`
--
ALTER TABLE `cs872_associations`
  ADD PRIMARY KEY (`context`,`id`),
  ADD KEY `idx_key` (`key`);

--
-- Indexes for table `cs872_banners`
--
ALTER TABLE `cs872_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`),
  ADD KEY `idx_banner_catid` (`catid`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `cs872_banner_clients`
--
ALTER TABLE `cs872_banner_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`);

--
-- Indexes for table `cs872_banner_tracks`
--
ALTER TABLE `cs872_banner_tracks`
  ADD PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  ADD KEY `idx_track_date` (`track_date`),
  ADD KEY `idx_track_type` (`track_type`),
  ADD KEY `idx_banner_id` (`banner_id`);

--
-- Indexes for table `cs872_bim_audit`
--
ALTER TABLE `cs872_bim_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs872_bim_category`
--
ALTER TABLE `cs872_bim_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs872_bim_goals`
--
ALTER TABLE `cs872_bim_goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kpi` (`kpi`,`year`);

--
-- Indexes for table `cs872_bim_kpi`
--
ALTER TABLE `cs872_bim_kpi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs872_bim_meeting`
--
ALTER TABLE `cs872_bim_meeting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs872_bim_values`
--
ALTER TABLE `cs872_bim_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs872_categories`
--
ALTER TABLE `cs872_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_idx` (`extension`,`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `cs872_contact_details`
--
ALTER TABLE `cs872_contact_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Indexes for table `cs872_content`
--
ALTER TABLE `cs872_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Indexes for table `cs872_contentitem_tag_map`
--
ALTER TABLE `cs872_contentitem_tag_map`
  ADD UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  ADD KEY `idx_tag_type` (`tag_id`,`type_id`),
  ADD KEY `idx_date_id` (`tag_date`,`tag_id`),
  ADD KEY `idx_tag` (`tag_id`),
  ADD KEY `idx_type` (`type_id`),
  ADD KEY `idx_core_content_id` (`core_content_id`);

--
-- Indexes for table `cs872_content_frontpage`
--
ALTER TABLE `cs872_content_frontpage`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `cs872_content_rating`
--
ALTER TABLE `cs872_content_rating`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `cs872_content_types`
--
ALTER TABLE `cs872_content_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `idx_alias` (`type_alias`);

--
-- Indexes for table `cs872_extensions`
--
ALTER TABLE `cs872_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD KEY `element_clientid` (`element`,`client_id`),
  ADD KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  ADD KEY `extension` (`type`,`element`,`folder`,`client_id`);

--
-- Indexes for table `cs872_finder_filters`
--
ALTER TABLE `cs872_finder_filters`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `cs872_finder_links`
--
ALTER TABLE `cs872_finder_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `idx_type` (`type_id`),
  ADD KEY `idx_title` (`title`),
  ADD KEY `idx_md5` (`md5sum`),
  ADD KEY `idx_url` (`url`(75)),
  ADD KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  ADD KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`);

--
-- Indexes for table `cs872_finder_links_terms0`
--
ALTER TABLE `cs872_finder_links_terms0`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_terms1`
--
ALTER TABLE `cs872_finder_links_terms1`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_terms2`
--
ALTER TABLE `cs872_finder_links_terms2`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_terms3`
--
ALTER TABLE `cs872_finder_links_terms3`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_terms4`
--
ALTER TABLE `cs872_finder_links_terms4`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_terms5`
--
ALTER TABLE `cs872_finder_links_terms5`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_terms6`
--
ALTER TABLE `cs872_finder_links_terms6`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_terms7`
--
ALTER TABLE `cs872_finder_links_terms7`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_terms8`
--
ALTER TABLE `cs872_finder_links_terms8`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_terms9`
--
ALTER TABLE `cs872_finder_links_terms9`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_termsa`
--
ALTER TABLE `cs872_finder_links_termsa`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_termsb`
--
ALTER TABLE `cs872_finder_links_termsb`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_termsc`
--
ALTER TABLE `cs872_finder_links_termsc`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_termsd`
--
ALTER TABLE `cs872_finder_links_termsd`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_termse`
--
ALTER TABLE `cs872_finder_links_termse`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_links_termsf`
--
ALTER TABLE `cs872_finder_links_termsf`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `cs872_finder_taxonomy`
--
ALTER TABLE `cs872_finder_taxonomy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `state` (`state`),
  ADD KEY `ordering` (`ordering`),
  ADD KEY `access` (`access`),
  ADD KEY `idx_parent_published` (`parent_id`,`state`,`access`);

--
-- Indexes for table `cs872_finder_taxonomy_map`
--
ALTER TABLE `cs872_finder_taxonomy_map`
  ADD PRIMARY KEY (`link_id`,`node_id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `node_id` (`node_id`);

--
-- Indexes for table `cs872_finder_terms`
--
ALTER TABLE `cs872_finder_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD UNIQUE KEY `idx_term` (`term`),
  ADD KEY `idx_term_phrase` (`term`,`phrase`),
  ADD KEY `idx_stem_phrase` (`stem`,`phrase`),
  ADD KEY `idx_soundex_phrase` (`soundex`,`phrase`);

--
-- Indexes for table `cs872_finder_terms_common`
--
ALTER TABLE `cs872_finder_terms_common`
  ADD KEY `idx_word_lang` (`term`,`language`),
  ADD KEY `idx_lang` (`language`);

--
-- Indexes for table `cs872_finder_tokens`
--
ALTER TABLE `cs872_finder_tokens`
  ADD KEY `idx_word` (`term`),
  ADD KEY `idx_context` (`context`);

--
-- Indexes for table `cs872_finder_tokens_aggregate`
--
ALTER TABLE `cs872_finder_tokens_aggregate`
  ADD KEY `token` (`term`),
  ADD KEY `keyword_id` (`term_id`);

--
-- Indexes for table `cs872_finder_types`
--
ALTER TABLE `cs872_finder_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `cs872_languages`
--
ALTER TABLE `cs872_languages`
  ADD PRIMARY KEY (`lang_id`),
  ADD UNIQUE KEY `idx_sef` (`sef`),
  ADD UNIQUE KEY `idx_image` (`image`),
  ADD UNIQUE KEY `idx_langcode` (`lang_code`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_ordering` (`ordering`);

--
-- Indexes for table `cs872_menu`
--
ALTER TABLE `cs872_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  ADD KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  ADD KEY `idx_menutype` (`menutype`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`),
  ADD KEY `idx_path` (`path`(255)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `cs872_menu_types`
--
ALTER TABLE `cs872_menu_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_menutype` (`menutype`);

--
-- Indexes for table `cs872_messages`
--
ALTER TABLE `cs872_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `useridto_state` (`user_id_to`,`state`);

--
-- Indexes for table `cs872_messages_cfg`
--
ALTER TABLE `cs872_messages_cfg`
  ADD UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`);

--
-- Indexes for table `cs872_modules`
--
ALTER TABLE `cs872_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`,`access`),
  ADD KEY `newsfeeds` (`module`,`published`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `cs872_modules_menu`
--
ALTER TABLE `cs872_modules_menu`
  ADD PRIMARY KEY (`moduleid`,`menuid`);

--
-- Indexes for table `cs872_newsfeeds`
--
ALTER TABLE `cs872_newsfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_xreference` (`xreference`);

--
-- Indexes for table `cs872_overrider`
--
ALTER TABLE `cs872_overrider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs872_postinstall_messages`
--
ALTER TABLE `cs872_postinstall_messages`
  ADD PRIMARY KEY (`postinstall_message_id`);

--
-- Indexes for table `cs872_redirect_links`
--
ALTER TABLE `cs872_redirect_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_link_old` (`old_url`),
  ADD KEY `idx_link_modifed` (`modified_date`);

--
-- Indexes for table `cs872_schemas`
--
ALTER TABLE `cs872_schemas`
  ADD PRIMARY KEY (`extension_id`,`version_id`);

--
-- Indexes for table `cs872_session`
--
ALTER TABLE `cs872_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `cs872_tags`
--
ALTER TABLE `cs872_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_idx` (`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `cs872_template_styles`
--
ALTER TABLE `cs872_template_styles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_template` (`template`),
  ADD KEY `idx_home` (`home`);

--
-- Indexes for table `cs872_test_item`
--
ALTER TABLE `cs872_test_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs872_ucm_base`
--
ALTER TABLE `cs872_ucm_base`
  ADD PRIMARY KEY (`ucm_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_item_id`),
  ADD KEY `idx_ucm_type_id` (`ucm_type_id`),
  ADD KEY `idx_ucm_language_id` (`ucm_language_id`);

--
-- Indexes for table `cs872_ucm_content`
--
ALTER TABLE `cs872_ucm_content`
  ADD PRIMARY KEY (`core_content_id`),
  ADD KEY `tag_idx` (`core_state`,`core_access`),
  ADD KEY `idx_access` (`core_access`),
  ADD KEY `idx_alias` (`core_alias`),
  ADD KEY `idx_language` (`core_language`),
  ADD KEY `idx_title` (`core_title`),
  ADD KEY `idx_modified_time` (`core_modified_time`),
  ADD KEY `idx_created_time` (`core_created_time`),
  ADD KEY `idx_content_type` (`core_type_alias`),
  ADD KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  ADD KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  ADD KEY `idx_core_created_user_id` (`core_created_user_id`),
  ADD KEY `idx_core_type_id` (`core_type_id`);

--
-- Indexes for table `cs872_ucm_history`
--
ALTER TABLE `cs872_ucm_history`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  ADD KEY `idx_save_date` (`save_date`);

--
-- Indexes for table `cs872_updates`
--
ALTER TABLE `cs872_updates`
  ADD PRIMARY KEY (`update_id`);

--
-- Indexes for table `cs872_update_sites`
--
ALTER TABLE `cs872_update_sites`
  ADD PRIMARY KEY (`update_site_id`);

--
-- Indexes for table `cs872_update_sites_extensions`
--
ALTER TABLE `cs872_update_sites_extensions`
  ADD PRIMARY KEY (`update_site_id`,`extension_id`);

--
-- Indexes for table `cs872_usergroups`
--
ALTER TABLE `cs872_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  ADD KEY `idx_usergroup_title_lookup` (`title`),
  ADD KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  ADD KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE;

--
-- Indexes for table `cs872_users`
--
ALTER TABLE `cs872_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_name` (`name`),
  ADD KEY `idx_block` (`block`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `cs872_user_keys`
--
ALTER TABLE `cs872_user_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `series` (`series`),
  ADD UNIQUE KEY `series_2` (`series`),
  ADD UNIQUE KEY `series_3` (`series`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cs872_user_notes`
--
ALTER TABLE `cs872_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_category_id` (`catid`);

--
-- Indexes for table `cs872_user_profiles`
--
ALTER TABLE `cs872_user_profiles`
  ADD UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`);

--
-- Indexes for table `cs872_user_usergroup_map`
--
ALTER TABLE `cs872_user_usergroup_map`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Indexes for table `cs872_viewlevels`
--
ALTER TABLE `cs872_viewlevels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_assetgroup_title_lookup` (`title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cs872_assets`
--
ALTER TABLE `cs872_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `cs872_banners`
--
ALTER TABLE `cs872_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs872_banner_clients`
--
ALTER TABLE `cs872_banner_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs872_bim_audit`
--
ALTER TABLE `cs872_bim_audit`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT for table `cs872_bim_category`
--
ALTER TABLE `cs872_bim_category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cs872_bim_goals`
--
ALTER TABLE `cs872_bim_goals`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cs872_bim_kpi`
--
ALTER TABLE `cs872_bim_kpi`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cs872_bim_meeting`
--
ALTER TABLE `cs872_bim_meeting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cs872_bim_values`
--
ALTER TABLE `cs872_bim_values`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `cs872_categories`
--
ALTER TABLE `cs872_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `cs872_contact_details`
--
ALTER TABLE `cs872_contact_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cs872_content`
--
ALTER TABLE `cs872_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cs872_content_types`
--
ALTER TABLE `cs872_content_types`
  MODIFY `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `cs872_extensions`
--
ALTER TABLE `cs872_extensions`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10009;
--
-- AUTO_INCREMENT for table `cs872_finder_filters`
--
ALTER TABLE `cs872_finder_filters`
  MODIFY `filter_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs872_finder_links`
--
ALTER TABLE `cs872_finder_links`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs872_finder_taxonomy`
--
ALTER TABLE `cs872_finder_taxonomy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cs872_finder_terms`
--
ALTER TABLE `cs872_finder_terms`
  MODIFY `term_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs872_finder_types`
--
ALTER TABLE `cs872_finder_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs872_languages`
--
ALTER TABLE `cs872_languages`
  MODIFY `lang_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cs872_menu`
--
ALTER TABLE `cs872_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;
--
-- AUTO_INCREMENT for table `cs872_menu_types`
--
ALTER TABLE `cs872_menu_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cs872_messages`
--
ALTER TABLE `cs872_messages`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs872_modules`
--
ALTER TABLE `cs872_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `cs872_newsfeeds`
--
ALTER TABLE `cs872_newsfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs872_overrider`
--
ALTER TABLE `cs872_overrider`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';
--
-- AUTO_INCREMENT for table `cs872_postinstall_messages`
--
ALTER TABLE `cs872_postinstall_messages`
  MODIFY `postinstall_message_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cs872_redirect_links`
--
ALTER TABLE `cs872_redirect_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs872_tags`
--
ALTER TABLE `cs872_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cs872_template_styles`
--
ALTER TABLE `cs872_template_styles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `cs872_test_item`
--
ALTER TABLE `cs872_test_item`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs872_ucm_content`
--
ALTER TABLE `cs872_ucm_content`
  MODIFY `core_content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs872_ucm_history`
--
ALTER TABLE `cs872_ucm_history`
  MODIFY `version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `cs872_updates`
--
ALTER TABLE `cs872_updates`
  MODIFY `update_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs872_update_sites`
--
ALTER TABLE `cs872_update_sites`
  MODIFY `update_site_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cs872_usergroups`
--
ALTER TABLE `cs872_usergroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `cs872_users`
--
ALTER TABLE `cs872_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=769;
--
-- AUTO_INCREMENT for table `cs872_user_keys`
--
ALTER TABLE `cs872_user_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs872_user_notes`
--
ALTER TABLE `cs872_user_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs872_viewlevels`
--
ALTER TABLE `cs872_viewlevels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
