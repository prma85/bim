<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Bim
 * @author     Paulo Andrade & Vaikunth Vijayaraghavan <martinsp@uregina.ca>
 * @copyright  Copyright (C) 2016. All rights reserved.
 * @license    GNU General Public License version 2; see the file License. txt
 */
defined('_JEXEC') or die;

/**
 * Class BimFrontendHelper
 *
 * @since  1.6
 */
class BimFrontendHelper {

    /**
     * Get category name using category ID
     * @param integer $category_id Category ID
     * @return mixed category name if the category was found, null otherwise
     */
    public static function getCategoryNameByCategoryId($category_id) {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);

        $query
                ->select('title')
                ->from('#__categories')
                ->where('id = ' . intval($category_id));

        $db->setQuery($query);
        return $db->loadResult();
    }

    /**
     * Get an instance of the named model
     *
     * @param   string  $name  Model name
     *
     * @return null|object
     */
    public static function getModel($name) {
        $model = null;

        // If the file exists, let's
        if (file_exists(JPATH_SITE . '/components/com_bim/models/' . strtolower($name) . '.php')) {
            require_once JPATH_SITE . '/components/com_bim/models/' . strtolower($name) . '.php';
            $model = JModelLegacy::getInstance($name, 'BimModel');
        }

        return $model;
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
