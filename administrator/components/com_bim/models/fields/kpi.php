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
 * Supports a value from an external table
 *
 * @since  1.6
 */
class JFormFieldKpi extends JFormField {

    /**
     * The form field type.
     *
     * @var      string
     * @since    1.6
     */
    protected $type = 'kpi';
    private $value_field;

    /**
     * Method to get the field input markup.
     *
     * @return   string  The field input markup.
     *
     * @since    1.6
     */
    protected function getInput() {

        // The column that the field shows in the input
        $this->value_field = (string) $this->getAttribute('value_field');

        $input_options = 'class="' . $this->getAttribute('class') . '"';

        // Load all the field options
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);

        if (isset($this->value_field) && $this->value_field) {
            $select = array(
                $db->quoteName('id'),
                $this->value_field
            );
        } else {
            $select = array(
                $db->quoteName('id'),
                $db->quoteName('title')
            );
        }

        $query->select($select)->from('#__bim_kpi');
        $query->order('title');
        $query->where('state = 1');

        $user = JFactory::getUser();
        $params = JComponentHelper::getParams('com_bim');

        if (in_array($params->get('employee'), $user->groups)) {
            $listUnits = implode(',', $user->groups);
            $newWhere = 'unit in (' . $listUnits . ')';
            $query->where($newWhere);
        }
        
        if (in_array($params->get('responsible'), $user->groups)) {
            $query->where('responsible = '.$user->id);
        }

        $db->setQuery($query);
        $results = $db->loadObjectList();

        $options = array();
        $options[] = JHtml::_('select.option', '', JText::_('COM_BIM_SELECT'));

        // Iterate through all the results
        foreach ($results as $result) {
            $options[] = JHtml::_('select.option', $result->id, $result->title);
        }

        $html = JHtml::_('select.genericlist', $options, $this->name, $input_options, 'value', 'text', $this->value, $this->id);

        return $html;
    }

    /**
     * Wrapper method for getting attributes from the form element
     *
     * @param   string  $attr_name  Attribute name
     * @param   mixed   $default    Optional value to return if attribute not found
     *
     * @return mixed The value of the attribute if it exists, null otherwise
     */
    public function getAttribute($attr_name, $default = null) {
        if (!empty($this->element[$attr_name])) {
            return $this->element[$attr_name];
        } else {
            return $default;
        }
    }

}
