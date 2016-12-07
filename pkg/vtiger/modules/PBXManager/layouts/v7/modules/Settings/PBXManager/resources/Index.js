/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

Settings_Vtiger_Index_Js("Settings_PBXManager_Index_Js", {}, {
	/*
	 * function to Save the PBXManager Server Details
	 */
	saveAsteriskServerDetails: function (form) {
		var thisInstance = this;
		var data = form.serializeFormData();

		app.helper.showProgress();
		if (typeof data == 'undefined') {
			data = {};
		}
		data.module = app.getModuleName();
		data.parent = app.getParentModuleName();
		data.action = 'SaveAjax';

		app.request.post(data).then(
			function (data) {
				if (data['success']) {
					var OutgoingServerDetailUrl = form.data('detailUrl');
					//after save, load detail view contents and register events
					thisInstance.loadContents(OutgoingServerDetailUrl).then(
						function (data) {
							app.helper.hideProgress();
							thisInstance.registerDetailViewEvents();
						},
						function (error, err) {
							app.helper.hideProgress();
						}
					);
				} else {
					app.helper.hideProgress();
					jQuery('.errorMessage', form).removeClass('hide');
				}
			},
			function (error, errorThrown) {
			}
		);
	},
	/*
	 * function to register the events in editView
	 */
	registerEditViewEvents: function () {
		var thisInstance = this;
		var form = jQuery('#MyModal');
		var cancelLink = jQuery('.cancelLink', form);

		//To Auto-Generate Vtiger Secret Key
		var url = 'index.php?module=PBXManager&parent=Settings&action=Gateway&mode=getSecretKey';
		app.request.post(url).then(
			function (data) {
				jQuery("input[name='vtigersecretkey']").attr("value", data.result);
			}
		);
		//END

		//register validation engine
		var params = app.validationEngineOptions;
		params.onValidationComplete = function (form, valid) {
			if (valid) {
				thisInstance.saveAsteriskServerDetails(form);
				return valid;
			}
		}
		form.validationEngine(params);
		//END

		form.submit(function (e) {
			e.preventDefault();
		});

		//register click event for cancelLink
		cancelLink.click(function (e) {
			var OutgoingServerDetailUrl = form.data('detailUrl');
			var progressIndicatorElement = jQuery.progressIndicator({
				'position': 'html',
				'blockInfo': {
					'enabled': true
				}
			});

			thisInstance.loadContents(OutgoingServerDetailUrl).then(
				function (data) {
					app.helper.hideProgress();
					//after loading contents, register the events
					thisInstance.registerDetailViewEvents();
				},
				function (error, err) {
					app.helper.hideProgress();
				}
			);
		});
		//END
	},
	/*
	 * function to register the events in DetailView
	 */
	registerDetailViewEvents: function () {
		var thisInstance = this;
		//Detail view container
		var container = jQuery('#AsteriskServerDetails');
		var editButton = jQuery('.editButton', container);

		editButton.click(function (e) {
			var url = jQuery(e.currentTarget).data('url');
			app.helper.showProgress();

			thisInstance.loadContents(url).then(
				function (data) {
					//after load the contents register the edit view events
					thisInstance.registerEditViewEvents();
					app.helper.hideProgress();
				},
				function (error, err) {
					app.helper.hideProgress();
				}
			);
		});
	},
	/*
	 * function to load the contents from the url through pjax
	 */
	loadContents: function (url) {
		var aDeferred = jQuery.Deferred();
		app.request.pjax(url).then(
			function (data) {
				jQuery('.contentsDiv').html(data);
				aDeferred.resolve(data);
			},
			function (error, err) {
				aDeferred.reject();
			}
		);
		return aDeferred.promise();
	},
	// to Registering required Events on list view page load
	registerEvents: function () {
		var thisInstance = this;
		thisInstance.registerDetailViewEvents();
	}
});

jQuery(document).ready(function (e) {
	var instance = new Settings_Vtiger_Index_Js();
	instance.registerEvents();
});

