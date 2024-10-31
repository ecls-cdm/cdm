This table stores information about the membrane lungs in use. A circuit
usually consists of at least one membrane lung.

| Column name                        | Required | Data Type                             |
| ---------------------------------- | -------- | ------------------------------------- |
| membrane_lung_id                   | True     | integer, generated always as identity |
| start_datetime                     | True     | timestamptz                           |
| stop_datetime                      | (True)   | timestamptz                           |
| person_id                          | True     | integer                               |
| priming_solution_concept_id        | True     | integer                               |
| stop_reason_concept_id             | (True)   | integer                               |
| material_id                        | True     | integer                               |
| sn                                 |          | text                                  |
| lot                                |          | text                                  |
| ref                                |          | text                                  |
| udi                                |          | text                                  |

## .membrane_lung_id
The primary key.

## .start_datetime
Use the date and time when the membrane lung was added.

## .stop_datetime
Use the date and time when the membrane lung was removed.

## .person_id
The foreign key to the *person* table.

## .priming_solution_concept_id
The foreign key to the *concept* table.<br>
Various priming solutions are used when potentially priming a new membrane
lung. If the circuit and membrane lung were primed in the same moment,
choose the same concepts:

**Allowed concepts:**

| concept_id                                                                          | concept_name             | comment                                                                                                                                 |
|-------------------------------------------------------------------------------------|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| [4162581](https://athena.ohdsi.org/search-terms/terms/4162581/){:target="_blank"}   | Sodium chloride solution | Sodium chloride a placeholder for any crystalline fluid. This is necessary due to design of the drug vocabularies used by the OMOP CDM. |
| [4226865](https://athena.ohdsi.org/search-terms/terms/4226865/){:target="_blank"}   | Blood                    |                                                                                                                                         |
| [37311619](https://athena.ohdsi.org/search-terms/terms/37311619/){:target="_blank"} | Albumin human            |                                                                                                                                         |


## .stop_reason_concept_id
The foreign key to the *concept* table. <br>
Record the reason why the membrane lung was stopped.

Refer to [Stop reasons](../userguide/stop_reasons.md) for details on
stopping the run, circuit and/or component properly.

## .material_id
The foreign key field to the ECLS CDM *ecls_membrane_lung_material* table.

## .sn
If applicable, the serial number of the membrane lung.

## .lot
If applicable, the lot number of the membrane lung.

## .ref
If applicable, the reference number of the membrane lung. This is usually
the manufacturer's internal model number.

## .udi
If applicable, the whole data matrix/bar code of the Unique Device Identifier,
consisting of UDI-DI + UDI-PI.
