<?php

/**
 * @version    CVS: 1.0.0
 * @package    Com_Bim
 * @author     Paulo Andrade & Vaikunth Vijayaraghavan <martinsp@uregina.ca>
 * @copyright  Copyright (C) 2016. All rights reserved.
 * @license    GNU General Public License version 2; see the file License. txt
 */
defined('JPATH_BASE') or die;

jimport('joomla.html.html');
jimport('joomla.form.formfield');

/**
 * Supports an HTML select list of categories
 *
 * @since  1.6
 */
class JFormFieldGoals extends JFormField {

    /**
     * The form field type.
     *
     * @var        string
     * @since    1.6
     */
    protected $type = 'goals';

    /**
     * Method to get the field input markup.
     *
     * @return    string    The field input markup.
     *
     * @since    1.6
     */
    protected function getInput() {

        require_once JPATH_COMPONENT . '/helpers/bim.php';

        // Load all the field options
        $db = JFactory::getDbo();

        $user = JFactory::getUser();
        $params = JComponentHelper::getParams('com_bim');
        $where = '';

        if (in_array($params->get('employee'), $user->groups)) {
            $listUnits = implode(',', $user->groups);
            $where = ' and b.unit in (' . $listUnits . ')';
        }

        $db->setQuery('select a.id, a.year, a.kpi, a.values, b.title, b.responsible, b.type, c.name from #__bim_goals a, #__bim_kpi b, #__users c where a.kpi = b.id and b.responsible = c.id and a.state = 1 and b.state = 1' . $where . ' order by a.year, b.title');
        $results = $db->loadObjectList();

        $input_options = 'class="inputbox" onchange="updateMonthsSelect(this)"';
        $options = array();
        $options[] = JHtml::_('select.option', '', JText::_('COM_BIM_SELECT'));

        $goals = array();

        // Iterate through all the results
        foreach ($results as $result) {
            $text = '[' . $result->year . '] ' . $result->title;
            $options[] = JHtml::_('select.option', $result->id . ',' . $result->kpi, $text);
            $tempValues = json_decode($result->values);
            $tempValueArray = array();

            foreach ($tempValues as $value) {
                $tempText = BimHelper::getMonth((int) $value->month);

                if ($result->type == 'percentual') {
                    $tempText .= ' - ' . $value->goal . '%';
                } else if ($result->type == 'currency') {
                    $tempText .= ' - $ ' . $value->goal;
                } else {
                    $tempText .= ' - ' . $value->goal;
                }


                $tempValueArray[(int) $value->month] = $tempText;
            }

            $goals[(int) $result->id] = $tempValueArray;
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

        $script = '<script>
        var goals = JSON.parse("' . str_replace('"', '\"', json_encode($goals)) . '");
        if (js("#jform_goals").val()){
            var goalsTempInput = js("#jform_goals").val() + "," + js("#jform_kpi").val();
            js("#jform_goals_temp").val(goalsTempInput);
        }
        function updateMonthsSelect(){
            var selectValue = js("#jform_goals_temp").val().split(",");
            var goalID = selectValue[0];
            var kpiID = selectValue[1];
            var monthArray = goals[goalID];
            var valueMonth = js("#jform_month").val();
            var valueMonthText = js("#jform_month option:first-child").text();
            var options = "<option value=\'\'>"+valueMonthText+"</option>";
            var key;
            
            for (key in monthArray) {
                if (key == valueMonth) {
                    options += "<option selected=\"selected\" value=\""+key+"\">"+monthArray[key]+"</option>";
                } else {
                    options += "<option value=\""+key+"\">"+monthArray[key]+"</option>";
                }
            }
            
            js("#jform_month").html(options);
            js("#jform_goals").val(goalID);
            js("#jform_kpi").val(kpiID);
}

        </script>';

        return $html . $script;
    }

}
