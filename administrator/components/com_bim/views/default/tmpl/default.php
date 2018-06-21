<?php 
defined('_JEXEC') or die;
JHtml::addIncludePath(JPATH_COMPONENT . '/helpers/html');
JHtml::_('bootstrap.tooltip');
JHtml::_('behavior.multiselect');
JHtml::_('formbehavior.chosen', 'select');

// Import CSS
$document = JFactory::getDocument();
$document->addStyleSheet(JUri::base() . '/components/com_bim/assets/css/bim.css');

$user = JFactory::getUser();
$userId = $user->get('id');

$params = $this->params;
$isSuperAdmin = JAccess::check($user->id, 'core.admin');

?>
<div class="consultascagece-fluid"> 
    <div class="row-fluid">
        <div id="cpanel" class="span6">
            <div class="icon">
                <a target="_blank" href="<?php echo str_replace('/administrator', '', JURI::root()); ?>index.php?option=com_bim&amp;view=dashboard">
                    <img src="components/com_bim/assets/images/l_dashboard.png" border="0" alt="<?php echo JText::_('COM_BIM_TITLE_DASHBOARD'); ?>">
                    <span>
                        <?php echo JText::_('COM_BIM_TITLE_DASHBOARD'); ?>
                    </span>
                </a>
            </div>
            <?php
            if (in_array($params->get('admin'), $user->groups) || in_array($params->get('responsible'), $user->groups) || $isSuperAdmin) { ?>
            <div class="icon">
                <a href="index.php?option=com_bim&amp;view=kpis">
                    <img src="components/com_bim/assets/images/l_kpis.png" border="0" alt="<?php echo JText::_('COM_BIM_TITLE_KPIS'); ?>">
                    <span>
                         <?php echo JText::_('COM_BIM_TITLE_KPIS'); ?>
                    </span>
                </a>
            </div>
            <?php }
            if (in_array($params->get('admin'), $user->groups) || $isSuperAdmin) { ?>
            <div class="icon">
                <a href="index.php?option=com_bim&amp;view=categories">
                    <img src="components/com_bim/assets/images/l_categories.png" border="0" alt="<?php echo JText::_('JCATEGORIES'); ?>">
                    <span>
                        <?php echo 'KPIs - ' . JText::_('JCATEGORIES'); ?>
                    </span>
                </a>
            </div>
            <?php } 
            if (in_array($params->get('admin'), $user->groups) || in_array($params->get('responsible'), $user->groups) || $isSuperAdmin) { ?>
            <div class="icon">
                <a href="index.php?option=com_bim&amp;view=goals">
                    <img src="components/com_bim/assets/images/l_goals.png" border="0" alt="<?php echo JText::_('COM_BIM_TITLE_GOALS'); ?>">
                    <span>
                        <?php echo JText::_('COM_BIM_TITLE_GOALS'); ?>
                    </span>
                </a>
            </div>
            <?php }
            if (in_array($params->get('employee'), $user->groups) || in_array($params->get('responsible'), $user->groups) || $isSuperAdmin) { ?>
            <div class="icon">
                <a href="index.php?option=com_bim&amp;view=values">
                    <img src="components/com_bim/assets/images/l_values.png" border="0" alt="<?php echo JText::_('COM_BIM_TITLE_VALUES'); ?>">
                    <span>
                        <?php echo JText::_('COM_BIM_TITLE_VALUES'); ?>
                    </span>
                </a>
            </div>
            <?php }
            if (in_array($params->get('admin'), $user->groups) || $isSuperAdmin) { ?>
            <div class="icon">
                <a href="index.php?option=com_users&view=groups">
                    <img src="templates/hathor/images/header/icon-48-groups.png" border="0" alt="<?php echo JText::_('COM_BIM_TITLE_UNITS'); ?>">
                    <span>
                        <?php echo JText::_('COM_BIM_TITLE_UNITS'); ?>
                    </span>
                </a>
            </div>
            <?php }
            if (in_array($params->get('responsible'), $user->groups) || in_array($params->get('employee'), $user->groups) || $isSuperAdmin) { ?>
            <div class="icon">
                <a href="index.php?option=com_bim&view=meetings">
                    <img src="components/com_bim/assets/images/l_meetings.png" border="0" alt="<?php echo JText::_('COM_BIM_TITLE_MEETINGS'); ?>">
                    <span>
                        <?php echo JText::_('COM_BIM_TITLE_MEETINGS'); ?>
                    </span>
                </a>
            </div>
            <?php }
            if (in_array($params->get('auditor'), $user->groups) || $isSuperAdmin) { ?>
            <div class="icon">
                <a href="index.php?option=com_bim&view=audits">
                    <img src="components/com_bim/assets/images/l_audits.png" border="0" alt="<?php echo JText::_('COM_BIM_TITLE_AUDITS'); ?>">
                    <span>
                        <?php echo JText::_('COM_BIM_TITLE_AUDITS'); ?>
                    </span>
                </a>
            </div>
            <?php } ?>
            <div style="clear: both;"></div>
        </div>
        <div id="sidepanes" class="span6">
            <div class="well">
                <h3>Business Indicator Management 1.0</h3>
                <div>
                    <!-- CHANGELOG :: BEGIN -->
                    <h4>CHANGELOG</h4>
                    <p>...</p>
                </div>
            </div>


            <div id="disclaimer" class="alert alert-info" style="margin-top: 2em;">
                <a class="close" data-dismiss="alert" href="#">×</a>

                <h3>Disclamer</h3>

                <p>
                    ...
                </p>
            </div>
        </div>
    </div>
</div>