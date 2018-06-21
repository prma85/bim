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
class BimModelKpis extends JModelList {

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
                'title', 'a.`title`',
                'alias', 'a.`alias`',
                'title_fr', 'a.`title_fr`',
                'alias_fr', 'a.`alias_fr`',
                'responsible', 'a.`responsible`',
                'unit', 'a.`unit`',
                'category', 'a.`category`',
                'type', 'a.`type`',
                'increase', 'a.`increase`',
                'periodicity', 'a.`periodicity`',
                'color', 'a.`color`',
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
        // Filtering responsible
        $this->setState('filter.responsible', $app->getUserStateFromRequest($this->context . '.filter.responsible', 'filter_responsible', '', 'string'));

        // Filtering unit
        $this->setState('filter.unit', $app->getUserStateFromRequest($this->context . '.filter.unit', 'filter_unit', '', 'string'));

        // Filtering category
        $this->setState('filter.category', $app->getUserStateFromRequest($this->context . '.filter.category', 'filter_category', '', 'string'));

        // Filtering type
        $this->setState('filter.type', $app->getUserStateFromRequest($this->context . '.filter.type', 'filter_type', '', 'string'));

        // Filtering periodicity
        $this->setState('filter.periodicity', $app->getUserStateFromRequest($this->context . '.filter.periodicity', 'filter_periodicity', '', 'string'));


        // Load the parameters.
        $params = JComponentHelper::getParams('com_bim');
        $this->setState('params', $params);

        // List state information.
        parent::populateState('a.title', 'asc');
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
        $query->from('`#__bim_kpi` AS a');

        // Join over the users for the checked out user
        $query->select("uc.name AS editor");
        $query->join("LEFT", "#__users AS uc ON uc.id=a.checked_out");

        // Join over the user field 'created_by'
        $query->select('`created_by`.name AS `created_by`');
        $query->join('LEFT', '#__users AS `created_by` ON `created_by`.id = a.`created_by`');

        // Join over the user field 'modified_by'
        $query->select('`modified_by`.name AS `modified_by`');
        $query->join('LEFT', '#__users AS `modified_by` ON `modified_by`.id = a.`modified_by`');


        // Join over the user field 'responsible'
        $query->select('`responsible`.name AS `responsible`');
        $query->join('LEFT', '#__users AS `responsible` ON `responsible`.id = a.`responsible`');

        // Join over the foreign key 'unit'
        $query->select('`unit`.title AS `unit`');
        $query->join('LEFT', '#__usergroups AS `unit` ON `unit`.id = a.`unit`');

        // Join over the category 'category'
        $query->select('`category`.title AS `category`');
        $query->join('LEFT', '#__bim_category AS `category` ON `category`.id = a.`category`');

        // Filter by published state
        $published = $this->getState('filter.state');

        if (is_numeric($published)) {
            $query->where('a.state = ' . (int) $published);
        } elseif ($published === '') {
            $query->where('(a.state IN (0, 1))');
        }
        
        $user = JFactory::getUser();
        $params = JComponentHelper::getParams('com_bim');
        
        if (in_array($params->get('responsible'), $user->groups)) {
            $query->where('a.responsible = '.$user->id);
        }

        // Filter by search in title
        $search = $this->getState('filter.search');

        if (!empty($search)) {
            if (stripos($search, 'id:') === 0) {
                $query->where('a.id = ' . (int) substr($search, 3));
            } else {
                $search = $db->Quote('%' . $db->escape($search, true) . '%');
                $query->where('( a.`title` LIKE ' . $search . '  OR  a.`title_fr` LIKE ' . $search . '  OR  `responsible`.name LIKE ' . $search . '  OR  `unit`.title LIKE ' . $search . '  OR  `category`.title LIKE ' . $search . '  OR  a.`type` LIKE ' . $search . '  OR  a.`periodicity` LIKE ' . $search . ' )');
            }
        }

        //Filtering responsible
        $filter_responsible = $this->state->get("filter.responsible");
        if ($filter_responsible) {
            $query->where("a.`responsible` = '" . $db->escape($filter_responsible) . "'");
        }

        //Filtering unit
        $filter_unit = $this->state->get("filter.unit");
        if ($filter_unit) {
            $query->where("a.`unit` = '" . $db->escape($filter_unit) . "'");
        }

        //Filtering category
        $filter_category = $this->state->get("filter.category");
        if ($filter_category) {
            $query->where("a.`category` = '" . $db->escape($filter_category) . "'");
        }

        //Filtering type
        $filter_type = $this->state->get("filter.type");
        if ($filter_type) {
            $query->where("a.`type` = '" . $db->escape($filter_type) . "'");
        }

        //Filtering periodicity
        $filter_periodicity = $this->state->get("filter.periodicity");
        if ($filter_periodicity) {
            $query->where("a.`periodicity` = '" . $db->escape($filter_periodicity) . "'");
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

            if (isset($oneItem->unit)) {
                $values = explode(',', $oneItem->unit);

                $textValue = array();
                foreach ($values as $value) {
                    $db = JFactory::getDbo();
                    $query = $db->getQuery(true);
                    $query
                            ->select($db->quoteName('title'))
                            ->from('`#__usergroups`')
                            ->where($db->quoteName('id') . ' = ' . $db->quote($db->escape($value)));
                    $db->setQuery($query);
                    $results = $db->loadObject();
                    if ($results) {
                        $textValue[] = $results->title;
                    }
                }

                $oneItem->unit = !empty($textValue) ? implode(', ', $textValue) : $oneItem->unit;
            }
            
            if (isset($oneItem->category)) {
                $values = explode(',', $oneItem->category);

                $textValue = array();
                foreach ($values as $value) {
                    $db = JFactory::getDbo();
                    $query = $db->getQuery(true);
                    $query
                            ->select($db->quoteName('title'))
                            ->from('`#__bim_category`')
                            ->where($db->quoteName('id') . ' = ' . $db->quote($db->escape($value)));
                    $db->setQuery($query);
                    $results = $db->loadObject();
                    if ($results) {
                        $textValue[] = $results->title;
                    }
                }

                $oneItem->category = !empty($textValue) ? implode(', ', $textValue) : $oneItem->category;
            }
            
            $oneItem->type = JText::_('COM_BIM_KPIS_TYPE_OPTION_' . strtoupper($oneItem->type));
            $oneItem->periodicity = JText::_('COM_BIM_KPIS_PERIODICITY_OPTION_' . strtoupper($oneItem->periodicity));
        }
        return $items;
    }

}
