using {ECPersonalInformation as external} from './external';

service CatalogService {

    @cds.persistence : {
        table,
        skip : false
    }
    @cds.autoexpose
    entity PerPersonal  as
        select from external.PerPersonalExt {
            *,
            '' as middelName : String
        };

}
