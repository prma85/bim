<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Bim
 * @author     Paulo Andrade & Vaikunth Vijayaraghavan <martinsp@uregina.ca>
 * @copyright  Copyright (C) 2016. All rights reserved.
 * @license    GNU General Public License version 2; see the file License. txt
 */
// No direct access.
defined('_JEXEC') or die;

require_once JPATH_COMPONENT . '/controller.php';

/**
 * Dashboards list controller class.
 *
 * @since  1.6
 */
class BimControllerDashboard extends BimController {

    /**
     * Proxy for getModel.
     *
     * @param   string  $name    The model name. Optional.
     * @param   string  $prefix  The class prefix. Optional
     * @param   array   $config  Configuration array for model. Optional
     *
     * @return object	The model
     *
     * @since	1.6
     */
    public function &getModel($name = 'Dashboards', $prefix = 'BimModel', $config = array()) {
        $model = parent::getModel($name, $prefix, array('ignore_request' => true));

        return $model;
    }

}
