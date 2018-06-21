<?php
/**
 * @version    CVS: 1.0.0
 * @package    Com_Test
 * @author     Paulo Andrade <martinsp@uregina.ca>
 * @copyright  Copyright (C) 2016. All rights reserved.
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;


?>
<?php if ($this->item) : ?>

	<div class="item_fields">
		<table class="table">
			<tr>
			<th><?php echo JText::_('COM_TEST_FORM_LBL_ITEM_STATE'); ?></th>
			<td>
			<i class="icon-<?php echo ($this->item->state == 1) ? 'publish' : 'unpublish'; ?>"></i></td>
</tr>
<tr>
			<th><?php echo JText::_('COM_TEST_FORM_LBL_ITEM_CREATED_BY'); ?></th>
			<td><?php echo $this->item->created_by_name; ?></td>
</tr>
<tr>
			<th><?php echo JText::_('COM_TEST_FORM_LBL_ITEM_MODIFIED_BY'); ?></th>
			<td><?php echo $this->item->modified_by_name; ?></td>
</tr>
<tr>
			<th><?php echo JText::_('COM_TEST_FORM_LBL_ITEM_TITLE'); ?></th>
			<td><?php echo $this->item->title; ?></td>
</tr>
<tr>
			<th><?php echo JText::_('COM_TEST_FORM_LBL_ITEM_ALIAS'); ?></th>
			<td><?php echo $this->item->alias; ?></td>
</tr>
<tr>
			<th><?php echo JText::_('COM_TEST_FORM_LBL_ITEM_CATEGORY'); ?></th>
			<td><?php echo $this->item->category_title; ?></td>
</tr>

		</table>
	</div>
	
	<?php
else:
	echo JText::_('COM_TEST_ITEM_NOT_LOADED');
endif;
