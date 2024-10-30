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

| concept_id                                                                        | concept_code | concept_name                      |
|-----------------------------------------------------------------------------------|--------------|-----------------------------------|
| [320136](https://athena.ohdsi.org/search-terms/terms/320136/){:target="_blank"}   | 50043002     | Disorder of respiratory system    |
| [134057](https://athena.ohdsi.org/search-terms/terms/134057/){:target="_blank"}   | 49601007     | Disorder of cardiovascular system |
| [4205502](https://athena.ohdsi.org/search-terms/terms/4205502/){:target="_blank"} | 439569004    | Resuscitation                     |
| [440921](https://athena.ohdsi.org/search-terms/terms/440921/){:target="_blank"}   | 417746004    | Traumatic injury                  |


## .stop_reason_concept_id
The foreign key to the *concept* table. <br>
The run is stopped due to various reasons.

**Allowed concepts:**

| concept_id                                                                        | concept_name                                                   |
|-----------------------------------------------------------------------------------|----------------------------------------------------------------|
| [4149524](https://athena.ohdsi.org/search-terms/terms/4149524/){:target="_blank"} | Patient's condition improved                                   |
| [434489](https://athena.ohdsi.org/search-terms/terms/434489/){:target="_blank"}   | Dead                                                           |
| [4154766](https://athena.ohdsi.org/search-terms/terms/4154766/){:target="_blank"} | Moribund                                                       |
| [434263](https://athena.ohdsi.org/search-terms/terms/434263/){:target="_blank"}   | Complication of extracorporeal circulation                     |
| [4337306](https://athena.ohdsi.org/search-terms/terms/4337306/){:target="_blank"} | Implantation of ventricular assist device                      |
| [4272324](https://athena.ohdsi.org/search-terms/terms/4272324/){:target="_blank"} | Cardiopulmonary bypass operation                               |
| [4137127](https://athena.ohdsi.org/search-terms/terms/4137127/){:target="_blank"} | Transplantation of heart                                       |
| [4337138](https://athena.ohdsi.org/search-terms/terms/4337138/){:target="_blank"} | Transplant of lung                                             |
| [4138959](https://athena.ohdsi.org/search-terms/terms/4138959/){:target="_blank"} | Heart-lung transplant with recipient cardiectomy-pneumonectomy |

If the run was stopped completely because of a complication of an ECLS component, make sure to capture the respective complication. *434263, Complication of extracorporeal circulation* serves as a high-level concept.


!!! info "Death"
    If the patient dies, a respective entry in the OMOP CDM *death* table
    is necessary. Sometimes, ECLS support is withdrawn for a *Moribund* patient,
    because death is expected. The major difference between *Dead* and
    *Moribund* regarding data capture is the timestamp of *death_datetime*.

    The patient dies "on ECMO" => *Dead*: death.death_datetime == ecls_run.stop_datetime <br>
    The patient is decannulated and dies shortly afterwards => *Moribund*: death.death_datetime > ecls_run.stop_datetime
