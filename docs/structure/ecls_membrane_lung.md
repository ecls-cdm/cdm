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
Choose the right concept to describe, why the membrane lung was removed.

**Allowed concepts:**

| concept_id                                                                          | concept_name                                                                      | comment                                                                 |
|-------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| [4149524](https://athena.ohdsi.org/search-terms/terms/4149524/){:target="_blank"}   | Patient's condition improved                                                      |                                                                         |
| [40483850](https://athena.ohdsi.org/search-terms/terms/40483850/){:target="_blank"} | Treatment changed                                                                 | Indicating that the membrane lung was not necessary anymore.            |
| [434489](https://athena.ohdsi.org/search-terms/terms/434489/){:target="_blank"}     | Dead                                                                              |                                                                         |
| [4154766](https://athena.ohdsi.org/search-terms/terms/4154766/){:target="_blank"}   | Moribund                                                                          |                                                                         |
| [36717814](https://athena.ohdsi.org/search-terms/terms/36717814/){:target="_blank"} | Acute obstruction to extracorporeal blood flow                                    |                                                                         |
| [36717815](https://athena.ohdsi.org/search-terms/terms/36717815/){:target="_blank"} | Increasing resistance to extracorporeal blood flow                                |                                                                         |
| [36717816](https://athena.ohdsi.org/search-terms/terms/36717816/){:target="_blank"} | Air in extracorporeal life support circuit or component                           |                                                                         |
| [36717819](https://athena.ohdsi.org/search-terms/terms/36717819/){:target="_blank"} | Accidental dislodgement of extracorporeal life support component                  |                                                                         |
| [36717820](https://athena.ohdsi.org/search-terms/terms/36717820/){:target="_blank"} | Decreased efficiency of extracorporeal membrane lung                              |                                                                         |
| [36717826](https://athena.ohdsi.org/search-terms/terms/36717826/){:target="_blank"} | Coagulopathy caused by extracorporeal membrane lung                               |                                                                         |
| [36717831](https://athena.ohdsi.org/search-terms/terms/36717831/){:target="_blank"} | Hemolysis caused by extracorporeal membrane lung                                  |                                                                         |
| [36717836](https://athena.ohdsi.org/search-terms/terms/36717836/){:target="_blank"} | Blood clot in extracorporeal membrane lung                                        |                                                                         |
| [36717838](https://athena.ohdsi.org/search-terms/terms/36717838/){:target="_blank"} | Extracorporeal membrane lung failure                                              |                                                                         |
| [36717844](https://athena.ohdsi.org/search-terms/terms/36717844/){:target="_blank"} | Impaired structural integrity of extracorporeal life support circuit or component |                                                                         |
| [44790553](https://athena.ohdsi.org/search-terms/terms/44790553/){:target="_blank"} | Following protocol                                                                | If the center demands a change/stop of the component, use this concept. |
| [36717877](https://athena.ohdsi.org/search-terms/terms/36717877/){:target="_blank"} | End of product life-cycle                                                         |                                                                         |


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
