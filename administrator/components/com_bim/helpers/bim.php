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

/**
 * Bim helper.
 *
 * @since  1.6
 */
class BimHelper {

    /**
     * Get a configuration of the component
     *
     * @return  Object
     *
     * @see     BimHelper
     * @since   11.1
     */
    public static function getConfig() {
        $this->config = JComponentHelper::getParams('com_bim');
        return true;
    }

    /**
     * Configure the Linkbar.
     *
     * @param   string  $vName  string
     *
     * @return void
     */
    public static function addSubmenu($vName = '') {
        $user = JFactory::getUser();

        JHtmlSidebar::addEntry(
                JText::_('COM_BIM_TITLE_DEFAULT'), 'index.php?option=com_bim&view=default', $vName == 'default'
        );
        JHtmlSidebar::addEntry(
                JText::_('COM_BIM_TITLE_DASHBOARD'), str_replace('/administrator', '', JURI::root()) . 'index.php?option=com_bim&view=dashboard', $vName == 'dashboard'
        );

        if (BimHelper::checkPermission($user, 'kpis')) {
            JHtmlSidebar::addEntry(
                    JText::_('COM_BIM_TITLE_KPIS'), 'index.php?option=com_bim&view=kpis', $vName == 'kpis'
            );
        }
        if (BimHelper::checkPermission($user, 'categories')) {
            JHtmlSidebar::addEntry(
                    ' KPIs - ' . JText::_('JCATEGORIES'), 'index.php?option=com_bim&view=categories', $vName == 'categories'
            );
            if ($vName == 'categories') {
                JToolBarHelper::title('Business Indicator Management: JCATEGORIES (COM_BIM_TITLE_KPIS)');
            }
        }
        if (BimHelper::checkPermission($user, 'goals')) {
            JHtmlSidebar::addEntry(
                    JText::_('COM_BIM_TITLE_GOALS'), 'index.php?option=com_bim&view=goals', $vName == 'goals'
            );
        }
        if (BimHelper::checkPermission($user, 'values')) {
            JHtmlSidebar::addEntry(
                    JText::_('COM_BIM_TITLE_VALUES'), 'index.php?option=com_bim&view=values', $vName == 'values'
            );
        }
        if (BimHelper::checkPermission($user, 'units')) {
            JHtmlSidebar::addEntry(
                    JText::_('COM_BIM_TITLE_UNITS'), 'index.php?option=com_users&view=groups', $vName == 'units'
            );
            if ($vName == 'units') {
                JToolBarHelper::title('Business Units - BIM: User Groups');
            }
        }
        if (BimHelper::checkPermission($user, 'meetings')) {
            JHtmlSidebar::addEntry(
                    JText::_('COM_BIM_TITLE_MEETINGS'), 'index.php?option=com_bim&view=meetings', $vName == 'meetings'
            );
        }
        if (BimHelper::checkPermission($user, 'audits')) {
            JHtmlSidebar::addEntry(
                    JText::_('COM_BIM_TITLE_AUDITS'), 'index.php?option=com_bim&view=audits', $vName == 'audits'
            );
        }
    }

    /**
     * Gets a list of the actions that can be performed.
     *
     * @return    JObject
     *
     * @since    1.6
     */
    public static function getActions() {
        $user = JFactory::getUser();
        $result = new JObject;

        $assetName = 'com_bim';

        $actions = array(
            'core.admin', 'core.manage', 'core.create', 'core.edit', 'core.edit.own', 'core.edit.state', 'core.delete'
        );

        foreach ($actions as $action) {
            $result->set($action, $user->authorise($action, $assetName));
        }

        return $result;
    }

    /**
     * Save each action in the system in a separeted table to audit .
     *
     * @param   string  $table  string
     * @param   object  $new    JObject
     * @param   object  $old    JObject
     * @param   boolean  $delete boolean
     * 
     * @return    void
     *
     * @since    1.0
     */
    public static function saveToAudit($table, $new, $old, $delete = false) {
        //initialize variables
        $user = JFactory::getUser();
        $db = JFactory::getDbo();
        $type = 0; // 0 = New; 1 = Change; 2 = Delete
        $mail = '';

        //get KPI responsible mail
        if ($table != 'kpi') {
            $db->setQuery('select responsible from #__bim_kpi where id = ' . $new->kpi);
            $idResponsible = $db->loadResult();
        } else {
            $idResponsible = $new->responsible;
        }

        //check if the user is the KPI responsible or not
        if ($user->get('id') != $idResponsible) {
            $responsible = JFactory::getUser($idResponsible);
            $mail = $responsible->get('email');
        }

        if (isset($old->id)) {
            $type = 1;
        }

        $date = new DateTime;
        $modified = $date->format('Y-m-d H:i:s');

        if ($delete) {
            $type = 2;
            $old = $new;
            $new = new stdClass();
            $new->id = $old->id;
        }


        //Insert the information on table
        $db->setQuery('INSERT INTO #__bim_audit (`ordering`, `state`, `modified`, `modified_by`, `original`, `new`, `action`, `where`) VALUES (1, 1, "' . $modified . '", "' . $user->get('id') . '", ' . $db->quote(json_encode($new)) . ', "' . $db->quote(json_encode($old)) . '", "' . $type . '",  "' . $table . '")');
        $db->execute();

        //Send email to responsible if is not him that did the change
        $view = $table;
        $task = $table;
        if (substr($view, -1) != 's') {
            $view = $view . 's';
        } else {
            $task = substr($task, 0, -1);
        }
        $linkEdit = JUri::base() . 'index.php?option=com_bim&view=' . $view . '&id=' . $new->id . '&task=' . $task . '.edit';

        //get the data
        $information = '<hr/>';
        $new = BimHelper::normalizeData($new);

        foreach ($new as $k => $v) {
            if (is_array($v)) {
                $tempString = '<table><tr>';
                foreach ($v as $t) {
                    foreach ($t as $i) {
                        $tempString .= '<td>' . $i . '</td><td>';
                    }
                    $tempString = substr($tempString, 0, -4) . '</tr><tr>';
                }
                $v = substr($tempString, 0, -4) . '</table>';
            }
            $information .= '<b>' . $k . ':</b> ' . $v . '<br>';
        }

        $information .= '<hr/><a href="' . $linkEdit . '" title="Edit item">Click here to edit the information</a>';

        //prepare the message
        if ($mail) {
            if ($type == 0) {
                $subject = '[BIM] New information has been inserted in the system - {' . $table . '}';
                $msg = JText::_('COM_BIM_NEW_INFORMATION') . $information;
            } else if ($type == 1) {
                $subject = '[BIM] A information has been changed in the system - {' . $table . '}';
                $msg = JText::_('COM_BIM_CHANGED_INFORMATION') . $information;
            } else if ($type == 2) {
                $subject = '[BIM] A information has beed deleted in the system - {' . $table . '}';
                $msg = JText::_('COM_BIM_DELETED_INFORMATION') . 'Deleted item id: ' . $old->id;
            }

            $body = BimHelper::getTemplate($subject, $msg);

            $app = JFactory::getApplication();
            $from = JComponentHelper::getParams('com_bim')->get('email');

            // Clean the email data
            $subject = JMailHelper::cleanSubject($subject);
            $body = JMailHelper::cleanBody($body);

            // To send we need to use punycode.
            $from = JStringPunycode::emailToPunycode($from);
            $from = JMailHelper::cleanAddress($from);
            $mail = JStringPunycode::emailToPunycode($mail);
            $mail = JMailHelper::cleanAddress($from);
            /*
              if (!JFactory::getMailer()->sendMail($from, 'BIM System', $mail, $subject, $body, 1)) {
              $app->enqueueMessage(JText::_('COM_BIM_MAIL_ERROR'), 'error');
              }
             */
            // Get the Mailer
            $mailer = JFactory::getMailer();

            // Build email message format.
            $mailer->setSender(array($from, 'BIM System'));
            $mailer->setSubject($subject);
            $mailer->setBody($body);
            $mailer->IsHtml(TRUE);
            $mailer->addRecipient(array($mail));

            $mailer->isSMTP();
            $mail->SMTPDebug = 1;

            // Send the Mail
            $rs = $mailer->Send();

            // Check for an error
            if ($rs instanceof Exception) {

                $app->enqueueMessage(JText::_('COM_BIM_MAIL_ERROR'), 'error');
            }
        }
    }

    /**
     * Get the array with data and give just the necessary information
     *
     * @param   array  $new  $array
     * @param   boolean  $html  boolean
     * 
     * @return    array
     *
     * @since    1.0
     */
    public function normalizeData($new, $html = FALSE) {

        if (is_string($new)) {
            if (substr($new, 0, 1) == "'") {
                $new = substr($new, 1, -1);
            }
            $new = json_decode($new);
        }

        if (is_object($new)) {
            $new = \Joomla\Utilities\ArrayHelper::fromObject($new);
        }

        unset($new['asset_id']);
        unset($new['ordering']);
        unset($new['state']);
        unset($new['checked_out']);
        unset($new['checked_out_time']);
        unset($new['kpihidden']);
        unset($new['version']);
        unset($new['version_note']);
        unset($new['alias']);
        unset($new['alias_fr']);
        unset($new['unithidden']);
        unset($new['color']);

        $db = JFactory::getDbo();

        if (isset($new['created_by'])) {
            $new['created_by'] = JFactory::getUser($new['created_by'])->get('name');
        }
        if (isset($new['modified_by'])) {
            $new['modified_by'] = JFactory::getUser($new['modified_by'])->get('name');
        }
        if (isset($new['responsible'])) {
            $new['responsible'] = JFactory::getUser($new['responsible'])->get('name');
        }
        if (isset($new['kpi'])) {
            $db->setQuery('select title, title_fr from #__bim_kpi where id = ' . $new['kpi']);
            $kpi = $db->loadObject();
            $new['kpi'] = $kpi->title;
            $new['kpi_fr'] = $kpi->title_fr;
        }
        if (isset($new['unit'])) {
            $db->setQuery('select title from #__usergroups where id = ' . $new['unit']);
            $new['unit'] = $db->loadResult();
        }
        if (isset($new['category'])) {
            $db->setQuery('select title from #__bim_category where id = ' . $new['category']);
            $new['category'] = $db->loadResult();
        }
        if (isset($new['periodicity'])) {
            switch ($new['periodicity']) {
                case "1":
                    $new['periodicity'] = "Monthly";
                    break;
                case "2":
                    $new['periodicity'] = "Bimonthly";
                    break;
                case "3":
                    $new['periodicity'] = "Quarterly";
                    break;
                case "6":
                    $new['periodicity'] = "Semester";
                    break;
                case "12":
                    $new['periodicity'] = "Yearly";
                    break;
            }
        }
        if (isset($new['increase'])) {
            switch ($new['increase']) {
                case "0":
                    $new['increase'] = "Down";
                    break;
                case "1":
                    $new['increase'] = "Up";
                    break;
            }
        }

        if (isset($new['values'])) {
            $new['values'] = json_decode($new['values']);
            $new['values'] = \Joomla\Utilities\ArrayHelper::fromObject($new['values']);
            if ($new['values']) {
                foreach ($new['values'] as $k => $v) {
                    $new['values'][$k]['month'] = BimHelper::getMonth($v['month']);
                }
            }
        }

        ksort($new);

        if ($html) {
            $information = '';

            foreach ($new as $k => $v) {
                if (is_array($v)) {
                    $tempString = '<table><tr>';
                    foreach ($v as $t) {
                        foreach ($t as $i) {
                            $tempString .= '<td>' . $i . '</td><td>';
                        }
                        $tempString = substr($tempString, 0, -4) . '</tr><tr>';
                    }
                    $v = substr($tempString, 0, -4) . '</table>';
                }
                $information .= '<b>' . $k . ':</b> ' . $v . '<br>';
            }
            $new['html'] = substr($information, 0, -4);
        }

        return $new;
    }

    /**
     * Get the HTML temlate to send the email using the title of email and the message as input .
     *
     * @param   string  $title  string
     * @param   string  $msg    string
     * 
     * @return    string
     *
     * @since    1.0
     */
    public function getTemplate($title, $msg) {
        date_default_timezone_set('America/Regina');

        $body = '<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head><body bgcolor="#ffffff" style="margin: 0px auto; width: 960px;">
                <table style="FONT-FAMILY: \'Times New Roman\'; COLOR: rgb(0,0,0)" border="1" cellspacing="0" cellpadding="0" width="960px">
                    <tbody>
                        <tr>
                            <td>
                                <table border="0" cellspacing="10" cellpadding="0" width="100%" bgcolor="#003300">
                                    <tbody>
                                        <tr>
                                            <td><div align="right"><span style="FONT-FAMILY: Verdana,Arial,Helvetica,sans-serif,\'Futura Md BT\'; COLOR: rgb(255,255,255); FONT-SIZE: 18px; FONT-WEIGHT: bold" class="style1">Workflow - BIM System</span></div></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table cellspacing="30" width="100%">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div align="center"><font class="Apple-style-span" color="#000000"></font>&nbsp;<strong><font size="5">' . $title . '</font></strong></div>
                                                <div align="center"><strong><font size="5"></font></strong>&nbsp;</div>
                                                <div align="justify"><font class="Apple-style-span" color="#000000">' . $msg . '</div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table cellspacing="30" width="100%">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div align="right"<br>' . utf8_encode(strftime("%B %d,%Y", strtotime(date('Y-m-d')))) . '</div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>';

        return $body;
    }

    /**
     * Check permissions the Linkbar.
     *
     * @param   object  $user  JUser
     * @param   string  $view  string
     *
     * @return boolean
     */
    public static function checkPermission($user, $view) {

        jimport('joomla.application.component.helper');
        $params = JComponentHelper::getParams('com_bim');
        $isSuperAdmin = JAccess::check($user->id, 'core.admin');

        $viewList = array(
            'employee' => array(
                'value', 'values', 'meeting', 'meetings'
            ),
            'responsible' => array(
                'value', 'values', 'meeting', 'meetings', 'goal', 'goals', 'kpi', 'kpis'
            ),
        );

        if ($isSuperAdmin || $view == 'dashboard' || $view == 'default') {
            return TRUE;
        }
        if (in_array($params->get('admin'), $user->groups) && $view != 'audits') {
            return TRUE;
        }
        if (in_array($params->get('responsible'), $user->groups) && in_array($view, $viewList['responsible'])) {
            return TRUE;
        }
        if (in_array($params->get('employee'), $user->groups) && in_array($view, $viewList['employee'])) {
            return TRUE;
        }
        if (in_array($params->get('auditor'), $user->groups) && $view == 'audits') {
            return TRUE;
        }
        return FALSE;
    }

    /**
     * Get the corresponding month
     *
     * @param   string  $month  string
     *
     * @return string
     */
    public function getMonth($month) {
        $temp = (int) $month;
        if ($temp == 0) {
            return $month;
        }
        $newMonth = '';

        switch ($temp) {
            case 1:
                $newMonth = JText::_('JANUARY');
                break;
            case 2:
                $newMonth = JText::_('FEBRUARY');
                break;
            case 3:
                $newMonth = JText::_('MARCH');
                break;
            case 4:
                $newMonth = JText::_('APRIL');
                break;
            case 5:
                $newMonth = JText::_('MAY');
                break;
            case 6:
                $newMonth = JText::_('JUNE');
                break;
            case 7:
                $newMonth = JText::_('JULY');
                break;
            case 8:
                $newMonth = JText::_('AUGUST');
                break;
            case 9:
                $newMonth = JText::_('SEPTEMBER');
                break;
            case 10:
                $newMonth = JText::_('OCTOBER');
                break;
            case 11:
                $newMonth = JText::_('NOVEMBER');
                break;
            case 12:
                $newMonth = JText::_('DECEMBER');
                break;
            default :
                $newMonth = $month;
                break;
        }
        return $newMonth;
    }

}