-- checks the correct tubing size in ecls_circuit.tubing_size_in_inches
-- valid options: 3/16", 1/4", 3/8", 1/2"
ALTER TABLE ecls_circuit DROP CONSTRAINT IF EXISTS check_circuit_tubing_size CASCADE;
ALTER TABLE ecls_circuit ADD CONSTRAINT check_circuit_tubing_size CHECK (
    tubing_size_in_inches in (0.1875, 0.25, 0.375, 0.5)
);

-- checks for the correct entry in ecls_circuit_component.component_type
ALTER TABLE ecls_circuit_component DROP CONSTRAINT IF EXISTS check_component_type CASCADE;
ALTER TABLE ecls_circuit_component ADD CONSTRAINT check_component_type CHECK (
    component_type in (
        'ecls_blood_pump',
        'ecls_cannula',
        'ecls_console',
        'ecls_membrane_lung',
        'ecls_temperature_regulation_device'
    )
);
