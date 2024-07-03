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
| diameter_in_french        | True     | integer                               |
| length_in_centimeters     | True     | integer                               |
| coating                   |          | text                                  |
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
| [36717851](https://athena.ohdsi.org/search-terms/terms/36717851){:target="_blank"} | Single-lumen extracorporeal life support cannula |
| [36717852](https://athena.ohdsi.org/search-terms/terms/36717852){:target="_blank"} | Dual-lumen extracorporeal life support cannula |
| [36717853](https://athena.ohdsi.org/search-terms/terms/36717853){:target="_blank"} | Single-lumen extracorporeal life support cannula with integrated distal perfusion outlet |

## .diameter_in_french
The outer diameter of the cannula in French(Charrière).

## .length_in_centimeters
The overall cannula length as to the manufacturer's data sheet in centimeters.

## .coating
If applicable, the name of the coating used.

## .ref
If applicable, the reference number of the component. This is usually
the manufacturer's internal model number. This number can be used for cross-
checking, when adding data to the core tables.

## .udi
If applicable, the Unique Device Identifier, consisting of the UDI-DI
*without* the UDI-PI.
