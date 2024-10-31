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
Record the reason why the console was stopped.

Refer to [Stop reasons](../userguide/stop_reasons.md) for details on
stopping the run, circuit and/or component properly.

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
