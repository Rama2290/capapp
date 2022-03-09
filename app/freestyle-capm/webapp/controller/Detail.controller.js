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
				path: "/Employees(ID=" + window.decodeURIComponent(oEvent.getParameter("arguments").employeePath)+",IsActiveEntity=true)"
			});
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
		// OnItemPress: function (oEvent) {
		// 	let oEmployeeIdSelected = oEvent.getSource().getProperty("number");
		// 	this._EmployeeIdSelected = oEmployeeIdSelected;
		// },
		EditEmployee: function (oEvent) {
			if (!this.EditEmployeeDialog) {
				this.EditEmployeeDialog = this.loadFragment({
					name: "employeeskills.view.EditEmployeeDialog"
				});
			}
			this.EditEmployeeDialog.then(function (oDialog) {
				oDialog.open();
			});
		},
		saveEmployeeEdit: function () {
			this.byId("editEmployeeDialog").close();
		},

		addSkill: function () {
			if (!this.pDialog) {
				this.pDialog = this.loadFragment({
					name: "employeeskills.view.SkillDialog"
				});
			}
			this.pDialog.then(function (oDialog) {
				oDialog.open();
			});
		},
		saveSkill: function () {
			var assignedSkillNumber = this.getView().getBindingContext("employee").getProperty("assignedSkills").length;

			var NewSkillID = assignedSkillNumber;
			var NewSkillTitle = this.getView().byId("skillTitle").getValue();
			var NewSkillType = this.getView().byId("skillType").getValue();
			var NewSkillInstitution = this.getView().byId("institution").getValue();
			var NewSkillDateAcquired = this.getView().byId("dateAcquired").getValue();
			var NewSkillRenewal = this.getView().byId("renewal").getValue();
			var NewSkillComfortLevel = this.getView().byId("comfortLevel").getValue();

			var skillToAssign = {};
			skillToAssign = {
				"skillId": NewSkillID,
				"skillTitle": NewSkillTitle,
				"skillType": NewSkillType,
				"institution": NewSkillInstitution,
				"dateAcquired": NewSkillDateAcquired,
				"renewal": NewSkillRenewal,
				"comfortLevel": NewSkillComfortLevel
			};
			var assignedSkills = this.getView().getBindingContext("employee").getProperty("assignedSkills");
			assignedSkills.push(skillToAssign);
			var employeeAssignedSkillsPath = this.getView().getBindingContext("employee").getPath("assignedSkills");
			this.getView().getModel("employee").setProperty(employeeAssignedSkillsPath, assignedSkills);

			this.pDialog.then(function (oDialog) {
				oDialog.close();
			});
		},
		cancelButton: function () {
			this.byId("SkillDialog").close();
		},
		DeleteEmployee: function (oEvent) {
			if (!this.deleteDialog) {
				this.deleteDialog = this.loadFragment({
					name: "employeeskills.view.DeleteEmployeeDialog"
				});
			}
			this.deleteDialog.then(function (oDialog) {
				oDialog.open();
			});
		},
		onDelete: function (oEvent) {

			var employeeModel = this.getView().getModel("employee");

			var employeePath = oEvent.getSource().getBindingContext("employee").getPath();
			this._employee = employeePath.charAt(employeePath.length - 1);

			var oEmployeeIdSelected = this._employee;
			var oEmployees = employeeModel.getProperty("/Employees");

			oEmployees.splice(oEmployeeIdSelected, 1);
			employeeModel.setProperty("/Employees", oEmployees);

			this.byId("deleteDialog").close();
		},
		onCloseDeleteDialog: function () {
			this.byId("deleteDialog").close();
		}

	});
});