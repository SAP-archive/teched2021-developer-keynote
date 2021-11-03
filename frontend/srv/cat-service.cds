using { ECPersonalInformation as external } from './external/ECPersonalInformation.csn';

service CatalogService {

    @cds.persistence : {
        table,
        skip : false
    }
    @cds.autoexpose
    entity PerPersonal as
    projection on external.PerPersonal {
        firstName,
        lastName,
        nationality,
        initials as nameHeader,
        title as personalTitle,
        key personIdExternal as id,
        key startDate,
        '' as middelName : String

    }
}
