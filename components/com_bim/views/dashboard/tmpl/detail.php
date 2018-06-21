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

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers');
JHtml::_('bootstrap.tooltip');
JHtml::_('behavior.modal');

$doc = JFactory::getDocument();
$doc->addStyleSheet(JUri::root() . '/components/com_bim/lib/bim.css');
$doc->addStyleSheet(JUri::root() . 'media/com_bim/css/list.css');
?>
<div class="row-fluid">
    <table class="table table-striped" id="categoryList">
        <tbody>
            <tr>
                <td class="labeltd"><?php echo JText::_('COM_BIM_KPI'); ?></td>
                <td><?php echo $this->data['title']; ?></td>
            </tr>
            <tr>
                <td class="labeltd"><?php echo JText::_('COM_BIM_KPI_FR'); ?></td>
                <td><?php echo $this->data['title_fr']; ?></td>
            </tr>
            <tr>
                <td class="labeltd"><?php echo JText::_('COM_BIM_CREATED_BY'); ?></td>
                <td><?php echo $this->data['created_by']; ?></td>
            </tr>
            <tr>
                <td class="labeltd"><?php echo JText::_('COM_BIM_RES'); ?></td>
                <td><?php echo $this->data['responsible']; ?></td>
            </tr>
            <tr>
                <td class="labeltd"><?php echo JText::_('COM_BIM_UNIT'); ?></td>
                <td><?php echo $this->data['unit']; ?></td>
            </tr>
            <tr>
                <td class="labeltd"><?php echo JText::_('COM_BIM_CAT'); ?></td>
                <td><?php echo $this->data['category']; ?></td>
            </tr>
            <tr>
                <td class="labeltd"><?php echo JText::_('COM_BIM_TYPE'); ?></td>
                <td><?php echo $this->data['type']; ?></td>
            </tr>
            <tr>
                <td class="labeltd"><?php echo JText::_('COM_BIM_PERIODICITY'); ?></td>
                <td><?php echo JText::_('COM_BIM_KPIS_PERIODICITY_OPTION_' . $this->data['periodicity']); ?></td>
            </tr>
            <tr>
                <td class="labeltd"><?php echo JText::_('COM_BIM_YEAR'); ?></td>
                <td><?php echo $this->data['year']; ?></td>
            </tr>
            <tr>
                <td class="labeltd"><?php echo JText::_('COM_BIM_KPI_VALUE'); ?></td>
                <td>
                    <table>
                        <thead>
                            <tr>
                                <th><?php echo JText::_('COM_BIM_MONTH'); ?></th>
                                <th><?php echo JText::_('COM_BIM_GOALS'); ?></th>
                                <th><?php echo JText::_('COM_BIM_VALUES'); ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $values = $this->data['values'];
                            foreach ($this->data['goals'] as $k => $item) {
                                echo '<tr>';
                                echo '<td>' . $item['month_desc'] . '</td>';
                                echo '<td><center>' . $item['value'] . '</center></td>';
                                if (isset($values[$k])) {
                                    echo '<td><center>' . $values[$k]['value'] . '</center></td>';
                                } else {
                                    echo '<td></td>';
                                }
                                echo '</tr>';
                            }
                            ?>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</div>