# ECLS Concepts

We have gathered concepts commonly used in the context of ECLS. These
should assist you in implementing the OMOP CDM and the ECLS CDM expansion
more quickly and efficiently within your local infrastructure.

## Observations with an unknown timestamp

Sometimes, the exact timing of medical procedures, lab measurements, or
disease onset is unknown. By OMOP CDM conventions you can capture these data
using the _observation_ table with two concepts:

1. _[1340204](https://athena.ohdsi.org/search-terms/terms/1340204){:target="\_blank"}, History of event_ as _observation_concept_id_
2. The actual observation as _value_as_concept_id_

!!! info

    You can limit the timeframe by using any _History of event_ child that is more precise.
    Click [here](https://athena.ohdsi.org/search-terms/terms?standardConcept=Standard&vocabulary=OMOP+Extension&page=1&pageSize=15&query=%22history+of+event%22&boosts){:target="\_blank"} for more concepts.

## Diagnoses

Capturing the right diagnoses is an important task, especially for
patients supported by an extracorporeal circuit. Diagnoses should be
captured in the _condition_occurrence_ table. When entering conditions,
make sure to set a proper _condition_status_concept_id_. Typical concepts
are:

| concept_id                                                                     | concept_name        | table                | comment |
| ------------------------------------------------------------------------------ | ------------------- | -------------------- | ------- |
| [32890](https://athena.ohdsi.org/search-terms/terms/32890/){:target="\_blank"} | Admission diagnosis | condition_occurrence |         |
| [32896](https://athena.ohdsi.org/search-terms/terms/32896/){:target="\_blank"} | Discharge diagnosis | condition_occurrence |         |
| [32902](https://athena.ohdsi.org/search-terms/terms/32902/){:target="\_blank"} | Primary diagnosis   | condition_occurrence |         |
| [32908](https://athena.ohdsi.org/search-terms/terms/32908/){:target="\_blank"} | Secondary diagnosis | condition_occurrence |         |

!!! info

    In line with standard mapping rules, pre-existing conditions will be
    captured in the _observation_ table.
    Click [here](https://athena.ohdsi.org/search-terms/terms?standardConcept=Standard&conceptClass=Condition+Status&page=1&pageSize=50)
    for more types of diagnosis.

## ECLS-specific concepts

### Congenital diaphragmatic hernia (CDH)

A typical condition seen in neonatal patients is a congenital diaphragmatic
hernia, where abdominal organs protrude into the thoracic cavity,
potentially impacting lung function and cardiac output.

| concept_id                                                                           | concept_name                          | table                | comment |
| ------------------------------------------------------------------------------------ | ------------------------------------- | -------------------- | ------- |
| [36717796](https://athena.ohdsi.org/search-terms/terms/36717796/){:target="\_blank"} | Left congenital diaphragmatic hernia  | condition_occurrence |         |
| [36717797](https://athena.ohdsi.org/search-terms/terms/36717797/){:target="\_blank"} | Right congenital diaphragmatic hernia | condition_occurrence |         |

!!! info

    The repair is captured using _[4147525](https://athena.ohdsi.org/search-terms/terms/4147525/){:target="\_blank"}, Repair of neonatal diaphragmatic hernia_ as _procedure_ or _observation_, if the exact point in time is not known (see above).

### ECLS as bridge to...

The intention to treat is different for every patient. Choose accordingly:

| concept_id                                                                           | concept_name                                                                      | table       | comment |
| ------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------- | ----------- | ------- |
| [36717798](https://athena.ohdsi.org/search-terms/terms/36717798/){:target="\_blank"} | Extracorporeal life support as bridge to recovery                                 | observation |         |
| [36717799](https://athena.ohdsi.org/search-terms/terms/36717799/){:target="\_blank"} | Extracorporeal life support as bridge to transplant                               | observation |         |
| [36717800](https://athena.ohdsi.org/search-terms/terms/36717800/){:target="\_blank"} | Extracorporeal life support as bridge to lung transplant                          | observation |         |
| [36717801](https://athena.ohdsi.org/search-terms/terms/36717801/){:target="\_blank"} | Extracorporeal life support as bridge to heart transplant                         | observation |         |
| [36717802](https://athena.ohdsi.org/search-terms/terms/36717802/){:target="\_blank"} | Extracorporeal life support as bridge to combined heart-lung transplant           | observation |         |
| [36717803](https://athena.ohdsi.org/search-terms/terms/36717803/){:target="\_blank"} | Extracorporeal life support as bridge to decision                                 | observation |         |
| [36717804](https://athena.ohdsi.org/search-terms/terms/36717804/){:target="\_blank"} | Extracorporeal life support as bridge to destination                              | observation |         |
| [36717805](https://athena.ohdsi.org/search-terms/terms/36717805/){:target="\_blank"} | Extracorporeal life support as bridge to long-term mechanical circulatory support | observation |         |
| [36717806](https://athena.ohdsi.org/search-terms/terms/36717806/){:target="\_blank"} | Extracorporeal life support as periprocedural support                             | observation |         |
| [36717807](https://athena.ohdsi.org/search-terms/terms/36717807/){:target="\_blank"} | Extracorporeal life support as interval support for organ retrieval               | observation |         |

### Blood samples drawn from the ECLS circuit

The OMOP CDM provides multiple methods for storing blood sample data.
The _measurement_ table can be populated using either pre-coordinated
concepts (usually LOINC-based) or concepts combined with the specimen
table. The specimen table is designed to identify the origin of a
biological sample. Both entries must be linked via the _fact_relationship_
table (many-to-many relationship).

We recommend using the specimen table approach, as it allows for a more
nuanced way to store results, despite being potentially more cumbersome for users.

The ECLS CDM introduced two new concepts to denote the exact origin when
drawing blood from an extracorporeal circuit.

| concept_id                                                                           | concept_name                      | table    | comment |
| ------------------------------------------------------------------------------------ | --------------------------------- | -------- | ------- |
| [36717874](https://athena.ohdsi.org/search-terms/terms/36717874/){:target="\_blank"} | Pre-membrane lung blood specimen  | specimen |         |
| [36717875](https://athena.ohdsi.org/search-terms/terms/36717875/){:target="\_blank"} | Post-membrane lung blood specimen | specimen |         |

!!! info

    A _pre-pump head blood specimen_ is intentionally missing as it is
    equal to _Pre-membrane lung blood specimen_.

Typical other sites of origin are:

| concept_id                                                                         | concept_name            | table    | comment |
| ---------------------------------------------------------------------------------- | ----------------------- | -------- | ------- |
| [4047496](https://athena.ohdsi.org/search-terms/terms/4047496/){:target="\_blank"} | Arterial blood specimen | specimen |         |
| [4045667](https://athena.ohdsi.org/search-terms/terms/4045667/){:target="\_blank"} | Venous blood specimen   | specimen |         |

!!! info

    If laterality is important (V-A ECMO with possible differential
    oxygenation), use the _anatomic_site_concept_id_:

    For example:

    *[4284463](https://athena.ohdsi.org/search-terms/terms/4284463/){:target="_blank"}, Structure of left radial artery* <br>
    *[4276858](https://athena.ohdsi.org/search-terms/terms/4276858/){:target="_blank"}, Structure of right radial artery*

### ECLS-related measurements

Since settings and actual measurements can differ, we provide both
concept types. In most cases, the setting and the actual measurement
might be the same.

!!! info "RPM is a unit"

    Revolutions per minute (RPM), although frequently misused
    as a proxy for the blood pump speed, is a unit.

| concept_id                                                                           | concept_name                                                                 | table       | proposed UOM | comment |
| ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------- | ----------- | ------------ | ------- |
| [36717866](https://athena.ohdsi.org/search-terms/terms/36717866/){:target="\_blank"} | Extracorporeal life support pump flow rate **setting**                       | observation | L/min        |         |
| [36717867](https://athena.ohdsi.org/search-terms/terms/36717867/){:target="\_blank"} | Extracorporeal life support pump rotational speed **setting**                | observation | /min         |         |
| [36717868](https://athena.ohdsi.org/search-terms/terms/36717868/){:target="\_blank"} | Extracorporeal life support temperature regulation device target **setting** | observation | Cel          |         |
| [36717869](https://athena.ohdsi.org/search-terms/terms/36717869/){:target="\_blank"} | Extracorporeal life support pump flow rate                                   | measurement | L/min        |         |
| [36717870](https://athena.ohdsi.org/search-terms/terms/36717870/){:target="\_blank"} | Extracorporeal life support pump rotational speed                            | measurement | /min         |         |
| [36717871](https://athena.ohdsi.org/search-terms/terms/36717871/){:target="\_blank"} | Extracorporeal life support temperature regulation device temperature        | measurement | Cel          |         |

Measurements about the performance of the membrane lung in respect to
the patient’s status are of high interest.

| concept_id                                                                           | concept_name                              | table       | proposed UOM | comment |
| ------------------------------------------------------------------------------------ | ----------------------------------------- | ----------- | ------------ | ------- |
| [36717879](https://athena.ohdsi.org/search-terms/terms/36717879/){:target="\_blank"} | Device inlet carbon dioxide fraction      | measurement | %            |         |
| [36717880](https://athena.ohdsi.org/search-terms/terms/36717880/){:target="\_blank"} | Device inlet oxygen fraction              | measurement | %            |         |
| [36717881](https://athena.ohdsi.org/search-terms/terms/36717881/){:target="\_blank"} | Sweep gas flow rate                       | measurement | L/min        |         |
| [36717882](https://athena.ohdsi.org/search-terms/terms/36717882/){:target="\_blank"} | Sweep gas inlet carbon dioxide fraction   | measurement | %            |         |
| [36717883](https://athena.ohdsi.org/search-terms/terms/36717883/){:target="\_blank"} | Sweep gas inlet oxygen fraction           | measurement | %            |         |
| [36717884](https://athena.ohdsi.org/search-terms/terms/36717884/){:target="\_blank"} | Effective extracorporeal flow             | measurement | %            |         |
| [36717885](https://athena.ohdsi.org/search-terms/terms/36717885/){:target="\_blank"} | Extracorporeal flow fraction              | measurement | %            |         |
| [36717886](https://athena.ohdsi.org/search-terms/terms/36717886/){:target="\_blank"} | Outlet blood oxygen saturation            | measurement | %            |         |
| [36717887](https://athena.ohdsi.org/search-terms/terms/36717887/){:target="\_blank"} | Inlet blood oxygen saturation             | measurement | %            |         |
| [36717888](https://athena.ohdsi.org/search-terms/terms/36717888/){:target="\_blank"} | Pre-membrane lung carbon dioxide tension  | measurement | mmHg         |         |
| [36717889](https://athena.ohdsi.org/search-terms/terms/36717889/){:target="\_blank"} | Pre-membrane lung oxygen tension          | measurement | mmHg         |         |
| [36717890](https://athena.ohdsi.org/search-terms/terms/36717890/){:target="\_blank"} | Pre-membrane lung pressure                | measurement | mmHg         |         |
| [36717891](https://athena.ohdsi.org/search-terms/terms/36717891/){:target="\_blank"} | Pre-membrane lung oxygen saturation       | measurement | %            |         |
| [36717892](https://athena.ohdsi.org/search-terms/terms/36717892/){:target="\_blank"} | Post-membrane lung carbon dioxide tension | measurement | mmHg         |         |
| [36717893](https://athena.ohdsi.org/search-terms/terms/36717893/){:target="\_blank"} | Post-membrane lung oxygen tension         | measurement | mmHg         |         |
| [36717894](https://athena.ohdsi.org/search-terms/terms/36717894/){:target="\_blank"} | Post-membrane lung pressure               | measurement | mmHg         |         |
| [36717895](https://athena.ohdsi.org/search-terms/terms/36717895/){:target="\_blank"} | Post-membrane lung oxygen saturation      | measurement | %            |         |
| [36717896](https://athena.ohdsi.org/search-terms/terms/36717896/){:target="\_blank"} | Pump inlet pressure                       | measurement | mmHg         |         |
| [36717897](https://athena.ohdsi.org/search-terms/terms/36717897/){:target="\_blank"} | Membrane lung pressure drop               | measurement | mmHg         |         |
| [36717898](https://athena.ohdsi.org/search-terms/terms/36717898/){:target="\_blank"} | Recirculation fraction                    | measurement | %            |         |

### Procedures on the circuit

| concept_id                                                                           | concept_name                                                              | table     | comment                                                                                |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------- | --------- | -------------------------------------------------------------------------------------- |
| [36717862](https://athena.ohdsi.org/search-terms/terms/36717862/){:target="\_blank"} | Water change of extracorporeal life support temperature regulation device | procedure |                                                                                        |
| [36717863](https://athena.ohdsi.org/search-terms/terms/36717863/){:target="\_blank"} | Manual operation of extracorporeal life support device                    | procedure | Using the hand crank                                                                   |
| [36717848](https://athena.ohdsi.org/search-terms/terms/36717848/){:target="\_blank"} | Sighing of extracorporeal membrane lung                                   | procedure | _Sighing_ is the official term. Other typical terms used are _flushing_ or _sneezing_. |

### Differential oxygenation and CO2 tension

In venoarterial ECMO, blood can be differentially oxygenated and
decarboxylated depending on the intrinsic cardiac output.

| concept_id                                                                           | concept_name                        | table       | comment                                                                                                      |
| ------------------------------------------------------------------------------------ | ----------------------------------- | ----------- | ------------------------------------------------------------------------------------------------------------ |
| [36717859](https://athena.ohdsi.org/search-terms/terms/36717859/){:target="\_blank"} | Differential oxygenation            | observation | In a clinical setting, synonyms such as _Harlequin syndrome_ or _North-South phenomenon_ are typically used. |
| [36717861](https://athena.ohdsi.org/search-terms/terms/36717861/){:target="\_blank"} | Differential carbon dioxide tension | observation |                                                                                                              |

!!! info

    _[36717860](https://athena.ohdsi.org/search-terms/terms/36717860/){:target="\_blank"}, Differential hypoxemia_ is the resulting condition. Do not
    forget to create an entry for it in the _condition_occurrence_ table.

### Recirculation

Recirculation is only observable in venovenous configurations. Do not forget about
the recirculation fraction as measureable parameter.

!!! info

    Recirculation can also be a reason to exchange parts of your circuit.
    If it is the primary reason it is considered a complication. Make sure
    to use the concept for _stop_reason_concept_id_ if this is the case.

| concept_id                                                                           | concept_name  | table       | comment |
| ------------------------------------------------------------------------------------ | ------------- | ----------- | ------- |
| [36717821](https://athena.ohdsi.org/search-terms/terms/36717821/){:target="\_blank"} | Recirculation | observation |         |

### Continuous renal replacement therapy (CRRT) using the ECLS circuit

Continuous renal replacement therapy (CRRT) machines can be connected
to the ECLS circuit in different ways.

!!! info

    Make sure to create at least a _procedure_occurrence_ entry for the
    therapy itself. E.g., _[37018292](https://athena.ohdsi.org/search-terms/terms/37018292/){:target="\_blank"}, Continuous renal replacement therapy_.

| concept_id                                                                           | concept_name                                                                               | table       | comment                                                               |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ | ----------- | --------------------------------------------------------------------- |
| [36717911](https://athena.ohdsi.org/search-terms/terms/36717911/){:target="\_blank"} | Configuration of renal replacement therapy attached to extracorporeal life support circuit | observation | _observation_concept_id_ + one of the following as _value_as_concept_ |
| [36717912](https://athena.ohdsi.org/search-terms/terms/36717912/){:target="\_blank"} | Pre-membrane lung drainage; pre-membrane lung return                                       |             |                                                                       |
| [36717913](https://athena.ohdsi.org/search-terms/terms/36717913/){:target="\_blank"} | Pre-membrane lung drainage; pre-blood pump return                                          |             |                                                                       |
| [36717914](https://athena.ohdsi.org/search-terms/terms/36717914/){:target="\_blank"} | Post-membrane lung drainage; pre-membrane lung return                                      |             |                                                                       |
| [36717915](https://athena.ohdsi.org/search-terms/terms/36717915/){:target="\_blank"} | Post-membrane lung drainage; pre-blood pump return                                         |             |                                                                       |

### ECLS-related devices

ECLS circuits can be modified by introducing different devices. If these
devices are present in your system, create an entry for them. Storing these
in the _device_exposure_ table was a deliberate design choice for the
first version of the ECLS CDM, but this may change in a future update.

| concept_id                                                                           | concept_name                            | table           | comment |
| ------------------------------------------------------------------------------------ | --------------------------------------- | --------------- | ------- |
| [36717855](https://athena.ohdsi.org/search-terms/terms/36717855/){:target="\_blank"} | Extracorporeal air bubble/foam detector | device_exposure |         |
| [36717856](https://athena.ohdsi.org/search-terms/terms/36717856/){:target="\_blank"} | Extracorporeal filter                   | device_exposure |         |
| [36717857](https://athena.ohdsi.org/search-terms/terms/36717857/){:target="\_blank"} | Extracorporeal bladder                  | device_exposure |         |
| [36717858](https://athena.ohdsi.org/search-terms/terms/36717858/){:target="\_blank"} | Extracorporeal loop                     | device_exposure |         |

### Discontinuation trial

When the ECLS circuit is temporarily stopped (without decannulation) to
assess if the patient can survive without support, you can use this
concept to record the exact timing.

| concept_id                                                                            | concept_name                                      | table     | comment |
| ------------------------------------------------------------------------------------- | ------------------------------------------------- | --------- | ------- |
| [36717921](https://athena.ohdsi.org/search-terms/terms/36717921/){:target="\_blanke"} | Extracorporeal life support discontinuation trial | procedure |         |

## General concepts

### General patient characteristics

| concept_id                                                                         | concept_name          | table       | proposed UOM | comment |
| ---------------------------------------------------------------------------------- | --------------------- | ----------- | ------------ | ------- |
| [3036277](https://athena.ohdsi.org/search-terms/terms/3036277/){:target="\_blank"} | Body height           | measurement | centimeter   |         |
| [3025315](https://athena.ohdsi.org/search-terms/terms/3025315/){:target="\_blank"} | Body weight           | measurement | kilogram     |         |
| [3011043](https://athena.ohdsi.org/search-terms/terms/3011043/){:target="\_blank"} | Birth weight Measured | measurement | kilogram     |         |
| [3012266](https://athena.ohdsi.org/search-terms/terms/3012266/){:target="\_blank"} | Gestational age       | measurement | week         |         |

### Race, ethnicity and gender

The collection of a patient’s race, ethnicity, and gender is a controversial
topic. For example, due to historical reasons, race and ethnicity are not
collected on a regular basis in Germany or Austria when patients are
admitted to the hospital. If you need data regarding gender, race, or
ethnicity, follow the official documentation on how to store such information:
[https://ohdsi.github.io/CommonDataModel/cdm54.html#PERSON](https://ohdsi.github.io/CommonDataModel/cdm54.html#PERSON)

### Units of measurement

**Conventions**

| Physical concept | Units                                                                         |
| ---------------- | ----------------------------------------------------------------------------- |
| Pressure         | mmHg [conversion: 1 kPa ≙ 7.5 mmHg]                                           |
| Volumetric flow  | l/min                                                                         |
| Length           | _cm_: cannula length, cannula insertion depth, device dimensions measurements |
|                  | _m_: tubing length > 50cm                                                     |
|                  | _in_: circuit tubing diameter                                                 |
|                  | _Fr_: cannula (outer) diameter                                                |
| Area             | m²                                                                            |
| Temperature      | °C [conversion: (°F - 32) * 5/9 = 0 °C]                                       |
| Respiratory      | mbar or cmH2O [they are virtually identical: 1mbar = 1.01972 cmH₂O]           |

The following units are often encountered in the field of ECLS.

| concept_id                                                                           | concept_code | concept_name                      |
| ------------------------------------------------------------------------------------ | ------------ | --------------------------------- |
| [8876](https://athena.ohdsi.org/search-terms/terms/8876/){:target="\_blank"}         | mm[Hg]       | millimeter mercury column         |
| [8541](https://athena.ohdsi.org/search-terms/terms/8541/){:target="\_blank"}         | /min         | per minute                        |
| [8698](https://athena.ohdsi.org/search-terms/terms/8698/){:target="\_blank"}         | L/min        | liter per minute                  |
| [32710](https://athena.ohdsi.org/search-terms/terms/32710/){:target="\_blank"}       | L/min/m2     | liter per minute per square meter |
| [586323](https://athena.ohdsi.org/search-terms/terms/586323/){:target="\_blank"}     | Cel          | degree Celsius                    |
| [8582](https://athena.ohdsi.org/search-terms/terms/8582/){:target="\_blank"}         | cm           | centimeter                        |
| [9529](https://athena.ohdsi.org/search-terms/terms/9529/){:target="\_blank"}         | kg           | kilogram                          |
| [8554](https://athena.ohdsi.org/search-terms/terms/8554/){:target="\_blank"}         | %            | percent                           |
| [8617](https://athena.ohdsi.org/search-terms/terms/8617/){:target="\_blank"}         | m2           | square meter                      |
| [720858](https://athena.ohdsi.org/search-terms/terms/720858/){:target="\_blank"}     | mbar         | millibar                          |
| [44777602](https://athena.ohdsi.org/search-terms/terms/44777602/){:target="\_blank"} | kPa          | kilopascal                        |
| [44777590](https://athena.ohdsi.org/search-terms/terms/44777590/){:target="\_blank"} | cm[H2O]      | centimeter watercolumn            |
| [720865](https://athena.ohdsi.org/search-terms/terms/720865/){:target="\_blank"}     | ml/mbar      | milliliter per millibar           |
| [9586](https://athena.ohdsi.org/search-terms/terms/9586/){:target="\_blank"}         | mol/L        | mole per liter                    |
| [9579](https://athena.ohdsi.org/search-terms/terms/9579/){:target="\_blank"}         | mmol/mol     | millimole per mole                |
| [9570](https://athena.ohdsi.org/search-terms/terms/9570/){:target="\_blank"}         | mL/dL        | milliliter per deciliter          |
| [8840](https://athena.ohdsi.org/search-terms/terms/8840/){:target="\_blank"}         | mg/dL        | milligram per deciliter           |
| [8576](https://athena.ohdsi.org/search-terms/terms/8576/){:target="\_blank"}         | mg           | milligram                         |
| [8504](https://athena.ohdsi.org/search-terms/terms/8504/){:target="\_blank"}         | g            | gram                              |
| [9546](https://athena.ohdsi.org/search-terms/terms/9546/){:target="\_blank"}         | m            | meter                             |
| [9327](https://athena.ohdsi.org/search-terms/terms/9327/){:target="\_blank"}         | [in_i]       | inch (international)              |
| [9655](https://athena.ohdsi.org/search-terms/terms/9655/){:target="\_blank"}         | ug           | microgram                         |
| [8511](https://athena.ohdsi.org/search-terms/terms/8511/){:target="\_blank"}         | wk           | week                              |

!!! info

    For a complete list, check out the UCUM vocabulary [here](https://athena.ohdsi.org/search-terms/terms?domain=Unit&standardConcept=Standard&vocabulary=UCUM&page=1&pageSize=500).

### Vital parameters

| concept_id                                                                           | concept_name                               | table       | proposed UOM | comment |
| ------------------------------------------------------------------------------------ | ------------------------------------------ | ----------- | ------------ | ------- |
| [3027018](https://athena.ohdsi.org/search-terms/terms/3027018/){:target="\_blank"}   | Heart rate                                 | measurement | /min         |         |
| [21490670](https://athena.ohdsi.org/search-terms/terms/21490670/){:target="\_blank"} | Heart rate Intra arterial line by Invasive | measurement | /min         |         |
| [21490853](https://athena.ohdsi.org/search-terms/terms/21490853/){:target="\_blank"} | Invasive Systolic blood pressure           | measurement | mmHg         |         |
| [21490852](https://athena.ohdsi.org/search-terms/terms/21490852/){:target="\_blank"} | Invasive Mean blood pressure               | measurement | mmHg         |         |
| [21490851](https://athena.ohdsi.org/search-terms/terms/21490851/){:target="\_blank"} | Invasive Diastolic blood pressure          | measurement | mmHg         |         |
| [36032120](https://athena.ohdsi.org/search-terms/terms/36032120/){:target="\_blank"} | Systolic blood pressure mean               | measurement | mmHg         |         |
| [3027598](https://athena.ohdsi.org/search-terms/terms/3027598/){:target="\_blank"}   | Mean blood pressure                        | measurement | mmHg         |         |
| [36031214](https://athena.ohdsi.org/search-terms/terms/36031214/){:target="\_blank"} | Diastolic blood pressure mean              | measurement | mmHg         |         |
| [3005606](https://athena.ohdsi.org/search-terms/terms/3005606/){:target="\_blank"}   | Pulmonary artery Systolic blood pressure   | measurement | mmHg         |         |
| [3028074](https://athena.ohdsi.org/search-terms/terms/3028074/){:target="\_blank"}   | Pulmonary artery Mean blood pressure       | measurement | mmHg         |         |
| [3017188](https://athena.ohdsi.org/search-terms/terms/3017188/){:target="\_blank"}   | Pulmonary artery Diastolic blood pressure  | measurement | mmHg         |         |
| [3020891](https://athena.ohdsi.org/search-terms/terms/3020891/){:target="\_blank"}   | Body temperature                           | measurement | Cel          |         |
| [44809207](https://athena.ohdsi.org/search-terms/terms/44809207/){:target="\_blank"} | Target body temperature                    | measurement | Cel          |         |
| [4196147](https://athena.ohdsi.org/search-terms/terms/4196147/){:target="\_blank"}   | Peripheral oxygen saturation               | measurement | %            |         |

### Proning

Placing a patient in a prone or semi-prone position is often useful in
severe acute respiratory distress syndrome. If you want to capture a
patient in a prone position, use the following concepts:

| concept_id                                                                         | concept_name                      | table       | comment         |
| ---------------------------------------------------------------------------------- | --------------------------------- | ----------- | --------------- |
| [4196006](https://athena.ohdsi.org/search-terms/terms/4196006/){:target="\_blank"} | Placing subject in prone position | procedure   | plus            |
| [4050473](https://athena.ohdsi.org/search-terms/terms/4050473/){:target="\_blank"} | Prone body position               | observation | = 180°          |
| [4189315](https://athena.ohdsi.org/search-terms/terms/4189315/){:target="\_blank"} | Left lateral tilt                 | observation | = right side up |
| [4213916](https://athena.ohdsi.org/search-terms/terms/4213916/){:target="\_blank"} | Right lateral tilt                | observation | = left side up  |

### Impella

A new approach in ECLS therapy involves combining ECLS with Impella.
You can use the below concepts for the implantation strategy (_procedure_occurrence_)
and use one of the [available](https://athena.ohdsi.org/search-terms/terms?standardConcept=Standard&vocabulary=OMOP+Extension&page=1&pageSize=15&query=Impella&boosts)
devices in _device_exposure_.

| concept_id                                                                           | concept_name                                                    | table     | comment |
| ------------------------------------------------------------------------------------ | --------------------------------------------------------------- | --------- | ------- |
| [36717917](https://athena.ohdsi.org/search-terms/terms/36717917/){:target="\_blank"} | Implantation of transvalvular microaxial flow pump              | procedure |         |
| [36717918](https://athena.ohdsi.org/search-terms/terms/36717918/){:target="\_blank"} | Open implantation of transvalvular microaxial flow pump         | procedure |         |
| [36717919](https://athena.ohdsi.org/search-terms/terms/36717919/){:target="\_blank"} | Percutaneous implantation of transvalvular microaxial flow pump | procedure |         |
