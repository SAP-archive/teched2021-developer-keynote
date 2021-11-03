using CatalogService from './cat-service';

annotate CatalogService.PerPersonal with {
    id            @(
        Core.Computed,
        title       : '{i18n>id}',
        Common.Text : {
            $value                 : firstName,
            ![@UI.TextArrangement] : #TextLast
        }
    );
    firstName     @(title : '{i18n>firstName}');
    lastName      @(title : '{i18n>lastName}');
    personalTitle @(title : '{i18n>title}');
};

annotate CatalogService.PerPersonal with {
    middelName @(title : '{i18n>middelName}')
};

annotate CatalogService.PerPersonal with @(
    title                  : '{i18n>PerPersonal}',
    UI.TextArrangement     : #TextOnly,
    cds.odata.valuelist,
    Common.SemanticKey     : [firstName],
    UI.Identification      : [{
        $Type : 'UI.DataField',
        Value : firstName

    }],

    UI.LineItem            : [
        {
            $Type             : 'UI.DataField',
            Value             : id,
            ![@UI.Importance] : #High
        },
        {
            $Type             : 'UI.DataField',
            Value             : firstName,
            ![@UI.Importance] : #High
        },
        {
            $Type             : 'UI.DataField',
            Value             : middelName,
            ![@UI.Importance] : #High
        },

        {
            $Type             : 'UI.DataField',
            Value             : lastName,
            ![@UI.Importance] : #High
        },
    ],
    UI.SelectionFields     : [
        id,
        firstName,
        lastName,
    ],

    UI.HeaderInfo          : {
        Title          : {
            $Type : 'UI.DataField',
            Value : firstName,
        },
        TypeName       : '{i18n>PerPersonal}',
        TypeNamePlural : '{i18n>PerPersonalM}',
        Description    : {Value : lastName},
    },
    UI.FieldGroup #Details : {Data : [
        {
            $Type : 'UI.DataField',
            Value : firstName
        },
        {
            $Type : 'UI.DataField',
            Value : middelName
        },
        {
            $Type : 'UI.DataField',
            Value : lastName
        },
    ]

    },

    UI.Facets              : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'PersonalDetails',
        Label  : '{i18n>details}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>details}',
            Target : '@UI.FieldGroup#Details'
        }]
    }]
);
