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
JHtml::_('formbehavior.chosen', 'select');
JHtml::_('behavior.keepalive');

// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet(JUri::root() . 'media/com_bim/css/form.css');
$document->addStyleSheet(JUri::base() . 'components/com_bim/assets/css/bim.css');
?>
<script type="text/javascript">
    js = jQuery.noConflict();
    js(document).ready(function () {

        js('input:hidden.unit').each(function () {
            var name = js(this).attr('name');
            if (name.indexOf('unithidden')) {
                js('#jform_unit option[value="' + js(this).val() + '"]').attr('selected', true);
            }
        });
        js("#jform_unit").trigger("liszt:updated");
    });

    Joomla.submitbutton = function (task) {
        if (task == 'kpi.cancel') {
            Joomla.submitform(task, document.getElementById('kpi-form'));
        } else {

            if (task != 'kpi.cancel' && document.formvalidator.isValid(document.id('kpi-form'))) {

                Joomla.submitform(task, document.getElementById('kpi-form'));
            } else {
                alert('<?php echo $this->escape(JText::_('JGLOBAL_VALIDATION_FORM_FAILED')); ?>');
            }
        }
    }
</script>

<form
    action="<?php echo JRoute::_('index.php?option=com_bim&layout=edit&id=' . (int) $this->item->id); ?>"
    method="post" enctype="multipart/form-data" name="adminForm" id="kpi-form" class="form-validate">

    <div class="form-horizontal">
        <?php echo JHtml::_('bootstrap.startTabSet', 'myTab', array('active' => 'general')); ?>

        <?php echo JHtml::_('bootstrap.addTab', 'myTab', 'general', JText::_('COM_BIM_TITLE_KPI', true)); ?>
        <div class="row-fluid">
            <div class="span10 form-horizontal">
                <fieldset class="adminform">

                    <input type="hidden" name="jform[id]" value="<?php echo $this->item->id; ?>" />
                    <input type="hidden" name="jform[ordering]" value="<?php echo $this->item->ordering; ?>" />
                    <input type="hidden" name="jform[state]" value="<?php echo $this->item->state; ?>" />
                    <input type="hidden" name="jform[checked_out]" value="<?php echo $this->item->checked_out; ?>" />
                    <input type="hidden" name="jform[checked_out_time]" value="<?php echo $this->item->checked_out_time; ?>" />
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('created'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('created'); ?></div>
                    </div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('created_by'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('created_by'); ?></div>
                    </div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('modified'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('modified'); ?></div>
                    </div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('modified_by'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('modified_by'); ?></div>
                    </div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('title'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('title'); ?></div>
                    </div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('alias'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('alias'); ?></div>
                    </div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('title_fr'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('title_fr'); ?></div>
                    </div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('alias_fr'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('alias_fr'); ?></div>
                    </div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('responsible'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('responsible'); ?></div>
                    </div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('unit'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('unit'); ?></div>
                    </div>

                    <?php
                    foreach ((array) $this->item->unit as $value):
                        if (!is_array($value)):
                            echo '<input type="hidden" class="unit" name="jform[unithidden][' . $value . ']" value="' . $value . '" />';
                        endif;
                    endforeach;
                    ?>			<div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('category'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('category'); ?></div>
                    </div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('type'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('type'); ?></div>
                    </div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('increase'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('increase'); ?></div>
                    </div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('periodicity'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('periodicity'); ?></div>
                    </div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('version'); ?></div>
                        <div class="controls"><?php echo $this->form->getInput('version'); ?></div>
                    </div>
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
