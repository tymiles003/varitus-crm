{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*************************************************************************************}

{strip}
	<div class="col-sm-12 col-xs-12 module-action-bar clearfix">
		<div class="module-action-content clearfix coloredBorderTop">
			<div class="col-lg-5 col-md-5">
				<span>
					{assign var="VIEW_HEADER_LABEL" value="LBL_CALENDAR_VIEW"}
					{if $VIEW === 'SharedCalendar'}
						{assign var="VIEW_HEADER_LABEL" value="LBL_SHARED_CALENDAR"}
					{/if}
					<a href='javascript:void(0)'><h4 class="module-title pull-left"><span style="cursor: default;"> {strtoupper(vtranslate($VIEW_HEADER_LABEL, $MODULE))} </span></h4></a>
				</span>
			</div>
			<div class="col-lg-7 col-md-7 pull-right">
				<div id="appnav" class="navbar-right">
					<ul class="nav navbar-nav">
						<li>
							<button id="calendarview_basicaction_addevent" type="button" 
									class="btn addButton btn-default module-buttons cursorPointer" 
									onclick='Calendar_Calendar_Js.showCreateEventModal();'>
								<div class="fa fa-plus" aria-hidden="true"></div>&nbsp;&nbsp;
								{vtranslate('LBL_ADD_EVENT', $MODULE)}
							</button>
							<button id="calendarview_basicaction_addtask" type="button" 
									class="btn addButton btn-default module-buttons cursorPointer" 
									onclick='Calendar_Calendar_Js.showCreateTaskModal();'>
								<div class="fa fa-plus" aria-hidden="true"></div>&nbsp;&nbsp;
								{vtranslate('LBL_ADD_TASK', $MODULE)}
							</button>
						</li>
						{if $MODULE_SETTING_ACTIONS|@count gt 0}
							<li>
								<div class="settingsIcon">
									<button type="button" class="btn btn-default module-buttons dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
										<span class="fa fa-wrench" aria-hidden="true" title="{vtranslate('LBL_SETTINGS', $MODULE)}"></span>&nbsp;&nbsp;{vtranslate('LBL_CUSTOMIZE', 'Reports')}&nbsp; <span class="caret"></span>
									</button>
									<ul class="detailViewSetting dropdown-menu">
										{foreach item=SETTING from=$MODULE_SETTING_ACTIONS}
											<li id="{$MODULE_NAME}_lisview_advancedAction_{$SETTING->getLabel()}"><a href={$SETTING->getUrl()}>{vtranslate($SETTING->getLabel(), $MODULE_NAME,$MODULE_NAME)}</a></li>
											{/foreach}
										<li>
											<a><span id="calendarview_basicaction_calendarsetting" onclick='Calendar_Calendar_Js.showCalendarSettings();'
													 class="cursorPointer">
													{vtranslate('LBL_CALENDAR_SETTINGS', 'Calendar')}
												</span></a>
										</li>
									</ul>
								</div>
							</li>
						{/if}
					</ul>
				</div>
			</div>
		</div>
		{if $FIELDS_INFO neq null}
			<script type="text/javascript">
				var uimeta = (function () {
					var fieldInfo = {$FIELDS_INFO};
					return {
						field: {
							get: function (name, property) {
								if (name && property === undefined) {
									return fieldInfo[name];
								}
								if (name && property) {
									return fieldInfo[name][property]
								}
							},
							isMandatory: function (name) {
								if (fieldInfo[name]) {
									return fieldInfo[name].mandatory;
								}
								return false;
							},
							getType: function (name) {
								if (fieldInfo[name]) {
									return fieldInfo[name].type
								}
								return false;
							}
						},
					};
				})();
			</script>
		{/if}
	</div>
{/strip}