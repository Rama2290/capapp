using EmployeeService as service from './employee-service';

annotate service.Employees with @(
    UI.LineItem         : [
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : department
        },
        {
            $Type : 'UI.DataField',
            Value : title
        },
    ],
    UI.HeaderInfo       : {
        TypeName       : 'Employee',
        TypeNamePlural : 'Employees',
        Title          : {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name'
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : department,
            Label : 'Department'
        }
    },
    UI.Facets: [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Main',
            Target : '@UI.FieldGroup#Main'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Skills',
            Target : 'skills/@UI.LineItem'
        }
    ],
    UI.FieldGroup #Main : {
        Data : [
        {
            Value : title,
            Label: 'Title'
        },
        {
            Value : role,
            Label: 'Role'
        },
        {
            Value : email,
            Label: 'Email'
        },
        {
            Value : startDate,
            Label : 'Start Date'
        },
        {
            Value : industry,
            Label : 'Industry'}
    ]}
);

annotate service.Skills2Employees with @(UI.LineItem : [
    {
        $Type : 'UI.DataField',
        Value : skill.skill,
        Label : 'Skill'
    },
    {
        $Type : 'UI.DataField',
        Value : skill.institution,
        Label : 'Institution'
    },
    {
        $Type : 'UI.DataField',
        Value : skill.type,
        Label : 'Type'
    },
    {
        $Type : 'UI.DataField',
        Value : dateAcquired,
        Label : 'Date Acquired'
    },
    {
        $Type : 'UI.DataField',
        Value : comfortLevel,
        Label : 'Comfort Level'
    },
    {
        $Type : 'UI.DataField',
        Value : renewal,
        Label : 'Renewal Status'
    },
]);
