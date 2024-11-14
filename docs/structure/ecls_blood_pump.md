This table stores information about the blood pumps in use.

| Column name            | Required | Data Type                             |
| ---------------------- | -------- | ------------------------------------- |
| blood_pump_id          | True     | integer, generated always as identity |
| start_datetime         | True     | timestamptz                           |
| stop_datetime          | (True)   | timestamptz                           |
| person_id              | True     | integer                               |
| stop_reason_concept_id | (True)   | integer                               |
| material_id            | True     | integer                               |
| sn                     |          | text                                  |
| lot                    |          | text                                  |
| ref                    |          | text                                  |
| udi                    |          | text                                  |

## .blood_pump_id

The primary key column.

## .start_datetime

The date and time when the blood pump was started.

## .stop_datetime

The date and time when the blood pump was removed.

!!! info

    Blood pumps are usually not changed in a running circuit. So they
    typically have the same _start_datetime_ and _stop_datetime_ as the corresponding
    circuit.

## .person_id

The foreign key to the _person_ table.

## .stop_reason_concept_id

The foreign key to the _concept_ table. <br>
Record the reason why the blood pump was stopped.

Refer to [Stop reasons](../userguide/stop_reasons.md) for details on
stopping the run, circuit and/or component properly.

## .material_id

The foreign key to the _ecls_blood_pump_material_ table.

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
