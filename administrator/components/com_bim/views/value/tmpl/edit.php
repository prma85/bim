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

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers/html');
JHtml::_('behavior.tooltip');
JHtml::_('behavior.formvalidation');
//JHtml::_('formbehavior.chosen', 'select');
JHtml::_('behavior.keepalive');

// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet(JUri::root() . 'media/com_bim/css/form.css');
$document->addStyleSheet(JUri::base() . 'components/com_bim/assets/css/bim.css');
?>
<script type="text/javascript">
    js = jQuery.noConflict();
    js(document).ready(function () {

        js('input:hidden.kpi').each(function () {
            var name = js(this).attr('name');
            if (name.indexOf('kpihidden')) {
                js('#jform_kpi option[value="' + js(this).val() + '"]').attr('selected', true);
            }
        });
        js("#jform_kpi").trigger("liszt:updated");
        js('input:hidden.goals').each(function () {
            var name = js(this).attr('name');
            if (name.indexOf('goalshidden')) {
                js('#jform_goals option[value="' + js(this).val() + '"]').attr('selected', true);
            }
        });
        js("#jform_goals").trigger("liszt:updated");
    });

    Joomla.submitbutton = function (task) {
        if (task == 'value.cancel') {
            Joomla.submitform(task, document.getElementById('value-form'));
        } else {

            if (task != 'value.cancel' && document.formvalidator.isValid(document.id('value-form'))) {

                Joomla.submitform(task, document.getElementById('value-form'));
            } else {
                alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED')); ?>');
            }
        }
    }
</script>

<form
    action="<?php echo JRoute::_('index.php?option=com_bim&layout=edit&id=' . (int) $this->item->id); ?>"
    method="post" enctype="multipart/form-data" name="adminForm" id="value-form" class="form-validate">

    <div class="form-horizontal">
        <?php echo JHtml::_('bootstrap.startTabSet', 'myTab', array('active' => 'general')); ?>

        <?php echo JHtml::_('bootstrap.addTab', 'myTab', 'general', JText::_('COM_BIM_TITLE_VALUE', true)); ?>
        <div class="row-fluid">
            <div class="span10 form-horizontal">
                <fieldset class="adminform">

                    <input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>" />
                    <input type="hidden" name="jform[asset_id]" value="<?php echo $this->item->asset_id; ?>" />
                    <input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>" />
                    <input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>" />
                    <input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>" />
                    <input type="hidden" name="jform[checked_out_time]" value="<?php echo $this->item->checked_out_time; ?>" />
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('created'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('created'); ?></div>
                    </div>

                    <?php if (empty($this->item->created_by)) { ?>
                        <input type="hidden" name="jform[created_by]" value="<?php echo JFactory::getUser()->id; ?>" />
                    <?php } else {
                        ?>
                        <input type="hidden" name="jform[created_by]" value="<?php echo $this->item->created_by; ?>" />
                    <?php } ?>

                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('modified'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('modified'); ?></div>
                    </div>

                    <?php if (empty($this->item->modified_by)) { ?>
                        <input type="hidden" name="jform[modified_by]" value="<?php echo JFactory::getUser()->id; ?>" />
                    <?php } else {
                        ?>
                        <input type="hidden" name="jform[modified_by]" value="<?php echo $this->item->modified_by; ?>" />
                    <?php } ?>

                    <?php
                    foreach ((array) $this->item->kpi as $value):
                        if (!is_array($value)):
                            echo '<input type="hidden" class="kpi" name="jform[kpihidden][' . $value . ']" value="' . $value . '" />';
                        endif;
                    endforeach;
                    ?>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('goals_temp'); ?></div>
                        <div class="controls">
                            <?php echo $this->form->getInput('goals_temp'); ?>
                            <?php echo $this->form->getInput('kpi'); ?>
                            <?php echo $this->form->getInput('goals'); ?>
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('month'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('month'); ?></div>
                    </div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('value'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('value'); ?></div>
                    </div>
                    <input type="hidden" name="jform[version]" value="<?php echo $this->item->version; ?>" />


                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('version_note'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('version_note'); ?></div>
                    </div>
                </fieldset>
            </div>
        </div>
        <?php echo JHtml::_('bootstrap.endTab'); ?>



        <?php echo JHtml::_('bootstrap.endTabSet'); ?>

        <input type="hidden" name="task" value=""/>
        <?php echo JHtml::_('form.token'); ?>

    </div>
</form>
<script>
    if (js("#jform_goals").val()) {
        var goalsTempInput = js("#jform_goals").val() + "," + js("#jform_kpi").val();
        js("#jform_goals_temp").val(goalsTempInput);
        updateMonthsSelect();
    }
</script>
