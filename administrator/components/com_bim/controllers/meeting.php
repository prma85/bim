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
 * Meeting controller class.
 *
 * @since  1.6
 */
class BimControllerMeeting extends JControllerForm {

    /**
     * Constructor
     *
     * @throws Exception
     */
    public function __construct() {
        $this->view_list = 'meetings';
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
        $table = 'meeting';
        $old = new stdClass();

        //check if is a new item or is a existent item
        if ($data->id != '0' && $data->id != '') {
            $db->setQuery('select * from #__bim_' . $table . ' where id = ' . $data->id);
            $old = $db->loadObject();
        }

        $result = parent::save($key, $urlVar);

        if ($result) {
            $this->sendCopy($data);
            BimHelper::saveToAudit($table, $data, $old);
        }
    }

    /**
     * Send a copy of the data informed in the meeting
     * 
     * @param    object $data   object
     * 
     * @return    void
     *
     * @since    1.0
     */
    public function sendCopy($data) {
        require_once JPATH_COMPONENT . '/helpers/bim.php';
        
        //initialize variables
        $to = array();
        $cc = JFactory::getUser()->get('email');
        $subject = '[BIM] Information about the meeting';
        $participants = array();
        $db = JFactory::getDbo();
        
        //get data from participants
        foreach ($data->participants as $p){
            $to[] = JFactory::getUser($p)->get('email');
            $participants[] = JFactory::getUser($p)->get('name');
        }
        
        //get the KPI
        $db->setQuery('select title from #__bim_kpi where id = '.$data->kpi);
        $kpi = $db->loadResult();
        
        $msg = array();
        $msg[] = '<table><tbody>';
        $msg[] = '<tr><td><b>'.JText::_('JGLOBAL_TITLE').'</b></td><td>'.$data->title.'</td></tr>';
        $msg[] = '<tr><td><b>'.JText::_('COM_BIM_FORM_LBL_MEETING_DATE').'</b></td><td>'.$data->date.'</td></tr>';
        $msg[] = '<tr><td><b>'.JText::_('COM_BIM_FORM_LBL_MEETING_REFERENCE').'</b></td><td>'.$data->reference.'</td></tr>';
        $msg[] = '<tr><td><b>'.JText::_('COM_BIM_FORM_LBL_MEETING_KPI').'</b></td><td>'.$kpi.'</td></tr>';
        $msg[] = '<tr><td><b>'.JText::_('COM_BIM_FORM_LBL_MEETING_PARTICIPANTS').'</b></td><td>'.  implode(', ', $participants).'</td></tr>';
        $msg[] = '<tr><td><b>'.JText::_('COM_BIM_FORM_LBL_MEETING_FACTS').'</b></td><td>'.$data->facts.'</td></tr>';
        $msg[] = '<tr><td><b>'.JText::_('COM_BIM_FORM_LBL_MEETING_CAUSES').'</b></td><td>'.$data->causes.'</td></tr>';
        $msg[] = '<tr><td><b>'.JText::_('COM_BIM_FORM_LBL_MEETING_ACTIONS').'</b></td><td>'.$data->actions.'</td></tr>';
        $msg[] = '</tbody></table>';
        
        $body = BimHelper::getTemplate($data->title, implode('', $msg));
       
        $app = JFactory::getApplication();
        $from = JComponentHelper::getParams('com_bim')->get('email');
        if (!JFactory::getMailer()->sendMail($from, 'BIM System', $to, $subject, $body, true, $cc)) {
            $app->enqueueMessage(JText::_('COM_BIM_MAIL_ERROR'), 'error');
        }
    }
}
