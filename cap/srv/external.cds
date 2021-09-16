using { ECPersonalInformation as external } from './external/ECPersonalInformation.csn';

extend service ECPersonalInformation with {

    @mashup entity PerPersonalExt as projection on external.PerPersonal {
        firstName,
        lastName,
        initials as nameHeader,
        title as personalTitle,
        key personIdExternal as id

    } 
}