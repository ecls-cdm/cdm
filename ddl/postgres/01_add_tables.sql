-- Drop all tables, if they are present
DROP TABLE IF EXISTS ecls_run CASCADE;
DROP TABLE IF EXISTS ecls_circuit CASCADE;
DROP TABLE IF EXISTS ecls_mode CASCADE;
DROP TABLE IF EXISTS ecls_blood_pump CASCADE;
DROP TABLE IF EXISTS ecls_cannula CASCADE;
DROP TABLE IF EXISTS ecls_console CASCADE;
DROP TABLE IF EXISTS ecls_temperature_regulation_device CASCADE;
DROP TABLE IF EXISTS ecls_membrane_lung CASCADE;

-- Core tables
CREATE TABLE ecls_run (
    run_id integer GENERATED ALWAYS AS IDENTITY,
    start_datetime timestamptz NOT NULL,
    stop_datetime timestamptz,
    person_id integer NOT NULL,
    visit_occurrence_id integer NOT NULL,
    visit_detail_id integer,
    urgency_concept_id integer NOT NULL,
    start_reason_concept_id integer NOT NULL,
    stop_reason_concept_id integer
);

CREATE TABLE ecls_circuit (
    circuit_id integer GENERATED ALWAYS AS IDENTITY,
    start_datetime timestamptz NOT NULL,
    stop_datetime timestamptz,
    person_id integer NOT NULL,
    run_id integer NOT NULL,
    tubing_size_in_inches numeric(5, 4) NOT NULL,
    priming_solution_concept_id integer NOT NULL,
    stop_reason_concept_id integer
);

CREATE TABLE ecls_mode (
    mode_id integer GENERATED ALWAYS AS IDENTITY,
    start_datetime timestamptz NOT NULL,
    stop_datetime timestamptz,
    person_id integer NOT NULL,
    circuit_id integer NOT NULL,
    mode_concept_id integer NOT NULL
);

CREATE TABLE ecls_blood_pump (
    blood_pump_id integer GENERATED ALWAYS AS IDENTITY,
    start_datetime timestamptz NOT NULL,
    stop_datetime timestamptz,
    person_id integer NOT NULL,
    stop_reason_concept_id integer,
    material_id integer NOT NULL,
    sn text,
    lot text,
    ref text,
    udi text
);

CREATE TABLE ecls_cannula (
    cannula_id integer GENERATED ALWAYS AS IDENTITY,
    start_datetime timestamptz NOT NULL,
    stop_datetime timestamptz,
    person_id integer NOT NULL,
    flow_direction_concept_id integer NOT NULL,
    location_concept_id integer NOT NULL,
    laterality_concept_id integer,
    insertion_concept_id integer NOT NULL,
    insertion_length_in_centimeters integer NOT NULL,
    tip_position_concept_id integer NOT NULL,
    tip_position_laterality_concept_id integer,
    removal_concept_id integer,
    stop_reason_concept_id integer,
    material_id integer NOT NULL,
    sn text,
    lot text,
    ref text,
    udi text
);

CREATE TABLE ecls_console (
    console_id integer GENERATED ALWAYS AS IDENTITY,
    start_datetime timestamptz NOT NULL,
    stop_datetime timestamptz,
    person_id integer NOT NULL,
    stop_reason_concept_id integer,
    material_id integer NOT NULL,
    sn text,
    lot text,
    ref text,
    udi text
);

CREATE TABLE ecls_membrane_lung (
    membrane_lung_id integer GENERATED ALWAYS AS IDENTITY,
    start_datetime timestamptz NOT NULL,
    stop_datetime timestamptz,
    person_id integer NOT NULL,
    priming_solution_concept_id integer NOT NULL,
    stop_reason_concept_id integer,
    material_id integer NOT NULL,
    sn text,
    lot text,
    ref text,
    udi text
);

CREATE TABLE ecls_temperature_regulation_device (
    temperature_regulation_device_id integer GENERATED ALWAYS AS IDENTITY,
    start_datetime timestamptz NOT NULL,
    stop_datetime timestamptz,
    person_id integer NOT NULL,
    stop_reason_concept_id integer,
    material_id integer NOT NULL,
    sn text,
    lot text,
    ref text,
    udi text
);

-- Support tables
DROP TABLE IF EXISTS ecls_circuit_component CASCADE;
DROP TABLE IF EXISTS ecls_blood_pump_material CASCADE;
DROP TABLE IF EXISTS ecls_cannula_material CASCADE;
DROP TABLE IF EXISTS ecls_console_material CASCADE;
DROP TABLE IF EXISTS ecls_membrane_lung_material CASCADE;
DROP TABLE IF EXISTS ecls_temperature_regulation_device_material CASCADE;

CREATE TABLE ecls_circuit_component (
    circuit_component_id integer GENERATED ALWAYS AS IDENTITY,
    start_datetime timestamptz NOT NULL,
    stop_datetime timestamptz,
    person_id integer NOT NULL,
    circuit_id integer NOT NULL,
    component_type text NOT NULL,
    component_id integer NOT NULL
);

CREATE TABLE ecls_blood_pump_material (
    material_id integer GENERATED ALWAYS AS IDENTITY,
    name text NOT NULL,
    manufacturer text NOT NULL,
    type_concept_id integer NOT NULL,
    ref text,
    udi text
);

CREATE TABLE ecls_cannula_material (
    material_id integer GENERATED ALWAYS AS IDENTITY,
    name text NOT NULL,
    manufacturer text NOT NULL,
    type_concept_id integer NOT NULL,
    diameter_in_french integer NOT NULL,
    length_in_centimeters integer NOT NULL,
    coating text,
    ref text,
    udi text
);

CREATE TABLE ecls_console_material (
    material_id integer GENERATED ALWAYS AS IDENTITY,
    name text NOT NULL,
    manufacturer text NOT NULL,
    type_concept_id integer NOT NULL,
    ref text,
    udi text
);

CREATE TABLE ecls_membrane_lung_material (
    material_id integer GENERATED ALWAYS AS IDENTITY,
    name text NOT NULL,
    manufacturer text NOT NULL,
    type_concept_id integer NOT NULL,
    coating text,
    ref text,
    udi text
);

CREATE TABLE ecls_temperature_regulation_device_material (
    material_id integer GENERATED ALWAYS AS IDENTITY,
    name text NOT NULL,
    manufacturer text NOT NULL,
    type_concept_id integer NOT NULL,
    ref text,
    udi text
);
