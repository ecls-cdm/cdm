-- Primary key constraints for core tables
ALTER TABLE ecls_run DROP CONSTRAINT IF EXISTS ecls_run_pkey CASCADE;
ALTER TABLE ecls_circuit DROP CONSTRAINT IF EXISTS ecls_circuit_pkey CASCADE;
ALTER TABLE ecls_mode DROP CONSTRAINT IF EXISTS ecls_mode_pkey CASCADE;
ALTER TABLE ecls_blood_pump DROP CONSTRAINT IF EXISTS ecls_blood_pump_pkey CASCADE;
ALTER TABLE ecls_cannula DROP CONSTRAINT IF EXISTS ecls_cannula_pkey CASCADE;
ALTER TABLE ecls_console DROP CONSTRAINT IF EXISTS ecls_console_pkey CASCADE;
ALTER TABLE ecls_membrane_lung DROP CONSTRAINT IF EXISTS ecls_membrane_lung_pkey CASCADE;
ALTER TABLE ecls_temperature_regulation_device DROP CONSTRAINT IF EXISTS ecls_temperature_regulation_device_pkey CASCADE;
ALTER TABLE ecls_run ADD CONSTRAINT ecls_run_pkey PRIMARY KEY (run_id);
ALTER TABLE ecls_circuit ADD CONSTRAINT ecls_circuit_pkey PRIMARY KEY (circuit_id);
ALTER TABLE ecls_mode ADD CONSTRAINT ecls_mode_pkey PRIMARY KEY(mode_id);
ALTER TABLE ecls_blood_pump ADD CONSTRAINT ecls_blood_pump_pkey PRIMARY KEY(blood_pump_id);
ALTER TABLE ecls_cannula ADD CONSTRAINT ecls_cannula_pkey PRIMARY KEY(cannula_id);
ALTER TABLE ecls_console ADD CONSTRAINT ecls_console_pkey PRIMARY KEY(console_id);
ALTER TABLE ecls_membrane_lung ADD CONSTRAINT ecls_membrane_lung_pkey PRIMARY KEY(membrane_lung_id);
ALTER TABLE ecls_temperature_regulation_device ADD CONSTRAINT ecls_temperature_regulation_device_pkey PRIMARY KEY(temperature_regulation_device_id);

-- Primary key constraints for support tables
ALTER TABLE ecls_circuit_component DROP CONSTRAINT IF EXISTS ecls_circuit_component_pkey CASCADE;
ALTER TABLE ecls_blood_pump_material DROP CONSTRAINT IF EXISTS ecls_blood_pump_material_pkey CASCADE;
ALTER TABLE ecls_cannula_material DROP CONSTRAINT IF EXISTS ecls_cannula_material_pkey CASCADE;
ALTER TABLE ecls_console_material DROP CONSTRAINT IF EXISTS ecls_console_material_pkey CASCADE;
ALTER TABLE ecls_membrane_lung_material DROP CONSTRAINT IF EXISTS ecls_membrane_lung_material_pkey CASCADE;
ALTER TABLE ecls_temperature_regulation_device_material DROP CONSTRAINT IF EXISTS ecls_temperature_regulation_device_material_pkey CASCADE;
ALTER TABLE ecls_circuit_component ADD CONSTRAINT ecls_circuit_component_pkey PRIMARY KEY(circuit_component_id);
ALTER TABLE ecls_blood_pump_material ADD CONSTRAINT ecls_blood_pump_material_pkey PRIMARY KEY(material_id);
ALTER TABLE ecls_cannula_material ADD CONSTRAINT ecls_cannula_material_pkey PRIMARY KEY(material_id);
ALTER TABLE ecls_console_material ADD CONSTRAINT ecls_console_material_pkey PRIMARY KEY(material_id);
ALTER TABLE ecls_membrane_lung_material ADD CONSTRAINT ecls_membrane_lung_material_pkey PRIMARY KEY(material_id);
ALTER TABLE ecls_temperature_regulation_device_material ADD CONSTRAINT ecls_temperature_regulation_device_material_pkey PRIMARY KEY(material_id);

-- Foreign key constraints for core tables
-- ecls_run
ALTER TABLE ecls_run DROP CONSTRAINT IF EXISTS ecls_run_person_id_fkey CASCADE;
ALTER TABLE ecls_run DROP CONSTRAINT IF EXISTS ecls_run_visit_occurrence_id_fkey CASCADE;
ALTER TABLE ecls_run DROP CONSTRAINT IF EXISTS ecls_run_visit_detail_id_fkey CASCADE;
ALTER TABLE ecls_run DROP CONSTRAINT IF EXISTS ecls_run_urgency_concept_id_fkey CASCADE;
ALTER TABLE ecls_run DROP CONSTRAINT IF EXISTS ecls_run_start_reason_concept_id_fkey CASCADE;
ALTER TABLE ecls_run DROP CONSTRAINT IF EXISTS ecls_run_stop_reason_concept_id_fkey CASCADE;
ALTER TABLE ecls_run ADD CONSTRAINT ecls_run_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(person_id);
ALTER TABLE ecls_run ADD CONSTRAINT ecls_run_visit_occurrence_id_fkey FOREIGN KEY (visit_occurrence_id) REFERENCES visit_occurrence(visit_occurrence_id);
ALTER TABLE ecls_run ADD CONSTRAINT ecls_run_visit_detail_id_fkey FOREIGN KEY (visit_detail_id) REFERENCES visit_detail(visit_detail_id);
ALTER TABLE ecls_run ADD CONSTRAINT ecls_run_urgency_concept_id_fkey FOREIGN KEY(urgency_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_run ADD CONSTRAINT ecls_run_start_reason_concept_id_fkey FOREIGN KEY (start_reason_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_run ADD CONSTRAINT ecls_run_stop_reason_concept_id_fkey FOREIGN KEY (stop_reason_concept_id) REFERENCES concept(concept_id);

-- ecls_circuit
ALTER TABLE ecls_circuit DROP CONSTRAINT IF EXISTS ecls_circuit_run_id_fkey CASCADE;
ALTER TABLE ecls_circuit DROP CONSTRAINT IF EXISTS ecls_circuit_person_id_fkey CASCADE;
ALTER TABLE ecls_circuit DROP CONSTRAINT IF EXISTS ecls_circuit_priming_solution_concept_id_fkey CASCADE;
ALTER TABLE ecls_circuit DROP CONSTRAINT IF EXISTS ecls_circuit_stop_reason_concept_id_fkey CASCADE;
ALTER TABLE ecls_circuit ADD CONSTRAINT ecls_circuit_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(person_id);
ALTER TABLE ecls_circuit ADD CONSTRAINT ecls_circuit_run_id_fkey FOREIGN KEY (run_id) REFERENCES ecls_run(run_id);
ALTER TABLE ecls_circuit ADD CONSTRAINT ecls_circuit_priming_solution_concept_id_fkey FOREIGN KEY (priming_solution_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_circuit ADD CONSTRAINT ecls_circuit_stop_reason_concept_id_fkey FOREIGN KEY (stop_reason_concept_id) REFERENCES concept(concept_id);

-- ecls_mode
ALTER TABLE ecls_mode DROP CONSTRAINT IF EXISTS ecls_mode_person_id_fkey CASCADE;
ALTER TABLE ecls_mode DROP CONSTRAINT IF EXISTS ecls_mode_circuit_id_fkey CASCADE;
ALTER TABLE ecls_mode DROP CONSTRAINT IF EXISTS ecls_mode_mode_concept_id_fkey CASCADE;
ALTER TABLE ecls_mode ADD CONSTRAINT ecls_mode_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(person_id);
ALTER TABLE ecls_mode ADD CONSTRAINT ecls_mode_circuit_id_fkey FOREIGN KEY (circuit_id) REFERENCES ecls_circuit(circuit_id);
ALTER TABLE ecls_mode ADD CONSTRAINT ecls_mode_mode_concept_id_fkey FOREIGN KEY (mode_concept_id) REFERENCES concept(concept_id);

-- ecls_blood_pump
ALTER TABLE ecls_blood_pump DROP CONSTRAINT IF EXISTS blood_pump_person_id_fkey CASCADE;
ALTER TABLE ecls_blood_pump DROP CONSTRAINT IF EXISTS ecls_blood_pump_stop_reason_concept_id_fkey CASCADE;
ALTER TABLE ecls_blood_pump DROP CONSTRAINT IF EXISTS ecls_blood_pump_material_id_fkey CASCADE;
ALTER TABLE ecls_blood_pump ADD CONSTRAINT blood_pump_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(person_id);
ALTER TABLE ecls_blood_pump ADD CONSTRAINT ecls_blood_pump_stop_reason_concept_id_fkey FOREIGN KEY (stop_reason_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_blood_pump ADD CONSTRAINT ecls_blood_pump_material_id_fkey FOREIGN KEY (material_id) REFERENCES ecls_blood_pump_material(material_id);

-- ecls_cannula
ALTER TABLE ecls_cannula DROP CONSTRAINT IF EXISTS ecls_cannula_person_id_fkey CASCADE;
ALTER TABLE ecls_cannula DROP CONSTRAINT IF EXISTS ecls_cannula_flow_direction_concept_id_fkey CASCADE;
ALTER TABLE ecls_cannula DROP CONSTRAINT IF EXISTS ecls_cannula_location_concept_id_fkey CASCADE;
ALTER TABLE ecls_cannula DROP CONSTRAINT IF EXISTS ecls_cannula_laterality_concept_id_fkey CASCADE;
ALTER TABLE ecls_cannula DROP CONSTRAINT IF EXISTS ecls_cannula_insertion_concept_id_fkey CASCADE;
ALTER TABLE ecls_cannula DROP CONSTRAINT IF EXISTS ecls_cannula_tip_position_concept_id_fkey CASCADE;
ALTER TABLE ecls_cannula DROP CONSTRAINT IF EXISTS ecls_cannula_tip_position_laterality_concept_id_fkey CASCADE;
ALTER TABLE ecls_cannula DROP CONSTRAINT IF EXISTS ecls_cannula_removal_concept_id_fkey CASCADE;
ALTER TABLE ecls_cannula DROP CONSTRAINT IF EXISTS ecls_cannula_stop_concept_id_fkey CASCADE;
ALTER TABLE ecls_cannula DROP CONSTRAINT IF EXISTS ecls_cannula_material_id_fkey CASCADE;
ALTER TABLE ecls_cannula ADD CONSTRAINT ecls_cannula_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(person_id);
ALTER TABLE ecls_cannula ADD CONSTRAINT ecls_cannula_flow_direction_concept_id_fkey FOREIGN KEY (flow_direction_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_cannula ADD CONSTRAINT ecls_cannula_location_concept_id_fkey FOREIGN KEY (location_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_cannula ADD CONSTRAINT ecls_cannula_laterality_concept_id_fkey FOREIGN KEY (laterality_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_cannula ADD CONSTRAINT ecls_cannula_insertion_concept_id_fkey FOREIGN KEY (insertion_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_cannula ADD CONSTRAINT ecls_cannula_tip_position_concept_id_fkey FOREIGN KEY (tip_position_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_cannula ADD CONSTRAINT ecls_cannula_tip_position_laterality_concept_id_fkey FOREIGN KEY (tip_position_laterality_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_cannula ADD CONSTRAINT ecls_cannula_removal_concept_id_fkey FOREIGN KEY (removal_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_cannula ADD CONSTRAINT ecls_cannula_stop_concept_id_fkey FOREIGN KEY (stop_reason_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_cannula ADD CONSTRAINT ecls_cannula_material_id_fkey FOREIGN KEY (material_id) REFERENCES ecls_cannula_material(material_id);

-- ecls_console
ALTER TABLE ecls_console DROP CONSTRAINT IF EXISTS ecls_console_person_id_fkey CASCADE;
ALTER TABLE ecls_console DROP CONSTRAINT IF EXISTS ecls_console_stop_reason_concept_id_fkey CASCADE;
ALTER TABLE ecls_console DROP CONSTRAINT IF EXISTS ecls_console_material_id_fkey CASCADE;
ALTER TABLE ecls_console ADD CONSTRAINT ecls_console_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(person_id);
ALTER TABLE ecls_console ADD CONSTRAINT ecls_console_stop_reason_concept_id_fkey FOREIGN KEY (stop_reason_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_console ADD CONSTRAINT ecls_console_material_id_fkey FOREIGN KEY (material_id) REFERENCES ecls_console_material(material_id);

-- ecls_membrane_lung
ALTER TABLE ecls_membrane_lung DROP CONSTRAINT IF EXISTS ecls_membrane_lung_person_id_fkey CASCADE;
ALTER TABLE ecls_membrane_lung DROP CONSTRAINT IF EXISTS ecls_membrane_lung_priming_solution_concept_id_fkey CASCADE;
ALTER TABLE ecls_membrane_lung DROP CONSTRAINT IF EXISTS ecls_membrane_lung_stop_reason_concept_id_fkey CASCADE;
ALTER TABLE ecls_membrane_lung DROP CONSTRAINT IF EXISTS ecls_membrane_lung_material_id_fkey CASCADE;
ALTER TABLE ecls_membrane_lung ADD CONSTRAINT ecls_membrane_lung_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(person_id);
ALTER TABLE ecls_membrane_lung ADD CONSTRAINT ecls_membrane_lung_priming_solution_concept_id_fkey FOREIGN KEY (priming_solution_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_membrane_lung ADD CONSTRAINT ecls_membrane_lung_stop_reason_concept_id_fkey FOREIGN KEY (stop_reason_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_membrane_lung ADD CONSTRAINT ecls_membrane_lung_material_id_fkey FOREIGN KEY (material_id) REFERENCES ecls_membrane_lung_material(material_id);

-- ecls_temperature_regulation_device
ALTER TABLE ecls_temperature_regulation_device DROP CONSTRAINT IF EXISTS ecls_temperature_regulation_device_person_id_fkey CASCADE;
ALTER TABLE ecls_temperature_regulation_device DROP CONSTRAINT IF EXISTS ecls_temperature_regulation_device_stop_reason_concept_id_fkey CASCADE;
ALTER TABLE ecls_temperature_regulation_device DROP CONSTRAINT IF EXISTS ecls_temperature_regulation_device_material_id_fkey CASCADE;
ALTER TABLE ecls_temperature_regulation_device ADD CONSTRAINT ecls_temperature_regulation_device_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(person_id);
ALTER TABLE ecls_temperature_regulation_device ADD CONSTRAINT ecls_temperature_regulation_device_stop_reason_concept_id_fkey FOREIGN KEY (stop_reason_concept_id) REFERENCES concept(concept_id);
ALTER TABLE ecls_temperature_regulation_device ADD CONSTRAINT ecls_temperature_regulation_device_material_id_fkey FOREIGN KEY (material_id) REFERENCES ecls_temperature_regulation_device_material(material_id);

-- Foreign keys for support tables
-- ecls_circuit_component
ALTER TABLE ecls_circuit_component DROP CONSTRAINT IF EXISTS ecls_circuit_component_person_id_fkey CASCADE;
ALTER TABLE ecls_circuit_component DROP CONSTRAINT IF EXISTS ecls_circuit_component_circuit_id_fkey CASCADE;
ALTER TABLE ecls_circuit_component ADD CONSTRAINT ecls_circuit_component_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(person_id);
ALTER TABLE ecls_circuit_component ADD CONSTRAINt ecls_circuit_component_circuit_id_fkey FOREIGN KEY (circuit_id) REFERENCES ecls_circuit(circuit_id);

-- ecls_blood_pump_material
ALTER TABLE ecls_blood_pump_material DROP CONSTRAINT IF EXISTS ecls_blood_pump_material_type_concept_id_fkey CASCADE;
ALTER TABLE ecls_blood_pump_material ADD CONSTRAINT ecls_blood_pump_material_type_concept_id_fkey FOREIGN KEY (type_concept_id) REFERENCES concept(concept_id);

-- ecls_cannula_material
ALTER TABLE ecls_cannula_material DROP CONSTRAINT IF EXISTS ecls_cannula_material_type_concept_id_fkey CASCADE;
ALTER TABLE ecls_cannula_material ADD CONSTRAINT ecls_cannula_material_type_concept_id_fkey FOREIGN KEY (type_concept_id) REFERENCES concept(concept_id);

-- ecls_console_material
ALTER TABLE ecls_console_material DROP CONSTRAINT IF EXISTS ecls_console_material_type_concept_id_fkey CASCADE;
ALTER TABLE ecls_console_material ADD CONSTRAINT ecls_console_material_type_concept_id_fkey FOREIGN KEY (type_concept_id) REFERENCES concept(concept_id);

-- ecls_membrane_lung_material
ALTER TABLE ecls_membrane_lung_material DROP CONSTRAINT IF EXISTS ecls_membrane_lung_material_type_concept_id_fkey CASCADE;
ALTER TABLE ecls_membrane_lung_material ADD CONSTRAINT ecls_membrane_lung_material_type_concept_id_fkey FOREIGN KEY (type_concept_id) REFERENCES concept(concept_id);

-- ecls_temperature_regulation_device_material
ALTER TABLE ecls_temperature_regulation_device_material DROP CONSTRAINT IF EXISTS ecls_temperature_regulation_device_material_type_concept_id_fkey CASCADE;
ALTER TABLE ecls_temperature_regulation_device_material ADD CONSTRAINT ecls_temperature_regulation_device_material_type_concept_id_fkey FOREIGN KEY (type_concept_id) REFERENCES concept(concept_id);

-- Unique constraints for ecls_circuit_component
ALTER TABLE ecls_circuit_component DROP CONSTRAINT IF EXISTS component_unique_for_circuit CASCADE;
ALTER TABLE ecls_circuit_component ADD CONSTRAINT component_unique_for_circuit UNIQUE (circuit_id, component_id, component_type);
