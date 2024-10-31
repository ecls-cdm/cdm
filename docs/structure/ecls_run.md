This table stores information about the reason why a patient was put on
ECLS.

!!! info "Definition of a "run""

    A run is defined as an exposure to ECLS therapy and the beginning of
    blood flow through the circuit until the removal of the last cannula.
    This definition takes into account that patients can be left without
    support but cannulas are kept in place to take them back on support
    quickly, if a long-term separation from the circuit is not successful.

| Column name             | Required | Data Type                             |
| ----------------------- | -------- | ------------------------------------- |
| run_id                  | True     | integer, generated always as identity |
| start_datetime          | True     | timestamptz                           |
| stop_datetime           | (True)   | timestamptz                           |
| person_id               | True     | integer                               |
| visit_occurrence_id     | True     | integer                               |
| visit_detail_id         |          | integer                               |
| urgency_concept_id      | True     | integer                               |
| start_reason_concept_id | True     | integer                               |
| stop_reason_concept_id  | (True)   | integer                               |

## .run_id
The primary key column.

## .start_datetime
Stores the timestamp of the beginning of the run. This is equivalent
to the start of blood flow through the first circuit.

## .stop_datetime
Denotes the stop of the run.

## .person_id
The foreign key to the *person* table.

## .visit_occurrence_id
The foreign key to the *visit_occurrence* table.

## .visit_detail_id
The foreign key to the *visit_detail* table.

## .urgency_concept_id
The foreign key to the *concept* table. <br>
This attribute defines how urgent the initiation of ECLS was.

**Allowed concepts:**

|concept_id                                                                      |concept_code    |concept_name      |
|--------------------------------------------------------------------------------|----------------|------------------|
|[4093606](https://athena.ohdsi.org/search-terms/terms/4093606){:target="_blank"}|25876001        |Emergency         |
|[4013731](https://athena.ohdsi.org/search-terms/terms/4013731){:target="_blank"}|103390000       |Elective          |

## .start_reason_concept_id
The foreign key to the *concept* table. <br>
Patients can be put on ECLS for various reasons. Typical use cases are
respiratory distress, cardiogenic shock, trauma or during resuscitation
(ECPR). Use one of these concepts as main reason why a patient
was put on ECLS. Child concepts might also be used.

!!! warning
    Due to the nested structure of SNOMED CT some of the concepts might
    belong to multiple parent concepts and ex-post analysis whether the
    leading cause for ECLS was a traumatic injury might be difficult. Make
    sure to collect primary and secondary diagnoses accordingly and store them
    in the OMOP CDM *condition_occurrence* table.

    For example, *(90070003) Pneumothorax due to trauma (disorder)* is a
    *(320136) Disorder of respiratory system* as well as *(440921) Traumatic injury*.

!!! info "Extracorporeal cardiopulmonary resuscitation (ECPR)"
    ECPR is defined as the use of veno-arterial ECMO during cardiac arrest,
    where conventional CPR is stopped as soon as blood flow is established.
    For ECPR use the *Resuscitation* concept.

**Allowed concepts (including child concepts):**

| concept_id                                                                        | concept_name                      |
|-----------------------------------------------------------------------------------|-----------------------------------|
| [320136](https://athena.ohdsi.org/search-terms/terms/320136/){:target="_blank"}   | Disorder of respiratory system    |
| [134057](https://athena.ohdsi.org/search-terms/terms/134057/){:target="_blank"}   | Disorder of cardiovascular system |
| [4205502](https://athena.ohdsi.org/search-terms/terms/4205502/){:target="_blank"} | Resuscitation                     |
| [440921](https://athena.ohdsi.org/search-terms/terms/440921/){:target="_blank"}   | Traumatic injury                  |


## .stop_reason_concept_id
The foreign key to the *concept* table. <br>
Record the reason why the run was stopped.

Refer to [Stop reasons](../userguide/stop_reasons.md) for details on
stopping the run, circuit and/or component properly.
