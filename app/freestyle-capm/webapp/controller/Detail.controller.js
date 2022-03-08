sap.ui.define([
	"sap/ui/core/mvc/Controller",
	"sap/ui/core/routing/History",
	"sap/ui/core/Fragment"

], function (Controller, History, Fragment) {
	"use strict";
	return Controller.extend("freestyle.capm.controller.Detail", {
		onInit: function () {
			var oRouter = this.getOwnerComponent().getRouter();
			oRouter.getRoute("detail").attachPatternMatched(this._onObjectMatched, this);
		},
		_onObjectMatched: function (oEvent) {
			this.getView().bindElement({
				path : "/Employees(ID=" + window.decodeURIComponent(oEvent.getParameter("arguments").employeePath)+",IsActiveEntity=true)"
				
			});
			console.log('in object', window.decodeURIComponent(oEvent.getParameter("arguments").employeePath));

		},
		onNavBack: function () {
			var oHistory = History.getInstance();
			var sPreviousHash = oHistory.getPreviousHash();

			if (sPreviousHash !== undefined) {
				window.history.go(-1);
			} else {
				var oRouter = this.getOwnerComponent().getRouter();
				oRouter.navTo("overview", {}, true);
			}
		},
		EditEmployee: function () {
			console.log('edit button pressed');
		},
		DeleteEmployee: function () {
			console.log('pressed delete employee');
		},
		saveEmployeeEdit: function () {
			this.byId("editEmployeeDialog").close();
		},
		addSkill: function () {
			console.log('clicked add Skill');
		}
	});
});