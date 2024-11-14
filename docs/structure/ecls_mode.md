Depending on the cannulation strategy, circuits can be operated in
different modes. Modes can be switched multiple times throughout a run.

!!! info

    If modes are switched, make sure that _old_entry.stop_datetime_ and
    _new_entry.start_datetime_ are the same.

| Column name     | Required | Data Type                             |
| --------------- | -------- | ------------------------------------- |
| mode_id         | True     | integer, generated always as identity |
| start_datetime  | True     | timestamptz                           |
| stop_datetime   | (True)   | timestamptz                           |
| person_id       | True     | integer                               |
| circuit_id      | True     | integer                               |
| mode_concept_id | True     | integer                               |

## .mode_id

The primary key column.

## .start_datetime

Use the date and time the mode was started.

## .stop_datetime

Use the date and time the mode was stopped.

## .person_id

The foreign key to the _person_ table.

## .circuit_id

The foreign key to the _ecls_circuit_ table.

## .mode_concept_id

The foreign key to the _concept_ table. <br>
A mode is a representation of the cannulation strategy. Typical
modes can be found in the table below. Select the most fitting mode.
While "modes" would not be strictly necessary, because they can always
be inferred, the _.mode_concept_id_ was introduced to simplify queries
and enhance the user experience.

| concept_id                                                                           | concept_name                                          | comment                                                                              |
| ------------------------------------------------------------------------------------ | ----------------------------------------------------- | ------------------------------------------------------------------------------------ |
| [37206603](https://athena.ohdsi.org/search-terms/terms/37206603/){:target="\_blank"} | Venovenous extracorporeal membrane oxygenation        |                                                                                      |
| [37206601](https://athena.ohdsi.org/search-terms/terms/37206601/){:target="\_blank"} | Venoarterial extracorporeal membrane oxygenation      |                                                                                      |
| [36717790](https://athena.ohdsi.org/search-terms/terms/36717790/){:target="\_blank"} | Venovenoarterial extracorporeal membrane oxygenation  |                                                                                      |
| [36717791](https://athena.ohdsi.org/search-terms/terms/36717791/){:target="\_blank"} | Venopulmonary extracorporeal membrane oxygenation     |                                                                                      |
| [36717792](https://athena.ohdsi.org/search-terms/terms/36717792/){:target="\_blank"} | Venoarteriovenous extracorporeal membrane oxygenation |                                                                                      |
| [36717793](https://athena.ohdsi.org/search-terms/terms/36717793/){:target="\_blank"} | Venopulmoarterial extracorporeal membrane oxygenation |                                                                                      |
| [36717794](https://athena.ohdsi.org/search-terms/terms/36717794/){:target="\_blank"} | Pumpless extracorporeal membrane oxygenation          | The PA-LA strategy, using a passive pressure gradient, is synonymous to this concept |
| [44809035](https://athena.ohdsi.org/search-terms/terms/44809035/){:target="\_blank"} | Arteriovenous extracorporeal carbon dioxide removal   |                                                                                      |
| [36717795](https://athena.ohdsi.org/search-terms/terms/36717795/){:target="\_blank"} | Venovenous extracorporeal carbon dioxide removal      |                                                                                      |
