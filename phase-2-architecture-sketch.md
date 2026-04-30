# CITS4401 Software Requirements & Design — Phase 2 Architecture Sketch

**Group Number:** 10

Scope: the **REMS administrative workflow subsystem**, including researcher-facing submission, status, and notification flows, but excluding internal committee review.

## 1.1 Architecture Style and Rationale

REMS is designed as a [modular monolith](https://www.milanjovanovic.tech/blog/what-is-a-modular-monolith): one server behind an auth gateway, backed by [PostgreSQL](https://www.postgresql.org/), an S3-compatible object store, and a small asynchronous job queue. We did not choose microservices because the expected single-university scale does not justify the extra complexity of service-to-service authentication, distributed tracing, independent deployment, and cross-service failure handling. We also rejected a SharePoint-style extension because Phase 1 identified fragmented document storage as the main operational problem. The modular-monolith structure keeps operations simple while still giving clear internal boundaries for confidentiality, audit visibility, and workflow logic.

## 1.2 Component Responsibilities

1. **Web Client**: browser-based SPA for researcher and admin interactions; not the source of truth, with workflow state enforced on the server side.
2. **Auth Gateway**: single ingress point; performs OIDC-based authentication, role-based routing, and request forwarding.
3. **Application Service**: owns business logic such as state transitions, checklist resolution, forwarding, returns for missing documents, and expedited handling.
4. **Document Service**: manages document metadata and version history, storing file bytes in the object store and metadata in PostgreSQL.
5. **Notification Service**: sends researcher-facing emails for receipt, missing-document requests, status changes, and decisions, with retries handled asynchronously.
6. **Audit Service**: records significant actions and status changes in an append-only audit trail with role-appropriate visibility.
7. **Scheduler**: runs periodic background checks such as deadline monitoring and raises deadline-warning flags for admin action.
8. **Job Queue**: supports asynchronous work such as notification retries and scheduler-triggered background jobs.

## 1.3 Component Block Diagram

[TODO] Add block diagram

## 1.4 Major Data Flows

The main data flows in the administrative workflow subsystem are described below.

1. **Application submission flow**

   A researcher enters application details through the Web Client.The request goes to the Auth Gateway that verifies the user session and forwards the request to the Application Service.
   The Application Service stores application metadata, including researcher details,risk score,submission date and current status, in PostgreSQL.

2. **Document upload and versioning flow**
   The researcher uploads necessary documents through the Web Client. The Auth Gateway verifies access and forwards the upload to the Document Service.The Document Service stores the file contents in the object store and records document metadata in PostgreSQL including file name, file type, uploader, timestamp, version number, and SHA-256 hash. This supports records and version control.

3. **Administrative completeness checking flow**
   Admin staff access the application through the Web Client. The Auth Gateway checks that the user has the admin role. The Application Service retrieves the application risk score and required checklist, while the Document Service provides document metadata only.Admin staff can verify whether required documents are present without looking into the document contents.

4. **Missing document or revision request flow**
   If required documents are missing or invalid,the admin staff triggers a return action through the Web Client.The Application Service updates the application status to “Returned to Researcher”.The Notification Service sends an email to the researcher explaining what is needed and the Audit Service keeps the records of the action.

5. **Forwarding application to committee flow**
   Once the application is complete, admin staff forwards it to the Ethics Committee. The Application Service updates the status to “Forwarded to Committee”.The Committee Portal can then access the application,subject to role-based permissions. Unlike admin staff,committee members can access the full document contents.

6. **Deadline monitoring flow**
   The Scheduler periodically checks application submission dates against the two-week turnaround target. If an application is approaching the deadline,the Scheduler notifies the Application Service,which applies an deadline-warning status.The Notification Service may send an update where required and the Audit Service records the change.

7. **Audit logging flow**
  Important actions such as submitting an application, uploading documents, changing status, requesting missing documents, forwarding to the committee and marking applications as expedited are recorded by the Audit Service.The Audit Service keeps these records in a secure log so they cannot be changed or deleted.Access to these logs is controlled based on roles. Admin-related actions can be viewed by both admin staff and the ethics committee, while sensitive committee discussions are only visible to the committee.

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
