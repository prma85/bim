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
class BimViewKpis extends JViewLegacy {

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

        BimHelper::addSubmenu('kpis');

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
        $user = JFactory::getUser();
        $params = JComponentHelper::getParams('com_bim');
        $responsible = FALSE;

        if (in_array($params->get('responsible'), $user->groups) && !in_array($params->get('admin'), $user->groups)) {
            $responsible = TRUE;
        }

        JToolBarHelper::title(JText::_('COM_BIM_TITLE_KPIS'), 'kpis.png');

        // Check if the form exists before showing the add/edit buttons
        $formPath = JPATH_COMPONENT_ADMINISTRATOR . '/views/kpi';

        if (file_exists($formPath)) {
            if ($canDo->get('core.create')) {
                if (!$responsible) {
                    JToolBarHelper::addNew('kpi.add', 'JTOOLBAR_NEW');
                    JToolbarHelper::custom('kpis.duplicate', 'copy.png', 'copy_f2.png', 'JTOOLBAR_DUPLICATE', true);
                }
            }

            if ($canDo->get('core.edit') && isset($this->items[0])) {
                JToolBarHelper::editList('kpi.edit', 'JTOOLBAR_EDIT');
            }
        }

        if ($canDo->get('core.edit.state')) {
            if (isset($this->items[0]->state)) {
                JToolBarHelper::divider();
                JToolBarHelper::custom('kpis.publish', 'publish.png', 'publish_f2.png', 'JTOOLBAR_PUBLISH', true);
                JToolBarHelper::custom('kpis.unpublish', 'unpublish.png', 'unpublish_f2.png', 'JTOOLBAR_UNPUBLISH', true);
            } elseif (isset($this->items[0])) {
                // If this component does not use state then show a direct delete button as we can not trash
                JToolBarHelper::deleteList('', 'kpis.delete', 'JTOOLBAR_DELETE');
            }

            if (!$responsible) {
                if (isset($this->items[0]->state)) {
                    JToolBarHelper::divider();
                    JToolBarHelper::archiveList('kpis.archive', 'JTOOLBAR_ARCHIVE');
                }
            }

            if (isset($this->items[0]->checked_out)) {
                JToolBarHelper::custom('kpis.checkin', 'checkin.png', 'checkin_f2.png', 'JTOOLBAR_CHECKIN', true);
            }
        }

        // Show trash and delete for components that uses the state field
        if (!$responsible) {
            if (isset($this->items[0]->state)) {
                if ($state->get('filter.state') == -2 && $canDo->get('core.delete')) {
                    JToolBarHelper::deleteList('', 'kpis.delete', 'JTOOLBAR_EMPTY_TRASH');
                    JToolBarHelper::divider();
                } elseif ($canDo->get('core.edit.state')) {
                    JToolBarHelper::trash('kpis.trash', 'JTOOLBAR_TRASH');
                    JToolBarHelper::divider();
                }
            }
        }

        if ($canDo->get('core.admin')) {
            JToolBarHelper::preferences('com_bim');
        }

        // Set sidebar action - New in 3.0
        JHtmlSidebar::setAction('index.php?option=com_bim&view=kpis');

        $this->extra_sidebar = '';
        JHtmlSidebar::addFilter(
                JText::_('JOPTION_SELECT_PUBLISHED'), 'filter_published', JHtml::_('select.options', JHtml::_('jgrid.publishedOptions'), "value", "text", $this->state->get('filter.state'), true)
        );
        //Filter for the field responsible
        $this->extra_sidebar .= '<div class="other-filters">';
        $this->extra_sidebar .= '<small><label for="filter_responsible">Responsible</label></small>';
        $this->extra_sidebar .= JHtmlList::users('filter_responsible', $this->state->get('filter.responsible'), 1, 'onchange="this.form.submit();"');
        $this->extra_sidebar .= '</div>';
        //Filter for the field unit;
        jimport('joomla.form.form');
        $options = array();
        JForm::addFormPath(JPATH_COMPONENT . '/models/forms');
        $form = JForm::getInstance('com_bim.kpi', 'kpi');

        $field = $form->getField('unit');

        $query = $form->getFieldAttribute('filter_unit', 'query');
        $translate = $form->getFieldAttribute('filter_unit', 'translate');
        $key = $form->getFieldAttribute('filter_unit', 'key_field');
        $value = $form->getFieldAttribute('filter_unit', 'value_field');

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
                '$Business Unit', 'filter_unit', JHtml::_('select.options', $options, "value", "text", $this->state->get('filter.unit')), true
        );
        JHtmlSidebar::addFilter(
                JText::_("JOPTION_SELECT_CATEGORY"), 'filter_category', JHtml::_('select.options', JHtml::_('category.options', 'com_bim'), "value", "text", $this->state->get('filter.category'))
        );

        //Filter for the field type
        $select_label = JText::sprintf('COM_BIM_FILTER_SELECT_LABEL', 'Type');
        $options = array();
        $options[0] = new stdClass();
        $options[0]->value = "percentual";
        $options[0]->text = "% Percentual";
        $options[1] = new stdClass();
        $options[1]->value = "currency";
        $options[1]->text = "$ Currency";
        $options[2] = new stdClass();
        $options[2]->value = "number";
        $options[2]->text = "x Number";
        JHtmlSidebar::addFilter(
                $select_label, 'filter_type', JHtml::_('select.options', $options, "value", "text", $this->state->get('filter.type'), true)
        );

        //Filter for the field periodicity
        $select_label = JText::sprintf('COM_BIM_FILTER_SELECT_LABEL', 'Periodicity');
        $options = array();
        $options[0] = new stdClass();
        $options[0]->value = "1";
        $options[0]->text = "Monthly";
        $options[1] = new stdClass();
        $options[1]->value = "2";
        $options[1]->text = "Bimonthly";
        $options[2] = new stdClass();
        $options[2]->value = "3";
        $options[2]->text = "Quarterly";
        $options[3] = new stdClass();
        $options[3]->value = "6";
        $options[3]->text = "Semester";
        $options[4] = new stdClass();
        $options[4]->value = "12";
        $options[4]->text = "Yearly";
        JHtmlSidebar::addFilter(
                $select_label, 'filter_periodicity', JHtml::_('select.options', $options, "value", "text", $this->state->get('filter.periodicity'), true)
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
            'a.`title`' => JText::_('COM_BIM_KPIS_TITLE'),
            'a.`responsible`' => JText::_('COM_BIM_KPIS_RESPONSIBLE'),
            'a.`unit`' => JText::_('COM_BIM_KPIS_UNIT'),
            'a.`category`' => JText::_('COM_BIM_KPIS_CATEGORY'),
            'a.`type`' => JText::_('COM_BIM_KPIS_TYPE'),
            'a.`periodicity`' => JText::_('COM_BIM_KPIS_PERIODICITY'),
        );
    }

}
