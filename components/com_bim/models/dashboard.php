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
class BimModelDashboard extends JModelList {

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
     *
     * @since    1.6
     */
    protected function populateState($ordering = null, $direction = null) {
        // Initialise variables.
        $app = JFactory::getApplication();

        // List state information
        $limit = $app->getUserStateFromRequest('global.list.limit', 'limit', $app->get('list_limit'));
        $this->setState('list.limit', $limit);

        $limitstart = $app->getUserStateFromRequest('limitstart', 'limitstart', 0);
        $this->setState('list.start', $limitstart);

        if ($list = $app->getUserStateFromRequest($this->context . '.list', 'list', array(), 'array')) {
            foreach ($list as $name => $value) {
                // Extra validations
                switch ($name) {
                    case 'fullordering':
                        $orderingParts = explode(' ', $value);

                        if (count($orderingParts) >= 2) {
                            // Latest part will be considered the direction
                            $fullDirection = end($orderingParts);

                            if (in_array(strtoupper($fullDirection), array('ASC', 'DESC', ''))) {
                                $this->setState('list.direction', $fullDirection);
                            }

                            unset($orderingParts[count($orderingParts) - 1]);

                            // The rest will be the ordering
                            $fullOrdering = implode(' ', $orderingParts);

                            if (in_array($fullOrdering, $this->filter_fields)) {
                                $this->setState('list.ordering', $fullOrdering);
                            }
                        } else {
                            $this->setState('list.ordering', $ordering);
                            $this->setState('list.direction', $direction);
                        }
                        break;

                    case 'ordering':
                        if (!in_array($value, $this->filter_fields)) {
                            $value = $ordering;
                        }
                        break;

                    case 'direction':
                        if (!in_array(strtoupper($value), array('ASC', 'DESC', ''))) {
                            $value = $direction;
                        }
                        break;

                    case 'limit':
                        $limit = $value;
                        break;

                    // Just to keep the default case
                    default:
                        $value = $value;
                        break;
                }

                $this->setState('list.' . $name, $value);
            }
        }

        // Receive & set filters
        if ($filters = $app->getUserStateFromRequest($this->context . '.filter', 'filter', array(), 'array')) {
            foreach ($filters as $name => $value) {
                $this->setState('filter.' . $name, $value);
            }
        }

        $ordering = $app->input->get('filter_order');

        if (!empty($ordering)) {
            $list = $app->getUserState($this->context . '.list');
            $list['ordering'] = $app->input->get('filter_order');
            $app->setUserState($this->context . '.list', $list);
        }

        $orderingDirection = $app->input->get('filter_order_Dir');

        if (!empty($orderingDirection)) {
            $list = $app->getUserState($this->context . '.list');
            $list['direction'] = $app->input->get('filter_order_Dir');
            $app->setUserState($this->context . '.list', $list);
        }

        $list = $app->getUserState($this->context . '.list');

        if (empty($list['ordering'])) {
            $list['ordering'] = 'ordering';
        }

        if (empty($list['direction'])) {
            $list['direction'] = 'asc';
        }

        if (isset($list['ordering'])) {
            $this->setState('list.ordering', $list['ordering']);
        }

        if (isset($list['direction'])) {
            $this->setState('list.direction', $list['direction']);
        }
    }

    /**
     * Build an SQL query to load the list data.
     *
     * @return   JDatabaseQuery
     *
     * @since    1.6
     */
    protected function getListQuery() {
        $db = $this->getDbo();
        $query = $db->getQuery(true);

        return $query;
    }

    /**
     * Method to get an array of data items
     *
     * @return  mixed An array of data on success, false on failure.
     */
    public function getItems() {
        require_once JPATH_COMPONENT . '/helpers/bim.php';

        $db = JFactory::getDbo();
        $query = $db->getQuery(true);

        // Select the required fields from the table.
        $query->select('DISTINCT a.*');
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
        $query->select('`unit`.title AS `unit`, `unit`.id AS `unit_id`');
        $query->join('LEFT', '#__usergroups AS `unit` ON `unit`.id = a.`unit`');

        // Join over the category 'category'
        $query->select('`category`.title AS `category`');
        $query->join('LEFT', '#__bim_category AS `category` ON `category`.id = a.`category`');

        $query->where('a.state = 1');
        $query->order('title asc');

        $db->setQuery($query);
        $result = $db->loadAssocList();

        if (!$result) {
            return array();
        }
        $items = array();

        //$item->objective = ArrayHelper::fromObject($item->objective);

        foreach ($result as $item) {

            $item['periodicity_desc'] = JText::_('COM_BIM_KPIS_PERIODICITY_OPTION_' . $item['periodicity']);

            $db->setQuery('select * from #__bim_goals where state = 1 and kpi = ' . $item['id'] . ' order by year desc');
            $lastGoal = $db->loadAssoc();
            $item['goals'] = array();
            if ($lastGoal) {
                $lastGoal['values'] = Joomla\Utilities\ArrayHelper::fromObject(json_decode($lastGoal['values']));

                $i = 0;
                foreach ($lastGoal['values'] as $v) {
                    $item['goals'][$i] = array(
                        'month' => $v['month'],
                        'value' => $v['goal'],
                        'month_desc' => BimFrontendHelper::getMonth($v['month']),
                    );
                    $i++;
                }
                $item['year'] = $lastGoal['year'];
                $item['goals_id'] = $lastGoal['id'];
                $item['goals_size'] = count($item['goals']);
            } else {
                $item['year'] = date('Y');
                $item['goals_id'] = 0;
                $item['goals_size'] = 0;
            }

            $db->setQuery('select * from #__bim_values where state = 1 and kpi = ' . $item['id'] . ' and goals = ' . $item['goals_id'] . ' order by month asc');
            $tempValues = $db->loadAssocList();
            $item['values'] = array();
            if ($tempValues) {
                $j = 0;
                foreach ($tempValues as $t) {
                    $item['values'][$j] = array(
                        'month' => $t['month'],
                        'value' => $t['value'],
                        'month_desc' => BimFrontendHelper::getMonth($t['month']),
                    );
                    $j++;
                }
                $item['values_size'] = count($item['values']);
            } else {
                $item['values_size'] = 0;
            }

            $items[$item['id']] = $item;
        }

        return $items;
    }

    /**
     * Overrides the default function to check Date fields format, identified by
     * "_dateformat" suffix, and erases the field if it's not correct.
     *
     * @return void
     */
    protected function loadFormData() {
        $app = JFactory::getApplication();
        $filters = $app->getUserState($this->context . '.filter', array());
        $error_dateformat = false;

        foreach ($filters as $key => $value) {
            if (strpos($key, '_dateformat') && !empty($value) && $this->isValidDate($value) == null) {
                $filters[$key] = '';
                $error_dateformat = true;
            }
        }

        if ($error_dateformat) {
            $app->enqueueMessage(JText::_("COM_BIM_SEARCH_FILTER_DATE_FORMAT"), "warning");
            $app->setUserState($this->context . '.filter', $filters);
        }

        return parent::loadFormData();
    }

    /**
     * Checks if a given date is valid and in a specified format (YYYY-MM-DD)
     *
     * @param   string  $date  Date to be checked
     *
     * @return bool
     */
    private function isValidDate($date) {
        $date = str_replace('/', '-', $date);
        return (date_create($date)) ? JFactory::getDate($date)->format("Y-m-d") : null;
    }

}
