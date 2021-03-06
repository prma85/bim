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

jimport('joomla.application.component.controlleradmin');

use Joomla\Utilities\ArrayHelper;

/**
 * Meetings list controller class.
 *
 * @since  1.6
 */
class BimControllerMeetings extends JControllerAdmin {

    /**
     * Method to clone existing Meetings
     *
     * @return void
     */
    public function duplicate() {
        // Check for request forgeries
        Jsession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

        // Get id(s)
        $pks = $this->input->post->get('cid', array(), 'array');

        try {
            if (empty($pks)) {
                throw new Exception(JText::_('COM_BIM_NO_ELEMENT_SELECTED'));
            }

            ArrayHelper::toInteger($pks);
            $model = $this->getModel();
            $model->duplicate($pks);
            $this->setMessage(Jtext::_('COM_BIM_ITEMS_SUCCESS_DUPLICATED'));
        } catch (Exception $e) {
            JFactory::getApplication()->enqueueMessage($e->getMessage(), 'warning');
        }

        $this->setRedirect('index.php?option=com_bim&view=meetings');
    }

    /**
     * Proxy for getModel.
     *
     * @param   string  $name    Optional. Model name
     * @param   string  $prefix  Optional. Class prefix
     * @param   array   $config  Optional. Configuration array for model
     *
     * @return  object	The Model
     *
     * @since    1.6
     */
    public function getModel($name = 'meeting', $prefix = 'BimModel', $config = array()) {
        $model = parent::getModel($name, $prefix, array('ignore_request' => true));

        return $model;
    }

    /**
     * Method to save the submitted ordering values for records via AJAX.
     *
     * @return  void
     *
     * @since   3.0
     */
    public function saveOrderAjax() {
        // Get the input
        $input = JFactory::getApplication()->input;
        $pks = $input->post->get('cid', array(), 'array');
        $order = $input->post->get('order', array(), 'array');

        // Sanitize the input
        ArrayHelper::toInteger($pks);
        ArrayHelper::toInteger($order);

        // Get the model
        $model = $this->getModel();

        // Save the ordering
        $return = $model->saveorder($pks, $order);

        if ($return) {
            echo "1";
        }

        // Close the application
        JFactory::getApplication()->close();
    }
    
    /**
     * Method to override the function of delete the selected items
     *
     * @return  void
     *
     * @since   3.0
     */
    public function delete() {
        require_once JPATH_COMPONENT . '/helpers/bim.php';
        $db = JFactory::getDbo();
        $table = 'meeting';
        
        $cid = JFactory::getApplication()->input->get('cid', array(), 'array');
        $old = new stdClass();
        
        foreach ($cid as $id) {
            $db->setQuery('select * from #__bim_'.$table.' where id = '.$id);
            $new = $db->loadObject();
            BimHelper::saveToAudit($table, $new, $old, true);
        }
        
        parent::delete();
    }

}
