<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Bim
 * @author     Paulo Andrade & Vaikunth Vijayaraghavan <martinsp@uregina.ca>
 * @copyright  Copyright (C) 2016. All rights reserved.
 * @license    GNU General Public License version 2; see the file License. txt
 */

// No direct access
defined('_JEXEC') or die;

// Access check.
if (!JFactory::getUser()->authorise('core.manage', 'com_bim'))
{
	throw new Exception(JText::_('JERROR_ALERTNOAUTHOR'));
}

// Include dependancies
jimport('joomla.application.component.controller');

$controller = JControllerLegacy::getInstance('Bim');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
