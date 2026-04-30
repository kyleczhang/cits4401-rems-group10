# CITS4401 Software Requirements & Design — Phase 2 Architecture Sketch

**Group Number:** 10

Scope: the **REMS administrative workflow subsystem**, including researcher-facing submission, status, and notification flows, but excluding internal committee review.

## 1.1 Architecture Style and Rationale

REMS is designed as a [modular monolith](https://www.milanjovanovic.tech/blog/what-is-a-modular-monolith): one server behind an auth gateway, backed by [PostgreSQL](https://www.postgresql.org/), an S3-compatible object store, and a small asynchronous job queue. We did not choose microservices because, at this scale, they would add significant operational overhead without clear benefit. In particular, they would introduce extra complexity around inter-service authentication, deployment, tracing, and failure handling. We also rejected a SharePoint-style extension because Phase 1 identified fragmented document storage as the main operational problem. The modular-monolith structure keeps operations simple while still giving clear internal boundaries for confidentiality, audit visibility, and workflow logic.

## 1.2 Component Responsibilities

1. **Web Client**: browser-based SPA for the researcher and admin portals; stateless and not the source of truth.
2. **Auth Gateway**: single ingress point; performs OIDC-based authentication, role-based routing, and request forwarding.
3. **Application Service**: owns business logic such as state transitions, checklist resolution, forwarding, returns for missing documents, and expedited handling.
4. **Document Service**: stores metadata in PostgreSQL and file bytes in the object store; computes a SHA-256 hash for each version and exposes metadata without exposing document contents to admin staff.
5. **Notification Service**: sends researcher-facing emails for receipt, missing-document requests, status changes, and decisions; retries failed SMTP sends asynchronously.
6. **Audit Service**: records append-only events and enforces the segmented audit visibility required by FR-15.
7. **Scheduler**: scans applications against the two-week SLA and raises deadline-warning flags for admin action.

## 1.3 Component Block Diagram

[TODO] Add block diagram

## 1.4 Major Data Flows

[TODO] Add major data flows

## 1.5 Use-Case-to-Component Mapping

The table below maps the main Phase 1 use cases in the administrative workflow slice to the proposed architecture components. This shows which parts of the design are responsible for each user-facing workflow.

| Use case / responsibility | Main components | Component responsibility |
|---|---|---|
| Submit Ethics Application | Web Client, Auth Gateway, Application Service | The Web Client collects the researcher’s application details and risk score. The Auth Gateway verifies the user session, and the Application Service creates the application record and initial status. |
| Upload Supporting Documents | Web Client, Document Service, PostgreSQL, Object Store | The Document Service stores file bytes in the object store and records metadata such as file name, file type, uploader, timestamp, version number, and SHA-256 hash in PostgreSQL. |
| Verify Application Completeness | Application Service, Document Service | The Application Service resolves the required checklist from the application’s risk score and compares it with document metadata exposed by the Document Service. Admin staff are shown whether required documents are present, missing, or invalid. |
| Request Missing Documents | Application Service, Notification Service, Audit Service | If documents are missing or invalid, the Application Service changes the status to Returned to Researcher. The Notification Service sends the request, and the Audit Service records the action. |
| Forward Application to Committee | Application Service, Audit Service, Notification Service | Once admin staff confirm completeness, the Application Service updates the status to Forwarded to Committee. The Audit Service records the transition, and the Notification Service sends the relevant status update. |
| View Application Status | Web Client, Auth Gateway, Application Service | The Application Service provides the current application status. The Auth Gateway ensures that users only access views permitted for their role. |
| View Document Version History | Document Service, Audit Service | The Document Service provides version metadata without exposing document contents to admin staff. The Audit Service records upload and replacement events for traceability. |
| Mark Application as Expedited | Scheduler, Application Service, Notification Service, Audit Service | The Scheduler identifies applications approaching the two-week SLA. The Application Service applies the expedited flag, the Notification Service sends updates where required, and the Audit Service records the change. |

## 1.6 Non-Functional Requirements that Most Shaped the Design

[TODO] Add NFRs that most shaped the design
