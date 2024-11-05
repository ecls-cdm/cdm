The _ecls_circuit_component_ table is designed as many-to-many table to
flexibly link components with a circuit. This design is necessary, since
components (usually cannulas) can change between circuits.

| Column name               | Required | Data Type                             |
| ------------------------- | -------- | ------------------------------------- |
| circuit_component_id      | True     | integer, generated always as identity |
| start_datetime            | True     | timestamptz                           |
| stop_datetime             | (True)   | timestamptz                           |
| person_id                 | True     | integer                               |
| circuit_id                | True     | integer                               |
| component_type_concept_id | True     | integer                               |
| component_id              | True     | integer                               |

## .circuit_component_id

The primary key.

## .start_datetime

Use the date and time when a component was added to a circuit.

## .stop_datetime

Use the date and time when a component was removed from the circuit.

## .person_id

The foreign key to the _person_ table.

## .circuit_id

The foreign key to the _ecls_circuit_ table.

## .component_type_concept_id

The foreign key to the _concept_ table. <br>
This attribute will define, what type of component was connected to the
circuit. Choose one of the following high-level concepts:

**Allowed concepts:**

| concept_id                                                                           | concept_name                                              | comment |
| ------------------------------------------------------------------------------------ | --------------------------------------------------------- | ------- |
| [4260370](https://athena.ohdsi.org/search-terms/terms/4260370/){:target="\_blank"}   | Pump                                                      |         |
| [36717850](https://athena.ohdsi.org/search-terms/terms/36717850/){:target="\_blank"} | Extracorporeal life support cannula                       |         |
| [45768426](https://athena.ohdsi.org/search-terms/terms/45768426/){:target="\_blank"} | Console                                                   |         |
| [4180582](https://athena.ohdsi.org/search-terms/terms/4180582/){:target="\_blank"}   | Artificial lung                                           |         |
| [36717854](https://athena.ohdsi.org/search-terms/terms/36717854/){:target="\_blank"} | Extracorporeal life support temperature regulation device |         |

## .component_id

Use the primary key of the corresponding entry from the fitting table.
