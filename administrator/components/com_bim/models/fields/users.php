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
 * Show a list of users to select multiple
 *
 * @since  1.6
 */
class JFormFieldUsers extends JFormField {

    /**
     * The form field type.
     *
     * @var      string
     * @since    1.6
     */
    protected $type = 'users';

    /**
     * Method to get the field input markup.
     *
     * @return   string  The field input markup.
     *
     * @since    1.6
     */
    protected function getInput() {
        // Initialize variables.
        $html = '';

        // Load all the field options
        $db = JFactory::getDbo();
        $db->setQuery('select id as value, name as text from #__users order by name');
        $results = $db->loadObjectList();

        $input_options = 'class="' . $this->getAttribute('class') . '" multiple="multiple"';
        $options = array();

        // Iterate through all the results
        foreach ($results as $result) {
            $options[] = JHtml::_('select.option', $result->value, $result->text);
        }

        $value = $this->value;

        // If the value is a string -> Only one result
        if (is_string($value)) {
            $value = array($value);
        } elseif (is_object($value)) {
            // If the value is an object, let's get its properties.
            $value = get_object_vars($value);
        }

        $html = JHtml::_('select.genericlist', $options, $this->name, $input_options, 'value', 'text', $value, $this->id);


        return $html;
    }

}