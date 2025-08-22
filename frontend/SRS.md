# Software Requirements Specification

## Project: Web application for the ECLS-CDM

### Version: DRAFT
### Authors: ECLS CDM Working Group
### Date: xx.xx.xxxx

### Table of contents

* [Revision History](#revision-history)
* 1 [Introduction](#1-introduction)
  * 1.1 [Purpose](#11-purpose)
  * 1.2 [Scope](#12-scope)
  * 1.3 [Product overview](#13-product-overview)
    * 1.3.1 [Product perspective](#131-product-perspective)
    * 1.3.2 [Product functions](#132-product-functions)
    * 1.3.3 [User characteristics](#133-user-characteristics)
    * 1.3.4 [Limitations](#134-limitations)
  * 1.4 [Definitions](#14-definitions)
* 2 [References](#2-references)
* 3 [Requirements](#3-requirements)
  * 3.1 [Functions](#31-functions)
  * 3.2 [Performance requirements](#32-performance-requirements)
  * 3.3 [Usability requirements](#33-usability-requirements)
  * 3.4 [Interface requirements](#34-interface-requirements)
  * 3.5 [Logical database requirements](#34-logical-database-requirements)
  * 3.6 [Design constraints](#36-design-constraints)
  * 3.7 [Software system attributes](#37-software-system-attributes)
  * 3.8 [Supporting information](#38-supporting-information)
* 4 [Verification](#4-verfication) (similar to section 3)
* 5 [Appendices](#5-appendices)
  * 5.1 [Assumptions and dependencies](#51-assumptions-and-dependencies)
  * 5.2 [Acronyms and abbreviations](#52-acronyms-and-abbreviations)

## Revision History
| Version | Date    | Reason For Changes  |
| ------- | ------- | ------------------- |
|         |         |                     |

## 1. Introduction

### 1.1 Purpose

This document specifies the requirements for a web application, named
*ECLSDoc*, that enables users to enter data directly into the OMOP CDM and
ECLS CDM tables based on the ISO/IEC/IEEE 29148:2018 standard.

### 1.2 Scope

The purpose of *ECLSDoc* is to provide a web-based platform that enables
users to store, organize, and manage ECLS-related data elements
created during treatment of critically ill patients undergoing extracorporeal
life support therapy.

The application allows users to:
- Create and manage entries for patients undergoing ECLS treatment
- Share captured data elements between different stakeholder institutions
- Share data based on set requirements by international stakeholders,
  such as the Extracorporeal Life Support Organization
- Create patient transfer request forms

The objective is to offer a single data entry tool that can be used
globally, regardless of the hospital’s digital infrastructure and easily
deployed in resource-limited settings. *ECLSDoc* provides only documentation
functionality and is therefore not classified as medical device,
according to the European Medical Device Regulation (MDR), Regulation (EU)
2017/745.

Using internationally recognized data standards such as the OMOP CDN and
its ECLS-focused expansion ECLS CDM as semantic and syntactic backbone,
*ECLSDoc* will provide improved interoperability, facilitating swift data
exchange and subsequent data analysis for scientific research.

### 1.3 Product overview

#### 1.3.1 Product perspective

*ECLSDoc* can be used as standalone application or connected to existing
infrastructure.

##### 1.3.1.1 System interfaces

*ECLSDoc* is a browser-based application and supports current browser
technologies independent of vendors.

##### 1.3.1.2 User interfaces

*ECLSDoc* provides a graphical user interface (GUI) via the browser
accessible to users after successful authentication and authorization.
Inputs are available via keyboard and mouse.

#### 1.3.2 Product functions

The main product functions are:

- Connection to an existing OMOP CDM database or setup of a new instance
  of the OMOP CDM with its ECLS CDM expansion
- User management
- Management of data elements related to ECLS therapy
- Data import and export between different *ECLSDoc* instances
- Data export to stakeholder registries (ELSO Registry)

#### 1.3.3 User characteristics

**U-1:** The primary users of the system are healthcare professionals
involved in extracorporeal life support, namely: Physicians, Nurses,
Perfusionists, and Physiotherapists.

- Education: Completed apprenticeship, bachelor's degree or higher in
  medicine or nursing.
- Experience: Different levels of familiarity with ECLS procedures. Some
  users may be experts, while others may have only basic training.
- Technical expertise: Basic computer literacy. Not all users are familiar
  with advanced IT systems.
- Constraints: Users often work in high-stress, time-critical environments
  with limited time for data entry.
- Disabilities: Color blindness can be an issue when working with the
  application. Physical disabilities are usually not present.

**U-2:** The secondary users are IT professionals working for the hospital
IT department, such as system administrators, or database engineers.

- Education: Completed apprenticeship, alternatively bachelor's degree or
higher in an IT-related field.
- Experience: Unfamiliar with medical procedures surrounding ECLS treatment.
- Technical expertise: High computer and IT systems literacy.
- Constraints: Limited resources for resource management are available.
- Disabilities: Color blindness, as well as other mental or physical
  disabilities can be present, since the IT job environment allows for
  more inclusiveness compared to working at the patient bed.

#### 1.3.4 Limitations

The software does not serve as clinical decision support. No medical
decision must be based on the parameters and elements provided by
*ECLSDoc*.

### 1.4 Definitions

**ecls_run:** A run is defined as an exposure to ECLS therapy and the
beginning of blood flow through the circuit until the removal of the
last cannula. This definition takes into account that patients can be
left without support but cannulas are kept in place to take them back on
support quickly, if a long-term separation from the circuit is not successful.

**ecls_circuit:** An ECLS circuit is defined by the combination of
components used during extracorporeal support.

**ecls_mode:** An ecls mode is derived from the combination of draining
and returning cannulas.

## 2 References

* ISO/IEC/IEEE 12207:2017 - Software Life Cycle Processes
* ISO/IEC/IEEE 29148:2018 - Requirements Engineering
* ISO/IEC/IEEE 15288:2023 - System Life Cycle Processes

## 3 Requirements

### 3.1 Functions

#### 3.1.1 Setup functions

| Identification | Requirement Name                   | Description                                                                                                                                                   | Rationale                                                                                                                                             | Priority (high/medium/low) | Difficulty (easy/nominal/difficult) |
| -------------- | ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- | ----------------------------------- |
| SF-001         | Display initial configuration page | At the first startup of the application, the system shall display a configuration page, before allowing access to any other functionality of the application. | The configuration page is necessary for the initial setup of the application.                                                                         | high                       | easy                                |
| SF-002         | Language configuration             | The configuration page shall provide a mechanism for the user to select the application language.                                                             |                                                                                                                                                       | high                       | easy                                |
| SF-003         | Administrative user configuration  | At the initial start of the application shall allow the user to create a user with administrative privileges.                                                 | The administrator manages any subsequent users. The application needs at least one superuser/administrator.                                           | high                       | easy                                |
| SF-004         | OMOP CDM database configuration    | The configuration page shall provide a mechanism for the user to select whether the OMOP CDM database is already present within their host system.            | If the OMOP CDM is already present at the site, then the database connection parameters can be specified on this page.                                | high                       | difficult                           |
| SF-005         | SMTP configuration                 | The configuration page shall provide a mechanism for the user to select SMTP credentials to allow e-mail services, if applicable                              | E-mail service provide relief for system administrators and can be used as warning system in case the application is offline, or for basic reporting. | high                       | easy                                |

#### 3.1.2 User functions

| Identification | Requirement Name                               | Description                                                                                                                                                                   | Rationale                                                                                                                                                       | Priority (high/medium/low) | Difficulty (easy/nominal/difficult) |
| -------------- | ---------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- | ----------------------------------- |
| UF-001         | Create user                                    | The application shall allow the administrator to add new users.                                                                                                               | The admin can add new users.                                                                                                                                    | high                       | easy                                |
| UF-002         | Update user                                    | The application shall allos the administrator to update information of existing users.                                                                                        | The admin can update user information.                                                                                                                          | high                       | easy                                |
| UF-003         | Deactivate user                                | The application shall allow the administrator to deactivate existing users.                                                                                                   | Deactivated users are set to an "inactive" state, without deleting the actual database entries, to guarantee completeness of database entries.                  | high                       | easy                                |
| UF-004         | Prevent last admin deactivation                | The application shall prevent the administrator to deactivate their account, if no other user with administrative privileges is active.                                       | To make sure, that at least one administrator is present in the application. This avoids unneccessary database fiddeling.                                       | high                       | easy                                |
| UF-005         | User password reset via email                  | The application shall provide a password reset mechanism that sends a password reset link to the user's registered email address upon request.                                | This requires the SMTP interface to be set up correctly.                                                                                                        | medium                     | easy                                |
| UF-006         | User password reset via administrator          | The application shall allow the administrator to invalidate a users password and create a password reset link, that is sent to the user's registered email address.           | If the user forgets the password, the administrator can create the password reset link and send it to the user.                                                 | high                       | easy                                |
| UF-007         | User password reset prompt                     | Accessing the password reset link, the application shall provide the user with a mechanism, to create a new password.                                                         |                                                                                                                                                                 | high                       | easy                                |
| UF-008         | Password reset invalidation after grace period | After a grace period of 24 hours, if no new password is set by the user, the application shall invalidate the password reset link.                                            | If the user has not set a new password within 24 hours, the link is deactivated and the process has to be restarted either via email or the administrator.      | high                       | easy                                |
| UF-010         | User login                                     | The user shall use their username and password to authenticate with the application.                                                                                          |                                                                                                                                                                 | high                       | easy                                |
| UF-011         | Permission management                          | The application shall provide a mechanism to allow administrators to create and manage user groups, roles and their respective permissions in relation to the collected data. | Administrators create organizational units and assign users to these units. The users will only be able to see data that was created by a member of their unit. | high                       | nominal                             |

#### 3.1.3 Data functions

| Identification | Requirement Name      | Description                                                                                                               | Rationale                                                                                                                                             | Priority (high/medium/low) | Difficulty (easy/nominal/difficult) |
| -------------- | --------------------- | ------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- | ----------------------------------- |
| DF-001         | Display overview      | The application shall provide an overview of active data entries after the user has logged into the system.               | This refers to the landing page/dashboard of the application.                                                                                         | high                       | nominal                             |
| DF-002         | Provide data trash    | The application shall provide a mechanism to store deleted entries for 7 days before final removal.                       | This provides the option to restore data, that has been deleted by accident.                                                                          | medium                     | nominal                             |
| DF-003         | Create ECLS record    | The application shall provide a mechanism to create a new data record.                                                    |                                                                                                                                                       | high                       | difficult                           |
| DF-004         | Update ECLS record    | The application shall provide a mechanism to update existing records.                                                     |                                                                                                                                                       | high                       | difficult                           |
| DF-005         | Delete ECLS record    | The application shall provide a mechanism to delete existing records.                                                     |                                                                                                                                                       | high                       | nominal                             |
| DF-006         | Archive ECLS record   | The application shall provide a mechanism to archive existing records.                                                    | If the record is not necessary anymore (e.g. the patient is transferred or died), the record should be archived to not be displayed in the dashboard. | high                       | nominal                             |
| DF-007         | Search function       | The application shall provide search and filter functions for existing records.                                           |                                                                                                                                                       | high                       | nominal                             |
| DF-008         | External request form | The application shall provide a publicly accessible web form for external hospitals to request patient transfer for ECLS. | This helps manage requests from external hospitals by forcing them to fill out the request form with various mandatory fields.                        | low                        | difficult                           |
| DF-009         | Data export           | The application shall export data elements in machine-readable formats.                                                   | This helps transferring data between application instances.                                                                                           | medium                     | difficult                           |
| DF-010         | Data import           | The application shall allow the import of data elements, stored in machine-readable format after validation.              |                                                                                                                                                       | medium                     | difficult                           |
| DF-011         | Update lock           | The application shall prohibit concurrent access to a record, that is being edited.                                       |                                                                                                                                                       | high                       | easy                                |

### 3.2 Performance requirements

| Identification | Requirement Name | Description                                                                                   | Rationale | Priority (high/medium/low) | Difficulty (easy/nominal/difficult) |
| -------------- | ---------------- | --------------------------------------------------------------------------------------------- | --------- | -------------------------- | ----------------------------------- |
| PR-001         | Response time    | The application pages should display results within 500ms after a page request has been sent. |           | high                       | nominal                             |
| PR-002         | Search latency   | Using the search function, the application shall display results to the user within 500ms.    |           | high                       | nominal                             |
| PR-003         | Availability     | The system should have an uptime of minimum 99.9% of the time                                 |           | high                       | nominal                             |

### 3.3 Usability requirements

| Identification | Requirement Name       | Description                                                                                                     | Rationale                                                                                                                              | Priority (high/medium/low) | Difficulty (easy/nominal/difficult) |
| -------------- | ---------------------- | --------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- | ----------------------------------- |
| UR-001         | Color vision support   | The colors used for the application shall be clearly distinguishable for people with impaired color vision      |                                                                                                                                        | medium                     | easy                                |
| UR-002         | Dyslexia-friendly font | The application should allow the user to change the font to a dyslexic-friendly style.                          |                                                                                                                                        | low                        | easy                                |
| UR-003         | Dark mode support      | The application should allow the user to choose between light mode and dark mode, to reduce strain on the eyes. | This is especially useful during nightshifts, where bright screens might pose a distraction for patients as well as hospital personel. | low                        | nominal                             |
| UR-004         | Keyboard navigation    | Interactive controls shall be reachable and operable via keyboard only, with visible focus indicators.          |                                                                                                                                        | medium                     | nominal                             |
| UR-005         | Form validation        | The application shall provide support for inline form validation.                                               |                                                                                                                                        | high                       | difficult                           |

### 3.4 Interface requirements

TBD

### 3.4 Logical database requirements

TBD

### 3.6 Software system attributes

| Identification | Requirement Name               | Description                                                                                               | Rationale | Priority (high/medium/low) | Difficulty (easy/nominal/difficult) |
| -------------- | ------------------------------ | --------------------------------------------------------------------------------------------------------- | --------- | -------------------------- | ----------------------------------- |
| SSA-001        | Hide sensitive information     | The application shall hide any information that is considered sensitive, such as passwords.               |           | high                       | easy                                |
| SSA-002        | Encrypt traffic                | The system shall encrypt all network traffic between the application and clients using TLS 1.3 or higher. |           | high                       | easy                                |
| SSA-003        | Reject unencrypted connections | The system shall reject any unencrypted connections.                                                      |           | high                       | easy                                |
| SSA-004        | Redirect unencrypted traffic   | The system shall reject or redirect all unencrypted HTTP requests to HTTPS.                               |           | high                       | easy                                |

## 5 Appendices

### 5.2. Acronyms and abbreviations

| Acronym | Meaning |
| ------- | ------- |
| CDM | Common Data Model |
| ECLS | Extracorporeal Life Support |
| ECMO | Extracorporeal Membrane Oxygenation |
| ELSO | Extracorporeal Life Support Organization |
| EU | European Union |
| HTTP | Hypertext Transfer Protocol |
| HTTPS | Hypertext Transfer Protocol Secure |
| GUI | Graphical user interface | 
| MDR | Medical Device Regulation |
| OHDSI | Observational Health Data Sciences and Informatics |
| OMOP | Observational Medical Outcomes Partnership |
