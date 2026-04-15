# 4.5 Requirements Specification

## Chosen Subset
This requirements specification focuses on the application submission and administrative workflow of the Research Ethics Management System (REMS). It covers researcher submission of applications and supporting documents, administrative completeness checking, return of incomplete applications for revision, status tracking, and related security and audit constraints.

## Functional Requirements

**FR1.** The system shall allow a researcher to create and submit a new ethics application.

**FR2.** The system shall require each application to record a principal researcher.

**FR3.** The system shall allow a researcher to record research team members and their roles and responsibilities.

**FR4.** The system shall require an application to include a description of the research, its methodology, and risks to participants before submission.

**FR5.** The system shall allow a researcher to upload supporting documents as part of an application.

**FR6.** The system shall allow administrative staff to review a submitted application for completeness.

**FR7.** The system shall allow administrative staff to mark an application as complete or incomplete.

**FR8.** The system shall allow administrative staff to return an incomplete application to the researcher with a request for clarification or revision.

**FR9.** The system shall record the current status of each application.

**FR10.** The system shall allow administrative staff to view the status history of an application.

**FR11.** The system shall maintain a link between an application and all documents submitted with it.

**FR12.** The system shall require a new application to be submitted when changes are needed after approval.

## Non-Functional Requirements

**NFR1.** The system shall require authentication before any user can access REMS functions.

**NFR2.** The system shall restrict access to application information according to user role.

**NFR3.** The system shall allow administrative staff to view document metadata but not document contents.

**NFR4.** The system shall maintain version history for supporting documents.

**NFR5.** The system shall maintain an audit trail of submissions, status changes, reviews, decisions, and modifications.

**NFR6.** The system shall preserve previously approved application records for reference.

## Requirement Types
- FR1–FR12 are functional requirements.
- NFR1–NFR6 are non-functional requirements.
