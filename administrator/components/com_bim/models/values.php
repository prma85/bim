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
class BimModelValues extends JModelList {

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
                'asset_id', 'a.`asset_id`',
                'ordering', 'a.`ordering`',
                'state', 'a.`state`',
                'created', 'a.`created`',
                'created_by', 'a.`created_by`',
                'modified', 'a.`modified`',
                'modified_by', 'a.`modified_by`',
                'kpi', 'a.`kpi`',
                'month', 'a.`month`',
                'goals', 'a.`goals`',
                'value', 'a.`value`',
                'version', 'a.`version`',
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
        // Filtering created_by
        $this->setState('filter.created_by', $app->getUserStateFromRequest($this->context . '.filter.created_by', 'filter_created_by', '', 'string'));

        // Filtering kpi
        $this->setState('filter.kpi', $app->getUserStateFromRequest($this->context . '.filter.kpi', 'filter_kpi', '', 'string'));


        // Load the parameters.
        $params = JComponentHelper::getParams('com_bim');
        $this->setState('params', $params);

        // List state information.
        parent::populateState('a.kpi', 'asc');
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
        $query->from('`#__bim_values` AS a');

        // Join over the users for the checked out user
        $query->select("uc.name AS editor");
        $query->join("LEFT", "#__users AS uc ON uc.id=a.checked_out");

        // Join over the user field 'created_by'
        $query->select('`created_by`.name AS `created_by`');
        $query->join('LEFT', '#__users AS `created_by` ON `created_by`.id = a.`created_by`');

        // Join over the user field 'modified_by'
        $query->select('`modified_by`.name AS `modified_by`');
        $query->join('LEFT', '#__users AS `modified_by` ON `modified_by`.id = a.`modified_by`');

        // Join over the foreign key 'kpi'
        $query->select('`kpi`.title AS kpi, `kpi`.id AS kpiid,`kpi`.id AS kpi_id');
        $query->join('LEFT', '#__bim_kpi AS `kpi` ON kpi.`id` = a.`kpi`');

        // Join over the foreign key 'goals'
        $query->select('`goals`.year AS goals, `goals`.id AS goals_id');
        $query->join('LEFT', '#__bim_goals AS `goals` ON goals.`id` = a.`goals`');
        // Filter by published state
        $published = $this->getState('filter.state');

        if (is_numeric($published)) {
            $query->where('a.state = ' . (int) $published);
        } elseif ($published === '') {
            $query->where('(a.state IN (0, 1))');
        }

        $user = JFactory::getUser();
        $params = JComponentHelper::getParams('com_bim');

        if (in_array($params->get('employee'), $user->groups)) {
            $listUnits = implode(',', $user->groups);
            $newWhere = ' `kpi`.unit in (' . $listUnits . ')';
            $query->where($newWhere);
        }

        if (in_array($params->get('responsible'), $user->groups)) {
            $query->where('`kpi`.responsible = ' . $user->id);
        }

        // Filter by search in title
        $search = $this->getState('filter.search');

        if (!empty($search)) {
            if (stripos($search, 'id:') === 0) {
                $query->where('a.id = ' . (int) substr($search, 3));
            } else {
                $search = $db->Quote('%' . $db->escape($search, true) . '%');
                $query->where('( `kpi`.title LIKE ' . $search . ' OR a.value LIKE ' . $search . ')');
            }
        }


        //Filtering created_by
        $filter_created_by = $this->state->get("filter.created_by");
        if ($filter_created_by) {
            $query->where("a.`created_by` = '" . $db->escape($filter_created_by) . "'");
        }

        //Filtering kpi
        $filter_kpi = $this->state->get("filter.kpi");
        if ($filter_kpi) {
            $query->where("a.`kpi` = '" . $db->escape($filter_kpi) . "'");
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

            if (isset($oneItem->kpiid)) {
                $values = explode(',', $oneItem->kpiid);

                $textValue = array();
                foreach ($values as $value) {
                    $db = JFactory::getDbo();
                    $query = $db->getQuery(true);
                    $query
                            ->select($db->quoteName('title'))
                            ->from('`#__bim_kpi`')
                            ->where($db->quoteName('id') . ' = ' . $db->quote($db->escape($value)));
                    $db->setQuery($query);
                    $results = $db->loadObject();
                    if ($results) {
                        $textValue[] = $results->title;
                    }
                }

                $oneItem->kpi = !empty($textValue) ? implode(', ', $textValue) : $oneItem->kpi;
            }

            if (isset($oneItem->goals)) {
                $values = explode(',', $oneItem->goals);

                $textValue = array();
                foreach ($values as $value) {
                    $db = JFactory::getDbo();
                    $query = $db->getQuery(true);
                    $query
                            ->select($db->quoteName('year'))
                            ->from('`#__bim_goals`')
                            ->where($db->quoteName('id') . ' = ' . $db->quote($db->escape($value)));
                    $db->setQuery($query);
                    $results = $db->loadObject();
                    if ($results) {
                        $textValue[] = $results->year;
                    }
                }

                $oneItem->goals = !empty($textValue) ? implode(', ', $textValue) : $oneItem->goals;
            }
        }
        return $items;
    }

}
