-- checks the correct tubing size: 3/16", 1/4", 3/8", 1/2"
ALTER TABLE ecls_circuit DROP CONSTRAINT IF EXISTS check_circuit_tubing_size CASCADE;
ALTER TABLE ecls_circuit ADD CONSTRAINT check_circuit_tubing_size CHECK (tubing_size_in_inches in (0.1875, 0.25, 0.375, 0.5))