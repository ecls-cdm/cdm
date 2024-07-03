This table stores information about the console(s) in use
(e.g., Cardiohelp, Rotaflow, Stöckert, etc.).


| Column name                        | Required | Data Type                             |
| ---------------------------------- | -------- | ------------------------------------- |
| console_id                         | True     | integer, generated always as identity |
| start_datetime                     | True     | timestamptz                           |
| stop_datetime                      | (True)   | timestamptz                           |
| person_id                          | True     | integer                               |
| stop_reason_concept_id             | (True)   | integer                               |
| material_id                        | True     | integer                               |
| sn                                 |          | text                                  |
| lot                                |          | text                                  |
| ref                                |          | text                                  |
| udi                                |          | text                                  |

## .console_id
The primary key.

## .start_datetime
Use the date and time when the console was started.

!!! info "Circuit components"
    A console, blood pump and temperature regulation device are usually
    only present once in a circuit and seldomly changed without exchanging
    the whole circuit. Make sure to set the correct timestamps.

## .stop_datetime
Use the date and time when the last cannula was removed. This timestamp
should be the same for the last cannula.

## .person_id
The foreign key to the *person* table.

## .stop_reason_concept_id
The foreign key to the *concept* table. <br>
Since the console is not in contact with the blood phase of the system
the number of complications is reduced for this table.

**Allowed concepts:**

| concept_id                                                                          | concept_name                                                     | comment                                                                 |
|-------------------------------------------------------------------------------------|------------------------------------------------------------------|-------------------------------------------------------------------------|
| [4149524](https://athena.ohdsi.org/search-terms/terms/4149524/){:target="_blank"}   | Patient's condition improved                                     |                                                                         |
| [40483850](https://athena.ohdsi.org/search-terms/terms/40483850/){:target="_blank"} | Treatment changed                                                | Indicating that the cannula was not necessary anymore.                  |
| [434489](https://athena.ohdsi.org/search-terms/terms/434489/){:target="_blank"}     | Dead                                                             |                                                                         |
| [4154766](https://athena.ohdsi.org/search-terms/terms/4154766/){:target="_blank"}   | Moribund                                                         |                                                                         |
| [36717819](https://athena.ohdsi.org/search-terms/terms/36717819/){:target="_blank"} | Accidental dislodgement of extracorporeal life support component |                                                                         |
| [36717843](https://athena.ohdsi.org/search-terms/terms/36717843/){:target="_blank"} | Extracorporeal life support console failure                      |                                                                         |
| [44790553](https://athena.ohdsi.org/search-terms/terms/44790553/){:target="_blank"} | Following protocol                                               | If the center demands a change/stop of the component, use this concept. |
| [36717877](https://athena.ohdsi.org/search-terms/terms/36717877/){:target="_blank"} | End of product life-cycle                                        |                                                                         |


## .material_id
The foreign key field to the ECLS CDM *ecls_console_material* table.

## .sn
If applicable, the serial number of the console.

## .lot
If applicable, the lot number of the console.

## .ref
If applicable, the reference number of the console. This is usually
the manufacturer's internal model number.

## .udi
If applicable, the whole data matrix/bar code of the Unique Device Identifier,
consisting of UDI-DI + UDI-PI.
