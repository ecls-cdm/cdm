This is one of the central tables of the ECLS CDM. It stores information
about the cannulas in place. Cannulas can be reused for circuits. Make sure
to set the correct timestamps.

| Column name                        | Required | Data Type                             |
| ---------------------------------- | -------- | ------------------------------------- |
| cannula_id                         | True     | integer, generated always as identity |
| start_datetime                     | True     | timestamptz                           |
| stop_datetime                      | (True)   | timestamptz                           |
| person_id                          | True     | integer                               |
| flow_direction_concept_id          | True     | integer                               |
| location_concept_id                | True     | integer                               |
| laterality_concept_id              |          | integer                               |
| insertion_concept_id               | True     | integer                               |
| insertion_length_in_centimeters    | True     | integer                               |
| tip_position_concept_id            | True     | integer                               |
| tip_position_laterality_concept_id |          | integer                               |
| removal_concept_id                 |          | integer                               |
| stop_reason_concept_id             | (True)   | integer                               |
| material_id                        | True     | integer                               |
| sn                                 |          | text                                  |
| lot                                |          | text                                  |
| ref                                |          | text                                  |
| udi                                |          | text                                  |

## .cannula_id

The primary key column.

## .start_datetime

Insertion time of the cannula.

## .stop_datetime

Removal time of the cannula.

## .person_id

The foreign key to the _person_ table.

## .flow_direction_concept_id

The foreign key to the _concept_ table. <br>
This attribute defines the blood flow through the cannula. These are
valid concepts:

**Allowed concepts:**

| concept_id                                                                           | concept_name              | comment                                                                    |
| ------------------------------------------------------------------------------------ | ------------------------- | -------------------------------------------------------------------------- |
| [36717809](https://athena.ohdsi.org/search-terms/terms/36717809/){:target="\_blank"} | Drainage                  |                                                                            |
| [36717810](https://athena.ohdsi.org/search-terms/terms/36717810/){:target="\_blank"} | Return                    |                                                                            |
| [36717811](https://athena.ohdsi.org/search-terms/terms/36717811/){:target="\_blank"} | Drainage and return       | This is usually the flow direction of a dual-lumen cannula.                |
| [36717812](https://athena.ohdsi.org/search-terms/terms/36717812/){:target="\_blank"} | Distinct distal perfusion | Distal perfusion occurs usually in VA-ECMO via a dedicated cannula.        |
| [36717813](https://athena.ohdsi.org/search-terms/terms/36717813/){:target="\_blank"} | Distinct distal drainage  | When a cannula is placed due to venous congestion use this flow direction. |

## .location_concept_id

The foreign key to the _concept_ table. <br>
Defines the anatomical site of cannulation. Laterality will be stored
seperately via _.laterality_concept_id_. SNOMED CT anatomical sites
are used for any vessel, that is cannulated.

**Allowed concepts:**

| concept_id                                                                         | concept_name                         | comment |
| ---------------------------------------------------------------------------------- | ------------------------------------ | ------- |
| [4242112](https://athena.ohdsi.org/search-terms/terms/4242112/){:target="\_blank"} | Atrial structure                     |         |
| [4070760](https://athena.ohdsi.org/search-terms/terms/4070760/){:target="\_blank"} | Cardiac ventricular structure        |         |
| [4215757](https://athena.ohdsi.org/search-terms/terms/4215757/){:target="\_blank"} | Pulmonary artery structure           |         |
| [4183988](https://athena.ohdsi.org/search-terms/terms/4183988/){:target="\_blank"} | Ascending aorta structure            |         |
| [4211548](https://athena.ohdsi.org/search-terms/terms/4211548/){:target="\_blank"} | Aortic arch structure                |         |
| [4286359](https://athena.ohdsi.org/search-terms/terms/4286359/){:target="\_blank"} | Carotid artery structure             |         |
| [4272388](https://athena.ohdsi.org/search-terms/terms/4272388/){:target="\_blank"} | Structure of subclavian artery       |         |
| [4239013](https://athena.ohdsi.org/search-terms/terms/4239013/){:target="\_blank"} | Structure of axillary artery         |         |
| [4164917](https://athena.ohdsi.org/search-terms/terms/4164917/){:target="\_blank"} | Structure of radial artery           |         |
| [4109754](https://athena.ohdsi.org/search-terms/terms/4109754/){:target="\_blank"} | Common femoral artery                |         |
| [4111596](https://athena.ohdsi.org/search-terms/terms/4111596/){:target="\_blank"} | Superficial femoral artery           |         |
| [4028232](https://athena.ohdsi.org/search-terms/terms/4028232/){:target="\_blank"} | Structure of posterior tibial artery |         |
| [4006845](https://athena.ohdsi.org/search-terms/terms/4006845/){:target="\_blank"} | Internal jugular vein structure      |         |
| [4047437](https://athena.ohdsi.org/search-terms/terms/4047437/){:target="\_blank"} | Structure of cephalic vein           |         |
| [4288602](https://athena.ohdsi.org/search-terms/terms/4288602/){:target="\_blank"} | Structure of axillary vein           |         |
| [4229590](https://athena.ohdsi.org/search-terms/terms/4229590/){:target="\_blank"} | Structure of brachiocephalic vein    |         |
| [4187680](https://athena.ohdsi.org/search-terms/terms/4187680/){:target="\_blank"} | Structure of common iliac vein       |         |
| [4270755](https://athena.ohdsi.org/search-terms/terms/4270755/){:target="\_blank"} | Structure of external iliac vein     |         |
| [4308414](https://athena.ohdsi.org/search-terms/terms/4308414/){:target="\_blank"} | Femoral vein structure               |         |
| [4271699](https://athena.ohdsi.org/search-terms/terms/4271699/){:target="\_blank"} | Inferior vena cava structure         |         |
| [4167648](https://athena.ohdsi.org/search-terms/terms/4167648/){:target="\_blank"} | Superior vena cava structure         |         |
| [4203602](https://athena.ohdsi.org/search-terms/terms/4203602/){:target="\_blank"} | Entire pulmonary vein (great vessel) |         |
| [4311330](https://athena.ohdsi.org/search-terms/terms/4311330/){:target="\_blank"} | Structure of subclavian vein         |         |

## .laterality_concept_id

The foreign key to the _concept_ table. <br>
Denoting whether the cannula was inserted on the left or right side of
the patient’s body.

**Allowed concepts:**

| concept_id                                                                         | concept_name | comment |
| ---------------------------------------------------------------------------------- | ------------ | ------- |
| [4300877](https://athena.ohdsi.org/search-terms/terms/4300877/){:target="\_blank"} | Left         |         |
| [4080761](https://athena.ohdsi.org/search-terms/terms/4080761/){:target="\_blank"} | Right        |         |

## .insertion_concept_id

The foreign key to the _concept_ table. <br>
Cannulas can be inserted in different ways. Standard approaches are either
percutaneous or surgical. Some centers will use a hybrid technique. Some
other cannulas must be inserted via specific grafts, e.g., a Dacron
chimney graft. Use one of the following concepts:

**Allowed concepts:**

| concept_id                                                                           | concept_name               | comment |
| ------------------------------------------------------------------------------------ | -------------------------- | ------- |
| [4013298](https://athena.ohdsi.org/search-terms/terms/4013298/){:target="\_blank"}   | Percutaneous approach      |         |
| [4044378](https://athena.ohdsi.org/search-terms/terms/4044378/){:target="\_blank"}   | Open approach              |         |
| [4305643](https://athena.ohdsi.org/search-terms/terms/4305643/){:target="\_blank"}   | Artificial graft           |         |
| [36717876](https://athena.ohdsi.org/search-terms/terms/36717876/){:target="\_blank"} | Semi-percutaneous approach |         |

## .insertion_length_in_centimeters

Denotes the initial length of insertion of the cannula. Use estimates
if precise measurements are not available.

## .tip_position_concept_id

The foreign key to the _concept_ table. <br>
Use the same concepts as _.location_concept_id_. The idea behind
_.tip_position_concept_id_ is to provide details about _where_ the blood
was drained from or returned to.

!!! info "An example"

    Sometimes it is important to drain or return blood from a specific site,
    such as the pulmonary artery. However, cannulation strategies to
    reach the pulmonary artery might be subcutaneous with a _.location_concept_id_
    of _4006845, Internal jugular vein structure_.

    If the exact draining or return site is not important, use the same
    concept as in *.location_concept_id*.

## .tip_position_laterality_concept_id

The foreign key to the _concept_ table. <br>
Use the same concepts as for _.laterality_concept_id_.

## .removal_concept_id

The foreign key to the _concept_ table. <br>
Cannulas can be removed using various methods, typically with manual
pressure or a dedicated device. If a vascular compression device,
surgical intervention, or insertion of a vascular closure device is
necessary, use one of the following concepts:

**Allowed concepts:**

| concept_id                                                                           | concept_name                         | comment |
| ------------------------------------------------------------------------------------ | ------------------------------------ | ------- |
| [4006179](https://athena.ohdsi.org/search-terms/terms/4006179/){:target="\_blank"}   | Repair of blood vessel with suture   |         |
| [44789807](https://athena.ohdsi.org/search-terms/terms/44789807/){:target="\_blank"} | Insertion of vascular closure device |         |
| [36717904](https://athena.ohdsi.org/search-terms/terms/36717904/){:target="\_blank"} | Vascular compression device          |         |

Information about the vascular closure device can be collected using a
high-level concept based on its physical properties. Entries regarding
physical objects should be made in the OMOP CDM _device_exposure_ table.
If the concept for the specific device (physical object) is not available,
use the type of vascular closure device as a proxy.

**Proposed concepts for the device_exposure table:**

| concept_id                                                                           | concept_name                           | comment |
| ------------------------------------------------------------------------------------ | -------------------------------------- | ------- |
| [36717900](https://athena.ohdsi.org/search-terms/terms/36717900/){:target="\_blank"} | Suture-based vascular closure device   |         |
| [36717901](https://athena.ohdsi.org/search-terms/terms/36717901/){:target="\_blank"} | Collagen-based vascular closure device |         |
| [36717902](https://athena.ohdsi.org/search-terms/terms/36717902/){:target="\_blank"} | Patch-based vascular closure device    |         |
| [36717903](https://athena.ohdsi.org/search-terms/terms/36717903/){:target="\_blank"} | Membrane-based vascular closure device |         |

## .stop_reason_concept_id

The foreign key to the _concept_ table. <br>
Choose the right concept to describe, why the cannula was removed.

Record the reason why the cannula was stopped.

Refer to [Stop reasons](../userguide/stop_reasons.md) for details on
stopping the run, circuit and/or component properly.

## .material_id

The foreign key to the _ecls_cannula_material_ table.

## .sn

If applicable, the serial number of the cannula.

## .lot

If applicable, the lot number of the cannula.

## .ref

If applicable, the reference number of the cannula. This is usually
the manufacturer's internal model number.

## .udi

If applicable, the whole data matrix/bar code of the Unique Device Identifier,
consisting of UDI-DI + UDI-PI.
