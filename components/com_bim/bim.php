<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Bim
 * @author     Paulo Andrade & Vaikunth Vijayaraghavan <martinsp@uregina.ca>
 * @copyright  Copyright (C) 2016. All rights reserved.
 * @license    GNU General Public License version 2; see the file License. txt
 */

defined('_JEXEC') or die;

// Include dependancies
jimport('joomla.application.component.controller');

JLoader::register('BimFrontendHelper', JPATH_COMPONENT . '/helpers/bim.php');

// Execute the task.
$controller = JControllerLegacy::getInstance('Bim');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
