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

jimport('joomla.application.component.view');

/**
 * View class for a Control Panel.
 *
 * @since  1.6
 */
class BimViewDefault extends JViewLegacy {

    protected $params;
    protected $state;

    /**
     * Display the view
     *
     * @param   string  $tpl  Template name
     *
     * @return void
     *
     * @throws Exception
     */
    public function display($tpl = null) {
        $this->state = $this->get('State');
        $this->state = $this->get('State');
        
        $this->params = JComponentHelper::getParams('com_bim');
        //$this->imagePath = JURI::base() . 'components/com_bim/assets/images/';
        //$links = BimHelper::getToolbarItems();
        //$this->assignRef('menus', $links);
        
        // Check for errors.
        if (count($errors = $this->get('Errors'))) {
            throw new Exception(implode("\n", $errors));
        }

        BimHelper::addSubmenu('default');

        $this->addToolbar();

        $this->sidebar = JHtmlSidebar::render();
        parent::display($tpl);
    }

    /**
     * Add the page title and toolbar.
     *
     * @return void
     *
     * @since    1.6
     */
    protected function addToolbar() {
        require_once JPATH_COMPONENT . '/helpers/bim.php';

        JToolBarHelper::title(JText::_('COM_BIM_TITLE_DEFAULT'), 'home-2.png');

        // Set sidebar action - New in 3.0
        JHtmlSidebar::setAction('index.php?option=com_bim&view=default');

        $this->extra_sidebar = '';
    }

}
