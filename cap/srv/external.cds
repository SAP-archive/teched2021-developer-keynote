using { ECPersonalInformation as external } from './external/ECPersonalInformation.csn';

extend service ECPersonalInformation with {

    @mashup entity PerPersonalExt as projection on external.PerPersonal {
        businessFirstName as firstName,
        businessLastName as lastName,
        maritalStatus as maritalStatus,
        title as title,
        key personIdExternal as id

    } 
}