using EmployeeService as service from './employee-service';

annotate service.Employees with @(
    UI.LineItem : [
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
    UI.HeaderInfo: {
			TypeName: 'Employee',
			TypeNamePlural: 'Employees',
			Title          : {
                $Type : 'UI.DataField',
                Value : name
            },
			Description : {
				$Type: 'UI.DataField',
				Value: department
			}
		},
    UI.Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'},
            {$Type: 'UI.ReferenceFacet', Label: 'Skills', Target: 'skills/@UI.LineItem'}
		],
    UI.FieldGroup#Main: {
        Data: [
            {Value: ID},
            {
                Value: title
            },
            {
                Value: email
            }
        ]
    }
);

annotate service.Skills2Employees with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : skill.skill,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : skill.institution,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : skill.type,
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : comfortLevel,
            ![@UI.Importance] : #High,
        },
    ]
);