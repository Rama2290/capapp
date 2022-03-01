namespace sap.ui.capapp;
using { managed } from '@sap/cds/common';

  entity Employees  : managed {
    key ID          : Integer;
    name            : String(100);
    department      : String(100);
    title           : String(100);
    role            : String(100);
    industry        : String(100);
    directReport    : String(100);
    startDate       : Date;
    email           : String(100);
    skills          : Association to Skills2Employees on skills.employee = $self;
  }

  entity Skills  : managed {
    key ID       : Integer;
    skill        : String;
    type         : String;
    institution  : String;
    employees    : Association to many Skills2Employees on employees.skill = $self;
  }

  entity Skills2Employees : managed {
    key ID      : Integer;
    skill       : Association to Skills;
    employee    : Association to Employees;
    dateAcquired : Date;
    renewal      : String;
    comfortLevel : Integer;
  }

