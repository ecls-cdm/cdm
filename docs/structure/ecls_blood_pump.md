This table stores information about the blood pumps in use.

| Column name             | Required | Data Type                             |
| ----------------------- | -------- | ------------------------------------- |
| blood_pump_id           | True     | integer, generated always as identity |
| start_datetime          | True     | timestamptz                           |
| stop_datetime           | (True)   | timestamptz                           |
| person_id               | True     | integer                               |
| stop_reason_concept_id  | (True)   | integer                               |
| material_id             | True     | integer                               |
| sn                      |          | text                                  |
| lot                     |          | text                                  |
| ref                     |          | text                                  |
| udi                     |          | text                                  |

## .blood_pump_id
The primary key column.

## .start_datetime
The date and time when the blood pump was started.

## .stop_datetime
The date and time when the blood pump was removed.

!!! info
    Blood pumps are usually not changed in a running circuit. So they
    typically have the same *start_datetime* and *stop_datetime* as the corresponding
    circuit.

## .person_id
The foreign key to the *person* table.

## .stop_reason_concept_id
The foreign key to the *concept* table. <br>
Store information, as to why the blood pump was stopped.

**Allowed concepts:**

| concept_id                                                                          | concept_name                                                                      | comment                                                                          |
|-------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| [4149524](https://athena.ohdsi.org/search-terms/terms/4149524/){:target="_blank"}   | Patient's condition improved                                                      |                                                                                  |
| [40483850](https://athena.ohdsi.org/search-terms/terms/40483850/){:target="_blank"} | Treatment changed                                                                 | Indicating that the blood pump was not necessary anymore.                        |
| [434489](https://athena.ohdsi.org/search-terms/terms/434489/){:target="_blank"}     | Dead                                                                              |                                                                                  |
| [4154766](https://athena.ohdsi.org/search-terms/terms/4154766/){:target="_blank"}   | Moribund                                                                          |                                                                                  |
| [44790553](https://athena.ohdsi.org/search-terms/terms/44790553/){:target="_blank"} | Following protocol                                                                | If the center demands a change/stop of the component, use this concept.          |
| [36717877](https://athena.ohdsi.org/search-terms/terms/36717877/){:target="_blank"} | End of product life-cycle                                                         |                                                                                  |


## .material_id
The foreign key to the *ecls_blood_pump_material* table.

## .sn
If applicable, the serial number of the blood pump.

## .lot
If applicable, the lot number of the blood pump.

## .ref
If applicable, the reference number of the blood pump. This is usually
the manufacturer's internal model number.

## .udi
If applicable, the whole data matrix/bar code of the Unique Device Identifier,
consisting of UDI-DI + UDI-PI.
