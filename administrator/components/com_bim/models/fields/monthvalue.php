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
 * Supports an HTML select list in json format
 */
class JFormFieldMonthvalue extends JFormField {

    /**
     * The form field type.
     *
     * @var		string
     * @since	1.6
     */
    protected $type = 'monthvalue';

    /**
     * Method to get the field input markup.
     *
     * @return	string	The field input markup.
     * @since	1.6
     */
    protected function getInput() {

        // Initialize variables.
        $html = array();
        $valueArray = array();
        // Initialize variables.
        $value = $this->value;

        $html[] = '<br/><a href="#" id="options-add">[ + ] Add Month</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="options-remove">[ - ] Remove Month</a><br/><br/>';
        $html[] = '<table class="admintable" id="reorder">
                                <thead>
                                    <tr style=" font-weight:bold;" class="nodrag">
                                        <td style="width:40px; text-align: left;">ID</td>
                                        <td style="width:215px;">Month</td>
                                        <td>Value</td>
                                    </tr>
                                </thead>
                                <tbody>';
        if ($value) {
            $value = str_replace('"', "'", $value);
            $value2 = str_replace("'", '"', $value);
            $valueArray = json_decode($value2);
        }
        if (is_object($valueArray)){
            $valueArray = \Joomla\Utilities\ArrayHelper::fromObject($valueArray);
        }
        
        if (!empty($valueArray)) {
            $i = 1;
            foreach ($valueArray as $v) {
                $html[] = '<tr class="dragable" id="' . $i . '" style="cursor: move;">';
                $html[] = '<td align="left"><b>' . $i . '</b></td>';
                $html[] = '<td>' . $this->getSelectMonths($v['month'], 'month' . $i) . '</td>';
                $html[] = '<td><input required="required" aria-required="true" style="width: auto !important;" class="inputbox checkit" size="15" type="text" name="goals[]" value="' . $v['goal'] . '" id="goal' . $i . '" placeholder="Goal / Objectif" /></td>';
                $html[] = '</tr>';
                $i++;
            }
        } else {
            $html[] = '<tr class="dragable" id="1" style="cursor: move;">
                                <td align="left"><b>1</b></td>
                                <td>' . $this->getSelectMonths() . '</td>
                                <td><input required="required" aria-required="true" style="width: auto !important;" class="inputbox checkit" size="15" type="text" name="goals[]" id="goal1" placeholder="Goal / Objectif" /></td>
                            </tr>';
        }
        $html[] = '</tbody></table>';
        $html[] = '<input type="hidden" id="' . $this->id . '" name="' . $this->name . '" value="' . $value . '" />';

        $script = "
    js = jQuery.noConflict();
    js(document).ready(function() {
        js('a#options-add').click(function() {
            if (typeof js('tr.dragable:last').attr('id') != 'undefined') {
                var tr_id = parseInt(js('tr.dragable:last').attr('id')) + 1;
                var classe = 'dragable';
            } else {
                var tr_id = 1;
                var classe = 'nodrag';
            }
            js('tr.' + classe + ':last').after('<tr class=\"dragable\" id=\"' + tr_id + '\"><td align=\"left\" ><b>' + tr_id + '</b></td><td>" . $this->getSelectMonths('', "month' + tr_id + '") . "</td><td><input style=\"width: auto !important;\" class=\"inputbox checkit\" size=\"15\" type=\"text\" name=\"goals[]\" id=\"goal' + tr_id + '\" placeholder=\"Goal / Objectif\" /></td></tr>');
            js('tr.dragable:last').hide();
            js('tr.dragable:last').fadeIn(400);
            js('input[name^=\"months\"]').focus();
            
            bindInputs();
        });
        //REMOVE OPTIONS			
        js('a#options-remove').click(function() {
            if (js('tr.dragable:last input.inputbox').val() == '' || typeof js('tr.dragable:last input.inputbox').val() == 'undefined') {
                js('tr.dragable:last')
                        .animate({'backgroundColor': '#fb6c6c'}, 400)
                        .fadeOut(400, function callback() {
                            js(this).remove();
                            updateInput();
                        });
                        
            } else {
                if (confirm('Are you sure you want to delete this month:' + js('tr.dragable:last input.inputbox').val() + '?')) {
                    js('tr.dragable:last').animate({'backgroundColor': '#fb6c6c'}, 400)
                            .fadeOut(400, function callback() {
                                js(this).remove();
                                updateInput();
                            });
                            
                }
            }
            return false;
        });
    
        function bindInputs() {
            js(\"select[name='months[]']\").on( 'change', updateInput );
            js(\"input[name='goals[]']\").keyup(updateInput);
            js(\"input[name='goals[]']\").blur(updateInput);
        }


        function updateInput() {
            var months = js(\"select[name='months[]']\");
            var goals = js(\"input[name='goals[]']\");
            var h = js(\"#" . $this->id . "\");
            var jsonList = {};

            var l = months.length;
            var j = 0;
            
            console.log(months);
            console.log(goals);
            for (var i = 0; i < l; i++) { 
                var listValues = {};
                listValues['month'] = months[i].value;
                listValues['goal'] = goals[i].value;
                jsonList[j] = listValues;
                j++;
            }
            var newValue = JSON.stringify(jsonList);
            h.val(newValue);
        }
        
        bindInputs();
    });
    
    
";

        $doc = JFactory::getDocument();
        //$doc->addScript('../media/k2/assets/js/jquery-1.8.3.min.js');
        $doc->addScriptDeclaration($script);
        return implode($html);
    }

    public function getSelectMonths($value = '', $id = 'month1') {
        $options = array();

        $options[] = JHtml::_('select.option', '', JText::_('COM_BIM_SELECT'));
        $options[] = JHtml::_('select.option', 1, JText::_('JANUARY'));
        $options[] = JHtml::_('select.option', 2, JText::_('FEBRUARY'));
        $options[] = JHtml::_('select.option', 3, JText::_('MARCH'));
        $options[] = JHtml::_('select.option', 4, JText::_('APRIL'));
        $options[] = JHtml::_('select.option', 5, JText::_('MAY'));
        $options[] = JHtml::_('select.option', 6, JText::_('JUNE'));
        $options[] = JHtml::_('select.option', 7, JText::_('JULY'));
        $options[] = JHtml::_('select.option', 8, JText::_('AUGUST'));
        $options[] = JHtml::_('select.option', 9, JText::_('SEPTEMBER'));
        $options[] = JHtml::_('select.option', 10, JText::_('OCTOBER'));
        $options[] = JHtml::_('select.option', 11, JText::_('NOVEMBER'));
        $options[] = JHtml::_('select.option', 12, JText::_('DECEMBER'));

        $output = JHtml::_('select.genericlist', $options, 'months[]', 'required="required" aria-required="true"', 'value', 'text', $value, $id);
        $output = str_replace(array("\r\n", "\r"), "\n", $output);
        $lines = explode("\n", $output);
        $new_lines = array();

        foreach ($lines as $i => $line) {
            if (!empty($line))
                $new_lines[] = trim($line);
        }
        $html = implode($new_lines);
        return $html;
    }

}