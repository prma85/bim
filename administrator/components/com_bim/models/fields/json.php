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
class JFormFieldJson extends JFormField {

    /**
     * The form field type.
     *
     * @var		string
     * @since	1.6
     */
    protected $type = 'json';

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
            $value2 = str_replace("'", '"', $value);
            $valueArray = json_decode($value2);
        }
        //var_dump($valueArray);
        if (!empty($valueArray)) {
            $i = 1;
            foreach ($valueArray as $v) {
                $html[] = '<tr class="dragable" id="' . $i . '" style="cursor: move;">';
                $html[] = '<td align="left"><b>' . $i . '</b></td>';
                $html[] = '<td><input style="width: auto !important;" class="inputbox checkit" type="text" name="months[]" size="30" value="' . $v->month . '" id="month' . $i . '" placeholder="Month / Mois" /></td>';
                $html[] = '<td><input style="width: auto !important;" class="inputbox checkit" size="15" type="text" name="goals[]" value="' . $v->goal . '" id="goal' . $i . '" placeholder="Goal / Objectif" /></td>';
                $html[] = '</tr>';
                $i++;
            }
        } else {
            $html[] = '<tr class="dragable" id="1" style="cursor: move;">
                                <td align="left"><b>1</b></td>
                                <td><input style="width: auto !important;" class="inputbox checkit" type="text" name="months[]" size="30" id="month1" placeholder="Month / Mois" /></td>
                                <td><input style="width: auto !important;" class="inputbox checkit" size="15" type="text" name="goals[]" id="goal1" placeholder="Goal / Objectif" /></td>
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
            js('tr.' + classe + ':last').after('<tr class=\"dragable\" id=\"' + tr_id + '\"><td align=\"left\" ><b>' + tr_id + '</b></td><td><input style=\"width: auto !important;\" class=\"inputbox checkit\" type=\"text\" name=\"months[]\" size=\"30\" id=\"month' + tr_id + '\" placeholder=\"Months / Mois\" /></td><td><input style=\"width: auto !important;\" class=\"inputbox checkit\" size=\"15\" type=\"text\" name=\"goals[]\" id=\"goal' + tr_id + '\" placeholder=\"Goal / Objectif\" /></td></tr>');
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
            js(\"input[name='months[]']\").keyup(updateInput);
            js(\"input[name='months[]']\").blur(updateInput);
            js(\"input[name='goals[]']\").keyup(updateInput);
            js(\"input[name='goals[]']\").blur(updateInput);
        }


        function updateInput() {
            var months = js(\"input[name='months[]']\");
            var goals = js(\"input[name='goals[]']\");
            var h = js(\"#".$this->id."\");
            var jsonList = {};

            var l = months.length;
            var j = 0;
            for (var i = 0; i < l; i++) { 
                var listValues = {};
                listValues['month'] = months[i].value;
                listValues['goal'] = goals[i].value;
                jsonList[j] = listValues;
                j++;
            }
            h.val(JSON.stringify(jsonList));
        }
        
        bindInputs();
    });
    
    
";

        $doc = JFactory::getDocument();
        //$doc->addScript('../media/k2/assets/js/jquery-1.8.3.min.js');
        $doc->addScriptDeclaration($script);
        return implode($html);
    }

}