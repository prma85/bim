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
?>

<div class="row-fluid">
    <?php
    if (!empty($this->items)) {
        foreach ($this->items as $item) {
            if (!empty($item['goals']) && !empty($item['values'])) {
                ?>
                <div class="col-lg-4 col-md-4 col-sm-6 col-sm-12">
                    <div class="box-kpi">
                        <?php
                        $keyValue = (int) $item['values_size'] - 1;
                        $monthReference = $item['values'][$keyValue]['month_desc'];
                        $monthValue = $item['values'][$keyValue]['value'];
                        $title = $item['title'] . ' - ' . $monthReference . '/' . $item['year'];
                        if ($doc->language == 'fr-fr') {
                            $title = $item['title_fr'] . ' - ' . $monthReference . '/' . $item['year'];
                        }
                        $goalValue = '';

                        foreach ($item['goals'] as $goal) {
                            if ($goal['month_desc'] == $monthReference) {
                                $goalValue = $goal['value'];
                            }
                        }

                        $efficiency = ((floatval($monthValue) * 100) / floatval($goalValue));
                        $efficiency = round($efficiency, 2) . '%';

                        if ($item['type'] == 'currency') {
                            $goalValue = '$' . number_format($goalValue);
                            $monthValue = '$' . number_format($monthValue);
                        } else if ($item['type'] == 'percentual') {
                            $goalValue = $goalValue . '%';
                            $monthValue = $monthValue . '%';
                        }
                        ?>
                        <h3><marquee><?php echo $title; ?></marquee></h3>
                        <div class="box-bars">
                            <div class="myProgress">
                                <div class="myBar goal">
                                    Target Goal: <?php echo $goalValue; ?>
                                </div>
                            </div>

                            <div class="myProgress">
                                <div class="myBar target" style="width: <?php echo $efficiency; ?>">
                                    Achieved Goal: <?php echo $monthValue; ?>
                                </div>
                            </div>
                        </div>
                        <div class="efficiency">
                            <div class="value">Efficiency in Percentage: <?php echo $efficiency; ?></div>
                        </div>
                        <div class="details">
                            <a class="modal btn btn-info btn-small" target="_blank" rel="{size: {x: 700, y: 500}, handler:'iframe'}"  href="<?php echo JRoute::_('index.php?option=com_bim&view=dashboard&layout=detail&id=' . $item['id']); ?>"><?php echo JText::_('COM_BIM_DETAILS'); ?></a>
                        </div>
                    </div>
                </div>
                <?php
            }
        }
    } else {
        echo 'No items to show';
    }
    ?>
</div>