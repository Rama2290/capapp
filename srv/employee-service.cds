using { sap.ui.capapp as my } from '../db/schema';

@path: 'service/employee'
service EmployeeService {
  entity Employees as projection on my.Employees;
    annotate Employees with @odata.draft.enabled;
  entity Skills as projection on my.Skills;
    annotate Skills with @odata.draft.enabled;
  entity Skills2Employees as projection on my.Skills2Employees;
    annotate SkillsEmployees with @odata.draft.enabled;
    
}