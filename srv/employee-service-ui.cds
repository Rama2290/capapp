using EmployeeService as service from './employee-service';

annotate service.Employees with @(
    UI.LineItem                : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Name'
        },
        {
            $Type : 'UI.DataField',
            Value : department,
            Label : 'Department'
        },
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'Title'
        },
    ],
    UI.HeaderInfo              : {
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
    UI.Facets                  : [
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'General Info',
            Target : '@UI.FieldGroup#GeneralInfo'
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Skills',
            Target : 'skills/@UI.LineItem'
        }
    ],
    UI.FieldGroup #GeneralInfo : {Data : [
        {
            Value : title,
            Label : 'Title'
        },
        {
            Value : role,
            Label : 'Role'
        },
        {
            Value : email,
            Label : 'Email'
        },
        {
            Value : startDate,
            Label : 'Start Date'
        },
        {
            Value : industry,
            Label : 'Industry'
        }
    ]}
);

annotate service.Skills2Employees with @(
    UI.LineItem           : [
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
        {
            $Type : 'UI.DataField',
            Value : renewal,
            Label : 'Renewal Status'
        },
    ],
    UI.HeaderInfo         : {
        TypeName       : 'Skill',
        TypeNamePlural : 'Skill',
        Title          : {
            $Type : 'UI.DataField',
            Value : skill.skill
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : dateAcquired
        }
    },
    UI.Facets             : [{
        $Type  : 'UI.ReferenceFacet',
        Label  : 'General Information',
        Target : '@UI.FieldGroup#Detail'
    },
   
//     @Common : {
//         Text            : skill.skill,
//         TextArrangement : #TextOnly
//     }
//     @Common.ValueListWithFixedValues : true
//     @Common.ValueList : {
//         $Type : 'Common.ValueListType',
//         Label : 'Currency',
//         CollectionPath : 'Currencies',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : currency_code,
//                 ValueListProperty : 'code'
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'name'
//             }
//         ]
//     }
//     @Core.Description : 'A currency code as specified in ISO 4217'
//     currency_code
// },

    
    
     ],
    UI.FieldGroup #Detail : {Data : [
        {
            Value : skill.institution,
            Label : 'Institution'
        },
        {
            Value : skill.type,
            Label : 'Type of Skill'
        },
        {
            Value : comfortLevel,
            Label : 'Comfort Level'
        },
        {
            Value : renewal,
            Label : 'Renewal Status'
        }
    ]}
);
