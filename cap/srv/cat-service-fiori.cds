using CatalogService from './cat-service';
using ECPersonalInformation from './external';

annotate ECPersonalInformation.PerPersonalExt with {
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
    nameHeader    @(title : '{i18n>nameHeader}');
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
        {
            $Type             : 'UI.DataField',
            Value             : nameHeader,
            ![@UI.Importance] : #Low
        },
        {
            $Type             : 'UI.DataField',
            Value             : personalTitle,
            ![@UI.Importance] : #Low
        },

    ],
    UI.SelectionFields     : [
        id,
        firstName,
        lastName,
        nameHeader
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
        {
            $Type : 'UI.DataField',
            Value : nameHeader
        },
        {
            $Type : 'UI.DataField',
            Value : personalTitle
        }
    ]

    },

    UI.Facets              : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'FilmDetails',
        Label  : '{i18n>details}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>details}',
            Target : '@UI.FieldGroup#Details'
        }]
    }]
);
