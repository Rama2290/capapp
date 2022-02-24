namespace sap.ui.riskmanagement;
using { managed } from '@sap/cds/common';

  entity Employees : managed {
    key ID          : UUID  @(Core.Computed : true);
    Name            : String(100);
    department      : String(100);
    title           : String(100);
    role            : String(100);
    industry        : String(100);
    directReport    : String(100);
    startDate       : Date;
    email           : String(100);
    skills          : Association to many Skills_Employees on skills.employee = $self;
  }

  entity Skills : managed {
    key ID       : UUID  @(Core.Computed : true);
    skill        : String;
    type         : String;
    institution  : String;
    dateAcquired : Date;
    renewal      : Date;
    comfortLevel : Integer;
    employee     : Association to many Skills_Employees on employee.skill = $self;
  }

  entity Skills_Employees {
      skill : Association to Skills;
      employee : Association to Employees;
  }
