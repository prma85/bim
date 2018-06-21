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
 * View class for a list of Bim.
 *
 * @since  1.6
 */
class BimViewAudits extends JViewLegacy {

    protected $items;
    protected $pagination;
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
        $this->items = $this->get('Items');
        $this->pagination = $this->get('Pagination');

        // Check for errors.
        if (count($errors = $this->get('Errors'))) {
            throw new Exception(implode("\n", $errors));
        }
        
        $layout = JFactory::getApplication()->input->getCmd('layout', 'default');
        
        if ($layout == 'detail') {
            $id = JFactory::getApplication()->input->getInt('id', '');
            if ($id){
                $db = JFactory::getDbo();
                $db->setQuery('select a.*, b.name from #__bim_audit as a LEFT JOIN #__users as b ON b.id=a.modified_by where a.id = '.$id);
                $this->data = $db->loadObject();
                JFactory::getApplication()->input->set('tmpl', 'component');
            }
        }

        BimHelper::addSubmenu('audits');

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

        JToolBarHelper::title(JText::_('COM_BIM_TITLE_AUDITS'), 'audits.png');

        // Set sidebar action - New in 3.0
        JHtmlSidebar::setAction('index.php?option=com_bim&view=audits');

        $this->extra_sidebar = '';
        JHtmlSidebar::addFilter(
                JText::_('JOPTION_SELECT_PUBLISHED'), 'filter_published', JHtml::_('select.options', JHtml::_('jgrid.publishedOptions'), "value", "text", $this->state->get('filter.state'), true)
        );
        //Filter for the field modified
        $this->extra_sidebar .= '<div class="other-filters">';
        $this->extra_sidebar .= '<small><label for="filter_from_modified">' . JText::sprintf('COM_BIM_FROM_FILTER', 'Modified Date') . '</label></small>';
        $this->extra_sidebar .= JHtml::_('calendar', $this->state->get('filter.modified.from'), 'filter_from_modified', 'filter_from_modified', '%Y-%m-%d', array('style' => 'width:142px;', 'onchange' => 'this.form.submit();'));
        $this->extra_sidebar .= '<small><label for="filter_to_modified">' . JText::sprintf('COM_BIM_TO_FILTER', 'Modified Date') . '</label></small>';
        $this->extra_sidebar .= JHtml::_('calendar', $this->state->get('filter.modified.to'), 'filter_to_modified', 'filter_to_modified', '%Y-%m-%d', array('style' => 'width:142px;', 'onchange' => 'this.form.submit();'));
        $this->extra_sidebar .= '</div>';
        $this->extra_sidebar .= '<hr class="hr-condensed">';

        //Filter for the field modified_by
        $this->extra_sidebar .= '<div class="other-filters">';
        $this->extra_sidebar .= '<small><label for="filter_modified_by">Modified by</label></small>';
        $this->extra_sidebar .= JHtmlList::users('filter_modified_by', $this->state->get('filter.modified_by'), 1, 'onchange="this.form.submit();"');
        $this->extra_sidebar .= '</div>';
        //Filter for the field action
        $select_label = JText::sprintf('COM_BIM_FILTER_SELECT_LABEL', 'Action Type');
        $options = array();
        $options[0] = new stdClass();
        $options[0]->value = "0";
        $options[0]->text = "New";
        $options[1] = new stdClass();
        $options[1]->value = "1";
        $options[1]->text = "Change";
        $options[2] = new stdClass();
        $options[2]->value = "2";
        $options[2]->text = "Delete";
        JHtmlSidebar::addFilter(
                $select_label, 'filter_action', JHtml::_('select.options', $options, "value", "text", $this->state->get('filter.action'), true)
        );

        //Filter for the field where
        $select_label = JText::sprintf('COM_BIM_FILTER_SELECT_LABEL', 'Where');
        $options = array();
        $options[0] = new stdClass();
        $options[0]->value = "kpis";
        $options[0]->text = "KPIs";
        $options[1] = new stdClass();
        $options[1]->value = "meeting";
        $options[1]->text = "Meeting";
        $options[2] = new stdClass();
        $options[2]->value = "goals";
        $options[2]->text = "Goals";
        $options[3] = new stdClass();
        $options[3]->value = "values";
        $options[3]->text = "Values";
        JHtmlSidebar::addFilter(
                $select_label, 'filter_where', JHtml::_('select.options', $options, "value", "text", $this->state->get('filter.where'), true)
        );
    }

    /**
     * Method to order fields 
     *
     * @return void 
     */
    protected function getSortFields() {
        return array(
            'a.`id`' => JText::_('JGRID_HEADING_ID'),
            'a.`ordering`' => JText::_('JGRID_HEADING_ORDERING'),
            'a.`state`' => JText::_('JSTATUS'),
            'a.`modified`' => JText::_('COM_BIM_AUDITS_MODIFIED'),
            'a.`modified_by`' => JText::_('COM_BIM_AUDITS_MODIFIED_BY'),
            'a.`action`' => JText::_('COM_BIM_AUDITS_ACTION'),
            'a.`where`' => JText::_('COM_BIM_AUDITS_WHERE'),
        );
    }

}
