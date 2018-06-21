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
class BimViewMeetings extends JViewLegacy {

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

        BimHelper::addSubmenu('meetings');

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

        $state = $this->get('State');
        $canDo = BimHelper::getActions($state->get('filter.category_id'));

        JToolBarHelper::title(JText::_('COM_BIM_TITLE_MEETINGS'), 'meetings.png');

        // Check if the form exists before showing the add/edit buttons
        $formPath = JPATH_COMPONENT_ADMINISTRATOR . '/views/meeting';

        if (file_exists($formPath)) {
            if ($canDo->get('core.create')) {
                JToolBarHelper::addNew('meeting.add', 'JTOOLBAR_NEW');
                JToolbarHelper::custom('meetings.duplicate', 'copy.png', 'copy_f2.png', 'JTOOLBAR_DUPLICATE', true);
            }

            if ($canDo->get('core.edit') && isset($this->items[0])) {
                JToolBarHelper::editList('meeting.edit', 'JTOOLBAR_EDIT');
            }
        }

        if ($canDo->get('core.edit.state')) {
            if (isset($this->items[0]->state)) {
                JToolBarHelper::divider();
                JToolBarHelper::custom('meetings.publish', 'publish.png', 'publish_f2.png', 'JTOOLBAR_PUBLISH', true);
                JToolBarHelper::custom('meetings.unpublish', 'unpublish.png', 'unpublish_f2.png', 'JTOOLBAR_UNPUBLISH', true);
            } elseif (isset($this->items[0])) {
                // If this component does not use state then show a direct delete button as we can not trash
                JToolBarHelper::deleteList('', 'meetings.delete', 'JTOOLBAR_DELETE');
            }

            if (isset($this->items[0]->state)) {
                JToolBarHelper::divider();
                JToolBarHelper::archiveList('meetings.archive', 'JTOOLBAR_ARCHIVE');
            }

            if (isset($this->items[0]->checked_out)) {
                JToolBarHelper::custom('meetings.checkin', 'checkin.png', 'checkin_f2.png', 'JTOOLBAR_CHECKIN', true);
            }
        }

        // Show trash and delete for components that uses the state field
        if (isset($this->items[0]->state)) {
            if ($state->get('filter.state') == -2 && $canDo->get('core.delete')) {
                JToolBarHelper::deleteList('', 'meetings.delete', 'JTOOLBAR_EMPTY_TRASH');
                JToolBarHelper::divider();
            } elseif ($canDo->get('core.edit.state')) {
                JToolBarHelper::trash('meetings.trash', 'JTOOLBAR_TRASH');
                JToolBarHelper::divider();
            }
        }

        if ($canDo->get('core.admin')) {
            JToolBarHelper::preferences('com_bim');
        }

        // Set sidebar action - New in 3.0
        JHtmlSidebar::setAction('index.php?option=com_bim&view=meetings');

        $this->extra_sidebar = '';
        JHtmlSidebar::addFilter(
                JText::_('JOPTION_SELECT_PUBLISHED'), 'filter_published', JHtml::_('select.options', JHtml::_('jgrid.publishedOptions'), "value", "text", $this->state->get('filter.state'), true)
        );
        //Filter for the field created_by
        $this->extra_sidebar .= '<div class="other-filters">';
        $this->extra_sidebar .= '<small><label for="filter_created_by">Created by</label></small>';
        $this->extra_sidebar .= JHtmlList::users('filter_created_by', $this->state->get('filter.created_by'), 1, 'onchange="this.form.submit();"');
        $this->extra_sidebar .= '</div>';
        //Filter for the field date
        $this->extra_sidebar .= '<div class="other-filters">';
        $this->extra_sidebar .= '<small><label for="filter_from_date">' . JText::sprintf('COM_BIM_FROM_FILTER', 'Date') . '</label></small>';
        $this->extra_sidebar .= JHtml::_('calendar', $this->state->get('filter.date.from'), 'filter_from_date', 'filter_from_date', '%Y-%m-%d', array('style' => 'width:142px;', 'onchange' => 'this.form.submit();'));
        $this->extra_sidebar .= '<small><label for="filter_to_date">' . JText::sprintf('COM_BIM_TO_FILTER', 'Date') . '</label></small>';
        $this->extra_sidebar .= JHtml::_('calendar', $this->state->get('filter.date.to'), 'filter_to_date', 'filter_to_date', '%Y-%m-%d', array('style' => 'width:142px;', 'onchange' => 'this.form.submit();'));
        $this->extra_sidebar .= '</div>';
        $this->extra_sidebar .= '<hr class="hr-condensed">';

        //Filter for the field kpi;
        jimport('joomla.form.form');
        $options = array();
        JForm::addFormPath(JPATH_COMPONENT . '/models/forms');
        $form = JForm::getInstance('com_bim.meeting', 'meeting');

        $field = $form->getField('kpi');

        $query = $form->getFieldAttribute('filter_kpi', 'query');
        $translate = $form->getFieldAttribute('filter_kpi', 'translate');
        $key = $form->getFieldAttribute('filter_kpi', 'key_field');
        $value = $form->getFieldAttribute('filter_kpi', 'value_field');

        // Get the database object.
        $db = JFactory::getDBO();

        // Set the query and get the result list.
        $db->setQuery($query);
        $items = $db->loadObjectlist();

        // Build the field options.
        if (!empty($items)) {
            foreach ($items as $item) {
                if ($translate == true) {
                    $options[] = JHtml::_('select.option', $item->$key, JText::_($item->$value));
                } else {
                    $options[] = JHtml::_('select.option', $item->$key, $item->$value);
                }
            }
        }

        JHtmlSidebar::addFilter(
                '$KPI', 'filter_kpi', JHtml::_('select.options', $options, "value", "text", $this->state->get('filter.kpi')), true
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
            'a.`created_by`' => JText::_('COM_BIM_MEETINGS_CREATED_BY'),
            'a.`title`' => JText::_('COM_BIM_MEETINGS_TITLE'),
            'a.`date`' => JText::_('COM_BIM_MEETINGS_DATE'),
            'a.`reference`' => JText::_('COM_BIM_MEETINGS_REFERENCE'),
            'a.`kpi`' => JText::_('COM_BIM_MEETINGS_KPI'),
        );
    }

}
