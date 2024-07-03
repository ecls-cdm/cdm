---
hide:
  - navigation
---

The **Extracorporeal Life Support Common Data Model (ECLS CDM)** is a
**community-driven expansion** for the **Observational Medical Outcomes
Partnership Common Data Model (OMOP CDM)**.

## Why is the ECLS CDM necessary?

With the growth of technology in medicine, interoperability and quick
interchange of medical data has become increasingly important. The OMOP
CDM, one of the major common data models in medicine, provides a
fantastic framework for data collection but, unfortunately, lacks the
option to collect ECLS-related data sufficiently.

With the introduction of specially designed tables tailored to each ECLS
circuit component, we can overcome this limitation by providing the
tools necessary to comprehensively collect and process data accumulating
as soon as patients are put on extracorporeal life support (ECLS).

The ECLS CDM is...

- 100% open-source in the spirit of the OMOP CDM and open to community
contributions
- data privacy-friendly by being self-hosted
- inspired by the infastructure of the ELSO Registry and uses similar
  terminology
- officially endorsed by the [Extracorporeal Life Support Organization (ELSO)](https://elso.org){:target="_blank"} and by [OHDSI](https://ohdsi.org){:target="_blank"} as stakeholder institution
  of the OMOP CDM.

The ECLS CDM aims to be compliant and interoperable with the ELSO Registry.
A detailed documentation for dedicated ETL guidelines will be provided on
this website in the future.

!!! info
    Currently (July 2024) , the ECLS CDM allows for the mapping a standard
    application of ECLS and will be extended to include concepts regarding
    specialized therapy regimens such as ECPR, trauma-related ECLS therapy or
    COVID-19 (referred to as “addenda” in the ELSO registry).

## Basic usage

If you are new to the **OMOP CDM**, please refer to the official [documentation](https://ohdsi.github.io/CommonDataModel/index.html)
provided by OHDSI to learn about the concepts behind the OMOP CDM and
how to use it. Data typically stored within the OMOP CDM standardized
clinical data tables are:

- Person: Demographic information about each patient, such as gender,
  year of birth, race, and ethnicity.
- Observation Period: Time periods during which a patient is under
  observation and data is recorded.
- Visit Occurrence: Details of healthcare visits, including visit type
  (inpatient, outpatient, etc.), start and end dates, and healthcare
  provider information.
- Condition Occurrence: Records of patient conditions or diagnoses,
  including the condition code, condition start and end dates, and the
  source of the condition data.
- Drug Exposure: Information about medications prescribed and dispensed
  to patients, including drug codes, dosage, route of administration,
  and dates of exposure.
- Procedure Occurrence: Data on clinical procedures performed on patients,
  including procedure codes, dates, and providers.
- Measurement: Results of clinical measurements (e.g., lab tests, vital
  signs), including measurement codes, values, units, and dates.
- Observation: Miscellaneous clinical observations about a patient that
  do not fit into other categories, including observation codes, values,
  and dates.
- Device Exposure: Records of medical devices used by patients, including
  device codes, dates of usage, and related information.
- Specimen: Information about biological specimens collected from patients,
  including specimen type, source, and collection details.

In contrast, the **ECLS CDM** only handles data regarding:

- the ECLS exposure
- the circuit
- the mode of operation
- components, such as cannulas, membrane lungs, consoles, temperature
  regulation devices and blood pumps
- materials of the single components

## Terminology

Frequently used terms in the context of extracorporeal life support are
well defined by two landmark publications, the so-called *ELSO Maastricht Treaties*.

- [The Extracorporeal Life Support Organization Maastricht Treaty for Nomenclature in Extracorporeal Life Support. A Position Paper of the Extracorporeal Life Support Organization](https://pubmed.ncbi.nlm.nih.gov/29614239/){:target="_blank"}, 2018, DOI: 10.1186/s13054-019-2334-8
- [The ELSO Maastricht Treaty for ECLS Nomenclature: abbreviations for cannulation configuration in extracorporeal life support - a position paper of the Extracorporeal Life Support Organization](https://pubmed.ncbi.nlm.nih.gov/30736845/){:target="_blank"}, 2018, DOI: 10.1164/rccm.201710-2130CP

## Compatibility

The ECLS CDM was designed for the
OMOP CDM, [version 5.4](https://ohdsi.github.io/CommonDataModel/cdm54.html).
