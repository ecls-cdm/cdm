---
hide:
  - toc
---

# Structure

Despite consisting of multiple tables, the ECLS CDM should be
easy to understand. The tables of the ECLS CDM are divided into **core tables**
and **support tables**. The core tables store information about the
parts of the ECLS circuit as well as details about the nature of the ECLS
exposure. The support tables help to connect components with the circuit
in a generic fashion (using the *ecls_circuit_component* table) and describe
the specific component materials. The expansion is linked to the OMOP CDM
standardized clinical tables via foreign key-relationships to *person*,
*visit_occurrence*, *visit_detail* and *concept*.

!!! info "Nota bene"

    These rules apply to all of the tables:

      - The primary key column is a PostgreSQL identity column
        and a value will be assigned automatically.
      - Datetimes are stored including time zones (timestamptz). Please
        verify that your timezone is configured properly.
      - *stop_datetime* and *stop_reason_concept_id* are mandatory at the
        end of a run.
      - All core tables are linked to the OMOP CDM *person* table to
        simplify queries.
      - *_material tables should never be modified locally. They are managed
        by the community.

## Entity-Relationship-Diagram

The current version (1.0.0) of the common data model is depicted below:

![alt text](<../images/ECLS CDM.png>)

For a more detailed description of the tables, please
refer to the specific section of the documentation.
