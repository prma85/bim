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

jimport('joomla.application.component.controllerform');

/**
 * Kpi controller class.
 *
 * @since  1.6
 */
class BimControllerKpi extends JControllerForm {

    /**
     * Constructor
     *
     * @throws Exception
     */
    public function __construct() {
        $this->view_list = 'kpis';
        parent::__construct();
    }

    /**
     * Override save function to audit the informations.
     * 
     * @return    void
     *
     * @since    1.0
     */
    public function save($key = null, $urlVar = null) {
        require_once JPATH_COMPONENT . '/helpers/bim.php';

        //Initialize variables
        $db = JFactory::getDbo();
        $dataArray = $this->input->post->get('jform', array(), 'array');
        $data = \Joomla\Utilities\ArrayHelper::toObject($dataArray);
        $table = 'kpi';
        $old = new stdClass();

        //check if is a new item or is a existent item
        if ($data->id != '0' && $data->id != '') {
            $db->setQuery('select * from #__bim_' . $table . ' where id = ' . $data->id);
            $old = $db->loadObject();
        }

        $result = parent::save($key, $urlVar);

        if ($result) {
            BimHelper::saveToAudit($table, $data, $old);
        }
    }

}
