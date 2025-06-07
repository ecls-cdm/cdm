---
hide:
  - navigation
---

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [v0.2.0] – 2025-06-07

### Changed
- Changed ecls_circuit_component.component_type_concept to component_type.
- Limit choices for ecls_circuit_component.component_type to: `ecls_blood_pump`, `ecls_cannula`, `ecls_console`, `ecls_membrane_lung`, and `ecls_temperature_regulation_device`.
- Removed poetry as primary package manager and switched to uv. Updated `pyproject.toml`.
- Updated documentation.

## [v0.1.0] – 2024-11-14

- Initial release

[Unreleased]: https://github.com/ecls-cdm/cdm/compare/v.0.2.0...HEAD
[v0.2.0]: https://github.com/ecls-cdm/cdm/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/ecls-cdm/cdm/releases/tag/v0.1.0
