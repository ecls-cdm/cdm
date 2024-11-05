This table is used for information regarding the temperature
regulation devices (heating and cooling functionality) that are attached
to the circuit to manage the patient's temperature.

| Column name                      | Required | Data Type                             |
| -------------------------------- | -------- | ------------------------------------- |
| temperature_regulation_device_id | True     | integer, generated always as identity |
| start_datetime                   | True     | timestamptz                           |
| stop_datetime                    | (True)   | timestamptz                           |
| person_id                        | True     | integer                               |
| stop_reason_concept_id           | (True)   | integer                               |
| material_id                      | True     | integer                               |
| sn                               |          | text                                  |
| lot                              |          | text                                  |
| ref                              |          | text                                  |
| udi                              |          | text                                  |

## .temperature_regulation_device_id

The primary key.

## .start_datetime

Use the date and time when the temperature regulation device was started.

## .stop_datetime

Use the date and time the temperature regulation device was removed.

## .person_id

The foreign key to _person_ table.

## .stop_reason_concept_id

The foreign key to _concept_ table.<br>
Choose the right concept to describe, why the temperature regulation device was removed.

**Allowed concepts:**

| concept_id                                                                           | concept_name                 | comment                                                                 |
| ------------------------------------------------------------------------------------ | ---------------------------- | ----------------------------------------------------------------------- |
| [4149524](https://athena.ohdsi.org/search-terms/terms/414952/){:target="\_blank"}    | Patient's condition improved |                                                                         |
| [40483850](https://athena.ohdsi.org/search-terms/terms/40483850/){:target="\_blank"} | Treatment changed            | Indicating that the membrane lung was not necessary anymore.            |
| [434489](https://athena.ohdsi.org/search-terms/terms/434489/){:target="\_blank"}     | Dead                         |                                                                         |
| [4154766](https://athena.ohdsi.org/search-terms/terms/4154766){:target="\_blank"}    | Moribund                     |                                                                         |
| [44790553](https://athena.ohdsi.org/search-terms/terms/44790553/){:target="\_blank"} | Following protocol           | If the center demands a change/stop of the component, use this concept. |
| [36717877](https://athena.ohdsi.org/search-terms/terms/36717877/){:target="\_blank"} | End of product life-cycle    |                                                                         |

## .material_id

The foreign key field to the ECLS CDM _ecls_temperature_regulation_device_material_ table.

## .sn

If applicable, the serial number of the temperature regulation devcie.

## .lot

If applicable, the lot number of the temperature regulation devcie.

## .ref

If applicable, the reference number of the temperature regulation devcie. This is usually
the manufacturer's internal model number.

## .udi

If applicable, the whole data matrix/bar code of the Unique Device Identifier,
consisting of UDI-DI + UDI-PI.
