An ECLS circuit is defined by the combination of components used during
extracorporeal support. Additionally, information regarding the tubing
and priming substances is stored using dedicated columns.

| Column name                  | Required | Data Type                             |
| ---------------------------- | -------- | ------------------------------------- |
| circuit_id                   | True     | integer, generated always as identity |
| start_datetime               | True     | timestamptz                           |
| stop_datetime                | (True)   | timestamptz                           |
| person_id                    | True     | integer                               |
| run_id                       | True     | integer                               |
| tubing_size_in_inch          | True     | integer                               |
| priming_solution_concept_id  | True     | integer                               |
| start_reason_concept_id      | True     | integer                               |
| stop_reason_concept_id       | (True)   | integer                               |

## .circuit_id

The primary key column.

## .start_datetime

Stores the timestamp of the beginning of the ECLS blood flow.

## .stop_datetime

Denotes the time the circuit was stopped.

!!! warning "Timestamps"
The first circuit in a run must have the same start_datetime as
_ecls_run.start_datetime_. If a circuit is changed or stopped, do
not include retransfusion procedures as part of the runtime.

!!! info "Reinfusion"
Sometimes blood is reinfused when changing the circuit or ending the
run. Use _[36717920](https://athena.ohdsi.org/search-terms/terms/36717920/),
Reinfusion of blood from extracorporeal life support circuit_ to
collect this procedure accordingly.

## .person_id

The foreign key to the _person_ table.

## .run_id

The foreign key to the _ecls_run_ table.

## .tubing_size_in_inches

Store the correct tubing size used for the circuit.

| Typical tubing sizes in inches | Store the following value |
| ------------------------------ | ------------------------- |
| 3/16" (4.76mm)                 | 0.1875                    |
| 1/4" (6.35mm)                  | 0.25                      |
| 3/8" (9.53mm)                  | 0.375                     |
| 1/2" (12.70mm)                 | 0.5                       |

Due to the data type (numeric) only use floating-point numbers with up
to three decimal places.

## .priming_solution_concept_id

The foreign key to the _concept_ table. <br>
Various priming solutions are used when preparing the ECLS circuit.

**Allowed concepts:**

| concept_id                                                                           | concept_name             | comment                                                                                                                                 |
| ------------------------------------------------------------------------------------ | ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------- |
| [4162581](https://athena.ohdsi.org/search-terms/terms/4162581/){:target="\_blank"}   | Sodium chloride solution | Sodium chloride a placeholder for any crystalline fluid. This is necessary due to design of the drug vocabularies used by the OMOP CDM. |
| [4226865](https://athena.ohdsi.org/search-terms/terms/4226865/){:target="\_blank"}   | Blood                    |                                                                                                                                         |
| [37311619](https://athena.ohdsi.org/search-terms/terms/37311619/){:target="\_blank"} | Albumin human            |                                                                                                                                         |

## .stop_reason_concept_id

The foreign key to the _concept_ table. <br>
Record the reason why the circuit was stopped.

Refer to [Stop reasons](../userguide/stop_reasons.md) for details on
stopping the run, circuit and/or component properly.
