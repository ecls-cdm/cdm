An ECLS circuit is defined by the combination of components used during
extracorporeal support. Additionally, information regarding the tubing
and priming substances is stored using dedicated columns.

| Column name                 | Required | Data Type                             |
| --------------------------- | -------- | ------------------------------------- |
| circuit_id                  | True     | integer, generated always as identity |
| start_datetime              | True     | timestamptz                           |
| stop_datetime               | (True)   | timestamptz                           |
| person_id                   | True     | integer                               |
| run_id                      | True     | integer                               |
| tubing_size_in_inch         | True     | integer                               |
| priming_solution_concept_id | True     | integer                               |
| start_reason_concept_id     | True     | integer                               |
| stop_reason_concept_id      | (True)   | integer                               |

## .circuit_id
The primary key column.

## .start_datetime
Stores the timestamp of the beginning of the ECLS blood flow.

## .stop_datetime
Denotes the time the circuit was stopped.

!!! warning "Timestamps"
    The first circuit in a run must have the same start_datetime as
    *ecls_run.start_datetime*. If a circuit is changed or stopped, do
    not include retransfusion procedures as part of the runtime.

!!! info "Reinfusion"
    Sometimes blood is reinfused when changing the circuit or ending the
    run. Use *[36717920](https://athena.ohdsi.org/search-terms/terms/36717920/),
    Reinfusion of blood from extracorporeal life support circuit* to
    collect this procedure accordingly.

## .person_id
The foreign key to the *person* table.

## .run_id
The foreign key to the *ecls_run* table.

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
The foreign key to the *concept* table. <br>
Various priming solutions are used when preparing the ECLS circuit.

**Allowed concepts:**

| concept_id                                                                          | concept_name             | comment                                                                                                                                 |
|-------------------------------------------------------------------------------------|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| [4162581](https://athena.ohdsi.org/search-terms/terms/4162581/){:target="_blank"}   | Sodium chloride solution | Sodium chloride a placeholder for any crystalline fluid. This is necessary due to design of the drug vocabularies used by the OMOP CDM. |
| [4226865](https://athena.ohdsi.org/search-terms/terms/4226865/){:target="_blank"}   | Blood                    |                                                                                                                                         |
| [37311619](https://athena.ohdsi.org/search-terms/terms/37311619/){:target="_blank"} | Albumin human            |                                                                                                                                         |


## .stop_reason_concept_id
The foreign key to the *concept* table. <br>
Collect the reason why the circuit was stopped.

| concept_id                                                                          | concept_name                                                                      | comment                                                                                                                                                                                |
|-------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [4149524](https://athena.ohdsi.org/search-terms/terms/4149524/){:target="_blank"}   | Patient's condition improved                                                      |                                                                                                                                                                                        |
| [40483850](https://athena.ohdsi.org/search-terms/terms/40483850/){:target="_blank"} | Treatment changed                                                                 | Indicating that the circuit was not necessary anymore.                                                                                                                                 |
| [434489](https://athena.ohdsi.org/search-terms/terms/434489/){:target="_blank"}     | Dead                                                                              |                                                                                                                                                                                        |
| [4154766](https://athena.ohdsi.org/search-terms/terms/4154766/){:target="_blank"}   | Moribund                                                                          |                                                                                                                                                                                        |
| [36717814](https://athena.ohdsi.org/search-terms/terms/36717814/){:target="_blank"} | Acute obstruction to extracorporeal blood flow                                    |                                                                                                                                                                                        |
| [36717815](https://athena.ohdsi.org/search-terms/terms/36717815/){:target="_blank"} | Increasing resistance to extracorporeal blood flow                                |                                                                                                                                                                                        |
| [36717816](https://athena.ohdsi.org/search-terms/terms/36717816/){:target="_blank"} | Air in extracorporeal life support circuit or component                           |                                                                                                                                                                                        |
| [36717824](https://athena.ohdsi.org/search-terms/terms/36717824/){:target="_blank"} | Coagulopathy caused by extracorporeal life support circuit                        |                                                                                                                                                                                        |
| [36717829](https://athena.ohdsi.org/search-terms/terms/36717829/){:target="_blank"} | Hemolysis caused by extracorporeal life support circuit                           |                                                                                                                                                                                        |
| [36717834](https://athena.ohdsi.org/search-terms/terms/36717834/){:target="_blank"} | Blood clot in extracorporeal life support circuit                                 |                                                                                                                                                                                        |
| [36717842](https://athena.ohdsi.org/search-terms/terms/36717842/){:target="_blank"} | Extracorporeal life support circuit failure                                       | Should be used for technical malfunctions, where none of the other concepts fit.                                                                                                       |
| [36717844](https://athena.ohdsi.org/search-terms/terms/36717844/){:target="_blank"} | Impaired structural integrity of extracorporeal life support circuit or component |                                                                                                                                                                                        |
| [36717845](https://athena.ohdsi.org/search-terms/terms/36717845/){:target="_blank"} | Rupture of extracorporeal life support circuit or component                       |                                                                                                                                                                                        |
| [36717846](https://athena.ohdsi.org/search-terms/terms/36717846/){:target="_blank"} | Raceway rupture of extracorporeal life support circuit tubing                     | A raceway rupture can occur using traditional roller-pump setups. Typically, modern circuits use a centrifugal magnetic pump, whereas roller pumps are more frequent in neonatal ECLS. |
| [44790553](https://athena.ohdsi.org/search-terms/terms/44790553/){:target="_blank"} | Following protocol                                                                | If the center demands a change/stop of the circuit, use this concept.                                                                                                                  |
| [36717877](https://athena.ohdsi.org/search-terms/terms/36717877/){:target="_blank"} | End of product life-cycle                                                         |                                                                                                                                                                                        |
