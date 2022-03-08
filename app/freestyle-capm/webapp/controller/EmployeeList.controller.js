sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/Fragment"

], function (Controller, Fragment) {
    "use strict";

    return Controller.extend("freestylecapm.controller.EmployeeList", {
        onInit: function () {
        },
        addEmployee: function () {
            //   console.log('clicked Add Employee')
            var employeeList = this.byId("idEmployeeTable"),
                employeeBinding = employeeList.getBinding("items"),
                oContext = employeeBinding.create({
                    "name": "name",
                    "department": "dept",
                    "title": "title",
                    "role": "role",
                    "industry": "inds",
                    "directReport": "direct Report",
                    "startDate": "Jan 14, 2022",
                    "email": "email@email"
                });
            console.log('employeeBinding', employeeBinding);
            console.log('oContext', oContext);

            employeeList.getItems().some(function (oItem) {
                if (oItem.getBindingContext() === oContext) {
                    oItem.focus();
                    oItem.setSelected(true);
                    return true;
                }
            });
            onSave();
        },
        onSave : function () {
			this.getView().getModel().submitBatch();
		},
      
        //NAVIGATION 
        onPress: function (oEvent) {
            var oItem = oEvent.getSource();
            var oRouter = this.getOwnerComponent().getRouter();
            console.log('Click');
            oRouter.navTo("detail", {
                employeePath: window.encodeURIComponent((oItem.getBindingContext().getProperty("ID")))
            });
        }

    });
});