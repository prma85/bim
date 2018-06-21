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

/**
 * Class BimController
 *
 * @since  1.6
 */
class BimController extends JControllerLegacy {

    /**
     * Method to display a view.
     *
     * @param   boolean  $cachable   If true, the view output will be cached
     * @param   mixed    $urlparams  An array of safe url parameters and their variable types, for valid values see {@link JFilterInput::clean()}.
     *
     * @return   JController This object to support chaining.
     *
     * @since    1.5
     */
    public function display($cachable = false, $urlparams = false) {
        require_once JPATH_COMPONENT . '/helpers/bim.php';

        $user = JFactory::getUser();
        $view = JFactory::getApplication()->input->getCmd('view', 'default');
        JFactory::getApplication()->input->set('view', $view);

        if (!BimHelper::checkPermission($user, $view)) {
            $this->setRedirect(JRoute::_(JUri::base().'index.php?option=com_bim', false), JText::_('COM_BIM_ERROR_ACCESS'), 'error');
        }
        parent::display($cachable, $urlparams);
        return $this;
    }

}