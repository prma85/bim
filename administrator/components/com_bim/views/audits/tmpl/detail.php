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

// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet(JUri::root() . 'media/com_bim/css/list.css');
$document->addStyleSheet(JUri::base() . 'components/com_bim/assets/css/bim.css');
if (!empty($this->extra_sidebar)) {
    echo '<div style="display:none;">' . $this->extra_sidebar . '</div>';
}

$new = BimHelper::normalizeData($this->data->new, true);
$old = BimHelper::normalizeData($this->data->original, true);
?>
<style>
    .tdlabel{font-weight: bold;}
</style>
<div id="j-main-container">
    <table class="table table-striped" id="auditList">
        <tbody>
            <tr>
                <td class="tdlabel"><?php echo JText::_('COM_BIM_AUDITS_MODIFIED'); ?></td>
                <td><?php echo $this->data->modified; ?></td>
            </tr>
            <tr>
                <td class="tdlabel"><?php echo JText::_('COM_BIM_AUDITS_MODIFIED_BY'); ?></td>
                <td><?php echo $this->data->name; ?></td>
            </tr>
            <tr>
                <td class="tdlabel"><?php echo JText::_('COM_BIM_AUDITS_ACTION'); ?></td>
                <td><?php echo JText::_('COM_BIM_AUDITS_ACTION_OPTION_'.$this->data->action); ?></td>
            </tr>
            <tr>
                <td class="tdlabel"><?php echo JText::_('COM_BIM_AUDITS_WHERE'); ?></td>
                <td><?php echo JText::_('COM_BIM_AUDITS_WHERE_OPTION_'.strtoupper($this->data->where)); ?></td>
            </tr>
            <tr>
                <td class="tdlabel"><?php echo JText::_('COM_BIM_AUDITS_NEW'); ?></td>
                <td><?php echo $new['html']; ?></td>
            </tr>
            <tr>
                <td class="tdlabel"><?php echo JText::_('COM_BIM_AUDITS_ORIGINAL'); ?></td>
                <td><?php echo $old['html']; ?></td>
            </tr>
        </tbody>
    </table>

</div>