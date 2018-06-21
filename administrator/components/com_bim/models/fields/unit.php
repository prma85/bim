<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Bim
 * @author     Paulo Andrade & Vaikunth Vijayaraghavan <martinsp@uregina.ca>
 * @copyright  Copyright (C) 2016. All rights reserved.
 * @license    GNU General Public License version 2; see the file License. txt
 */
defined('JPATH_BASE') or die;

jimport('joomla.form.formfield');

/**
 * Supports an HTML select list of categories
 *
 * @since  1.6
 */
class JFormFieldUnit extends JFormField {

    /**
     * The form field type.
     *
     * @var        string
     * @since    1.6
     */
    protected $type = 'unit';

    /**
     * Method to get the field input markup.
     *
     * @return    string    The field input markup.
     *
     * @since    1.6
     */
    protected function getInput() {
        // Initialize variables.
        $options = array();
        $options[] = JHtml::_('select.option', JText::_('COM_BIM_SELECT'), '');
        $db = JFactory::getDbo();
        $input_options = 'class="' . $this->getAttribute('class') . '"';

        // Load value
        $value = $this->value;
        
        // Get data
        $parent = JComponentHelper::getParams('com_bim')->get('employee');
        $db->setQuery('select id, title from #__usergroups where parent_id =' . $parent . ' order by title asc');
        $results = $db->loadObjectList();
        
        foreach ($results as $result) {
            $options[] = JHtml::_('select.option', $result->id, $result->title);
        }
        
        $html = JHtml::_('select.genericlist', $options, $this->name, $input_options, 'value', 'text', $value, $this->id);
                
        return $html;
    }

}
