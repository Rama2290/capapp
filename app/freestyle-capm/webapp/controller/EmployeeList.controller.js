sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/Fragment"

], function (Controller, Fragment) {
    "use strict";

    return Controller.extend("freestyle-capm.controller.EmployeeList", {
        onInit: function () {
        },
        addEmployee: function () {
            if (!this.pDialog) {
                this.pDialog = this.loadFragment({
                    name: "freestyle-capm.view.AddEmployeeDialog"
                });
            }
            this.pDialog.then(function (oDialog) {
                oDialog.open();
            });
        },
        saveEmployee: function () {

            var oModel = this.getView().getModel("employee");
            var EmployeesNumber = oModel.getProperty("/Employees").length;
            
            var NewEmployeeID = EmployeesNumber;
            var NewEmployeeFullName = this.getView().byId("fullName").getValue();
            var NewEmployeeDepartment = this.getView().byId("department").getValue();
            var NewEmployeeTitle = this.getView().byId("title").getValue();
            var NewEmployeeRole = this.getView().byId("role").getValue();
            var NewEmployeeIndustry = this.getView().byId("industries").getValue();
            var NewEmployeeDirectReport = this.getView().byId("directReport").getValue();
            var NewEmployeeStartDate = this.getView().byId("startDate").getValue();
            var NewEmployeeEmail = this.getView().byId("email").getValue();

            var oEmployee = {};
            oEmployee = {
                "id": NewEmployeeID,
                "fullName": NewEmployeeFullName,
                "department": NewEmployeeDepartment,
                "title": NewEmployeeTitle,
                "role": NewEmployeeRole,
                "industries": NewEmployeeIndustry,
                "directReport": NewEmployeeDirectReport,
                "startDate": NewEmployeeStartDate,
                "email": NewEmployeeEmail,
                "assignedSkills": []
            };

            var oEmployees = oModel.getProperty("/Employees");
            oEmployees.push(oEmployee);
            oModel.setProperty("/Employees", oEmployees);
            this.pDialog.then(function (oDialog) {
                oDialog.close();
            });
        },
        cancelButton: function () {
            this.byId("addEmployeeDialog").close();
        },

        
//NAVIGATION 
            onPress: function (oEvent) {
                var oItem = oEvent.getSource();
                var oRouter = this.getOwnerComponent().getRouter();
                console.log('Click');
                oRouter.navTo("detail", {
                    employeePath: window.encodeURIComponent((oItem.getBindingContext("employee").getProperty("id")))
                });
            }

        });
});