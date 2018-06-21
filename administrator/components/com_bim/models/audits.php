<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Bim
 * @author     Paulo Andrade & Vaikunth Vijayaraghavan <martinsp@uregina.ca>
 * @copyright  Copyright (C) 2016. All rights reserved.
 * @license    GNU General Public License version 2; see the file License. txt
 */
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Bim records.
 *
 * @since  1.6
 */
class BimModelAudits extends JModelList {

    /**
     * Constructor.
     *
     * @param   array  $config  An optional associative array of configuration settings.
     *
     * @see        JController
     * @since      1.6
     */
    public function __construct($config = array()) {
        if (empty($config['filter_fields'])) {
            $config['filter_fields'] = array(
                'id', 'a.`id`',
                'ordering', 'a.`ordering`',
                'state', 'a.`state`',
                'modified', 'a.`modified`',
                'modified_by', 'a.`modified_by`',
                'original', 'a.`original`',
                'new', 'a.`new`',
                'action', 'a.`action`',
                'where', 'a.`where`',
            );
        }

        parent::__construct($config);
    }

    /**
     * Method to auto-populate the model state.
     *
     * Note. Calling getState in this method will result in recursion.
     *
     * @param   string  $ordering   Elements order
     * @param   string  $direction  Order direction
     *
     * @return void
     *
     * @throws Exception
     */
    protected function populateState($ordering = null, $direction = null) {
        // Initialise variables.
        $app = JFactory::getApplication('administrator');

        // Load the filter state.
        $search = $app->getUserStateFromRequest($this->context . '.filter.search', 'filter_search');
        $this->setState('filter.search', $search);

        $published = $app->getUserStateFromRequest($this->context . '.filter.state', 'filter_published', '', 'string');
        $this->setState('filter.state', $published);
        // Filtering modified
        $this->setState('filter.modified.from', $app->getUserStateFromRequest($this->context . '.filter.modified.from', 'filter_from_modified', '', 'string'));
        $this->setState('filter.modified.to', $app->getUserStateFromRequest($this->context . '.filter.modified.to', 'filter_to_modified', '', 'string'));

        // Filtering modified_by
        $this->setState('filter.modified_by', $app->getUserStateFromRequest($this->context . '.filter.modified_by', 'filter_modified_by', '', 'string'));

        // Filtering action
        $this->setState('filter.action', $app->getUserStateFromRequest($this->context . '.filter.action', 'filter_action', '', 'string'));

        // Filtering where
        $this->setState('filter.where', $app->getUserStateFromRequest($this->context . '.filter.where', 'filter_where', '', 'string'));


        // Load the parameters.
        $params = JComponentHelper::getParams('com_bim');
        $this->setState('params', $params);

        // List state information.
        parent::populateState('a.id', 'desc');
    }

    /**
     * Method to get a store id based on model configuration state.
     *
     * This is necessary because the model is used by the component and
     * different modules that might need different sets of data or different
     * ordering requirements.
     *
     * @param   string  $id  A prefix for the store id.
     *
     * @return   string A store id.
     *
     * @since    1.6
     */
    protected function getStoreId($id = '') {
        // Compile the store id.
        $id .= ':' . $this->getState('filter.search');
        $id .= ':' . $this->getState('filter.state');

        return parent::getStoreId($id);
    }

    /**
     * Build an SQL query to load the list data.
     *
     * @return   JDatabaseQuery
     *
     * @since    1.6
     */
    protected function getListQuery() {
        // Create a new query object.
        $db = $this->getDbo();
        $query = $db->getQuery(true);

        // Select the required fields from the table.
        $query->select(
                $this->getState(
                        'list.select', 'DISTINCT a.*'
                )
        );
        $query->from('`#__bim_audit` AS a');

        // Join over the users for the checked out user
        $query->select("uc.name AS editor");
        $query->join("LEFT", "#__users AS uc ON uc.id=a.checked_out");

        // Join over the user field 'modified_by'
        $query->select('`modified_by`.name AS `modified_by`');
        $query->join('LEFT', '#__users AS `modified_by` ON `modified_by`.id = a.`modified_by`');

        // Filter by published state
        $published = $this->getState('filter.state');

        if (is_numeric($published)) {
            $query->where('a.state = ' . (int) $published);
        } elseif ($published === '') {
            $query->where('(a.state IN (0, 1))');
        }

        // Filter by search in title
        $search = $this->getState('filter.search');

        if (!empty($search)) {
            if (stripos($search, 'id:') === 0) {
                $query->where('a.id = ' . (int) substr($search, 3));
            } else {
                $search = $db->Quote('%' . $db->escape($search, true) . '%');
            }
        }


        //Filtering modified
        $filter_modified_from = $this->state->get("filter.modified.from");
        if ($filter_modified_from) {
            $query->where("a.`modified` >= '" . $db->escape($filter_modified_from) . "'");
        }
        $filter_modified_to = $this->state->get("filter.modified.to");
        if ($filter_modified_to) {
            $query->where("a.`modified` <= '" . $db->escape($filter_modified_to) . "'");
        }

        //Filtering modified_by
        $filter_modified_by = $this->state->get("filter.modified_by");
        if ($filter_modified_by) {
            $query->where("a.`modified_by` = '" . $db->escape($filter_modified_by) . "'");
        }

        //Filtering action
        $filter_action = $this->state->get("filter.action");
        if ($filter_action) {
            $query->where("a.`action` = '" . $db->escape($filter_action) . "'");
        }

        //Filtering where
        $filter_where = $this->state->get("filter.where");
        if ($filter_where) {
            $query->where("a.`where` = '" . $db->escape($filter_where) . "'");
        }
        // Add the list ordering clause.
        $orderCol = $this->state->get('list.ordering');
        $orderDirn = $this->state->get('list.direction');

        if ($orderCol && $orderDirn) {
            $query->order($db->escape($orderCol . ' ' . $orderDirn));
        }

        return $query;
    }

    /**
     * Get an array of data items
     *
     * @return mixed Array of data items on success, false on failure.
     */
    public function getItems() {
        $items = parent::getItems();

        foreach ($items as $oneItem) {
            $oneItem->action = JText::_('COM_BIM_AUDITS_ACTION_OPTION_' . strtoupper($oneItem->action));
            $oneItem->where = JText::_('COM_BIM_AUDITS_WHERE_OPTION_' . strtoupper($oneItem->where));
        }
        return $items;
    }

}
