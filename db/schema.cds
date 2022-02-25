namespace sap.ui.capapp;
using { managed } from '@sap/cds/common';

  entity Employees : managed {
    key ID          : UUID  @(Core.Computed : true);
    name            : String(100);
    department      : String(100);
    title           : String(100);
    role            : String(100);
    industry        : String(100);
    directReport    : String(100);
    startDate       : Date;
    email           : String(100);
    skill_id         : Association to many Skills_Employees on skill_id.employee = $self;
  }

  entity Skills : managed {
    key ID       : UUID  @(Core.Computed : true);
    skill        : String;
    type         : String;
    institution  : String;
    dateAcquired : Date;
    renewal      : String;
    comfortLevel : Integer;
    employee_id     : Association to many Skills_Employees on employee_id.skill = $self;
  }

  entity Skills_Employees {
      skill : Association to Skills;
      employee : Association to Employees;
  }

