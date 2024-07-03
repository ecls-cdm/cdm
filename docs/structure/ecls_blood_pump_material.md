!!! warning "Do not modify the material table records!"
    The material tables are managed by the ECLS CDM community and any
    local modification will render your ECLS CDM version incompatible.

    If you wish to add more material, please open a GitHub issue, so that
    your request can be processed and accepted by the community.

This table contains a selection of pre-existing blood pumps used in the
context of extracorporeal life support.

| Column name               | Required | Data Type                             |
| ------------------------- | -------- | ------------------------------------- |
| material_id               | True     | integer, generated always as identity |
| name                      | True     | text                                  |
| manufacturer              | True     | text                                  |
| type_concept_id           | True     | integer                               |
| ref                       |          | text                                  |
| udi                       |          | text                                  |

## .material_id
The primary key.

## .name
The official name of the component.

## .manufacturer
The manufacturer's company name.

## .type_concept_id
The foreign key to the *concept* table. <br>
This attribute provides details about the type of component.

**Allowed concepts:**

| concept                                                                            |                       concept_name  |
|------------------------------------------------------------------------------------|-------------------------------------|
| [4129113](https://athena.ohdsi.org/search-terms/terms/4129113){:target="_blank"}   | Centrifugal pump (physical object)  |
| [45764276](https://athena.ohdsi.org/search-terms/terms/45764276){:target="_blank"} | Basic roller pump (physical object) |

## .ref
If applicable, the reference number of the component. This is usually
the manufacturer's internal model number. This number can be used for cross-
checking, when adding data to the core tables.

## .udi
If applicable, the Unique Device Identifier, consisting of the UDI-DI
*without* the UDI-PI.
