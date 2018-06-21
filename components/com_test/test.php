<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Test
 * @author     Paulo Andrade <martinsp@uregina.ca>
 * @copyright  Copyright (C) 2016. All rights reserved.
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Include dependancies
jimport('joomla.application.component.controller');

JLoader::register('TestFrontendHelper', JPATH_COMPONENT . '/helpers/test.php');

// Execute the task.
$controller = JControllerLegacy::getInstance('Test');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
