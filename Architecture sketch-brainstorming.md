# Architecture Proposal Notes (Phase 2)

## 1. Proposed Architecture Style
 
We are deciding on using a **three-tier architecture** consisting of:

- Presentation Layer (Web Client / UI)
- Application Layer (Business Logic)
- Data Layer (Storage)

Within the application layer, we will use a **modular monolith design**, where the system is implemented as a single deployable unit but internally divided into logical modules.

This approach is chosen over microservices because it is simpler to manage while still maintaining separation of concerns.

---

## 2. High-Level Components

### Presentation Layer
- Web Client (Browser-based SPA)
  - Researcher Portal
  - Admin Dashboard
  - Committee Portal

### Application Layer (Modular Monolith)

- API Gateway  
  - Entry point for all requests  
  - Handles routing and access control  

- Identity Adapter  
  - Token verification  
  - Session management  

- Application Service  
  - Handles application lifecycle (submission, status, workflow)  

- Document Service  
  - Stores documents  
  - Handles versioning  
  - Provides metadata (important for admin-only access)  

- Completeness Check Service  
  - Validates required documents based on risk  

- Notification Service  
  - Sends emails to researchers  

- Audit Service  
  - Records system actions (admin + committee logs)  

- Scheduler / Deadline Service  
  - Tracks 2-week SLA  
  - Marks expedited cases  

- Access Control Service  
  - Enforces permissions:
    - Admin → metadata only  
    - Committee → full content  
    - Researcher → limited visibility  

---

## 3. Data Layer

- Application Database  
- Document Storage (Object Store)  
- Audit Log Storage  

---

## 4. Key Design Decisions

- Centralised document storage to fix fragmentation issues (from stakeholder interview)
- Role-based access control based on admin vs committee visibility
- Workflow service to replace email-based tracking
- Modular monolith to keep system simple while structured

---

## 5. Component to Phase 1 Requirement Mapping

The following mapping connects the proposed architecture components to the Phase 1 administrative workflow requirements. This helps ensure that the architecture directly supports our selected system slice rather than being a generic system structure.

| Phase 1 requirement / responsibility | Main architecture component(s) | Design explanation |
|---|---|---|
| Centralised document storage | Document Service, Document Storage | The Document Service stores all uploaded supporting documents in a single secure repository instead of relying on email, SharePoint links, or scattered attachments. |
| Broad file format support | Document Service, Document Storage | Uploaded files are handled by the Document Service and stored in object/document storage, allowing the system to support multiple file types while keeping metadata in the database. |
| Risk-score-based checklist | Completeness Check Service, Application Service | The Completeness Check Service uses the application risk score to determine which supporting documents are required. |
| Automated completeness validation | Completeness Check Service, Document Service | The Completeness Check Service compares the required checklist items against uploaded document metadata provided by the Document Service. |
| Application status tracking | Application Service, Application Database | The Application Service manages application statuses such as Submitted, Under Admin Review, Returned to Researcher, Forwarded to Committee, and Expedited. |
| Admin status dashboard | Web Client, Application Service | The Admin Dashboard displays application status information retrieved from the Application Service. |
| Document version history | Document Service, Document Storage, Application Database | The Document Service records version number, uploader, timestamp, and file hash for each uploaded document version. |
| Admin-to-researcher communication | Notification Service, Application Service, Audit Service | Missing document requests are sent through the Notification Service and recorded against the application by the Audit Service. |
| Forward application to committee | Application Service, Audit Service, Notification Service | The Application Service updates the application state to Forwarded to Committee, while the Audit Service records the action and the Notification Service informs the relevant users. |
| Deadline tracking and expedited status | Scheduler / Deadline Service, Application Service, Notification Service | The Scheduler scans applications approaching the two-week SLA and supports warning or expedited status updates through the Application Service. |
| Role-based access control | Identity Adapter, Access Control Service, Document Service | The Identity Adapter verifies the user, while the Access Control Service ensures that admin staff can only access document metadata, committee members can access document contents, and researchers have limited visibility. |
| Segmented audit trail | Audit Service, Audit Log Storage | The Audit Service records admin-side and committee-side actions in audit storage, supporting the segmented audit trail requirement from Phase 1. |

---

## 6. Major Data Flows

### 6.1 Application Submission Flow

The researcher uses the Researcher Portal to submit application details, enter the risk score, and upload supporting documents. The Web Client sends the application data to the API Gateway or Backend API Layer. The Application Service creates the application record in the Application Database, while the Document Service stores uploaded files in Document Storage and saves metadata such as file name, file type, uploader, timestamp, version number, and file hash.

### 6.2 Completeness Checking Flow

An administrative staff member opens the Admin Dashboard and selects a submitted application. The Application Service retrieves the application details and risk score. The Completeness Check Service uses the risk score to determine the required documents, then compares those requirements with document metadata from the Document Service. The result is returned to the Admin Dashboard as complete, missing, or invalid checklist items.

### 6.3 Missing Document Request Flow

If required documents are missing or invalid, the administrative staff member sends a missing document request through the system. The Application Service updates the application status to Returned to Researcher. The Notification Service sends the request to the researcher, and the Audit Service records the staff member, timestamp, missing items, and status change.

### 6.4 Forwarding to Committee Flow

If all required documents are present, the administrative staff member confirms completeness and forwards the application. The Application Service changes the status to Forwarded to Committee and makes the application available to the committee pipeline. The Audit Service records the action, and the Notification Service sends a status update to the researcher.

### 6.5 Deadline Monitoring Flow

The Scheduler / Deadline Service periodically checks application submission dates against the two-week processing target. If an application is approaching the deadline, it alerts the Application Service so that the application can be flagged for attention or marked as Expedited. The Notification Service can then inform the researcher where required.

### 6.6 Access Control Flow

Before any application data, document metadata, document content, messages, or audit records are returned, the Identity Adapter verifies the user identity and the Access Control Service checks the user role. Admin staff receive document metadata only, committee members may access full document contents, and researchers receive limited status and notification information.

---

## 7. Architecture Justification

The proposed design uses a three-tier architecture with a presentation layer, application layer, and data layer. This structure separates the user interface from business logic and persistent storage, making the system easier to understand, test, and maintain.

Within the application layer, a modular monolith is preferred over microservices. The REMS administrative workflow has several closely related responsibilities, including application status management, document metadata handling, checklist validation, audit logging, notifications, and deadline tracking. Keeping these responsibilities inside one deployable backend reduces operational complexity while still allowing clear separation between internal modules.

Microservices were not selected because the expected system slice does not require independently deployed services, and using microservices would introduce extra complexity in service communication, distributed authentication, data consistency, and deployment. A modular monolith is more suitable for this university workflow system because it supports strong access control, consistent audit logging, and simpler transaction handling.

The architecture is also shaped by the confidentiality requirements from Phase 1. All access to documents, metadata, messages, and audit records passes through identity and access-control checks. This supports the rule that administrative staff may view document metadata but not document contents, while committee members have broader access for review purposes.

---

## 8. System Boundary and External Systems

### Inside REMS

The following components are part of the REMS system boundary:

- Researcher Portal
- Admin Dashboard
- Committee Portal
- API Gateway / Backend API Layer
- Identity Adapter
- Access Control Service
- Application Service
- Document Service
- Completeness Check Service
- Notification Service
- Audit Service
- Scheduler / Deadline Service
- Application Database
- Document Storage
- Audit Log Storage

### External to REMS

The following systems are outside the REMS boundary:

- University Identity Provider / Single Sign-On system
- University Email Service
- Existing external risk assessment questionnaire, if the risk score remains generated outside REMS
- Ethics Committee internal reviewer allocation process

The committee reviewer allocation process is treated as outside the administrative workflow slice because Phase 1 clarified that administrative staff forward verified applications to the committee pipeline, but do not assign applications to individual committee members.

---

## 9. Diagram Legend for Architecture Sketch

The architecture block diagram should include a legend using the following meanings:

| Diagram element | Meaning |
|---|---|
| Rectangle | Internal REMS component or service |
| Cylinder | Data store |
| Dashed rectangle | External system outside REMS |
| Solid arrow | Request/response or direct data flow |
| Dashed arrow | Notification, scheduled event, or background process |
| System boundary box | Components controlled as part of REMS |

---

## 10. Questions / Feedback for Team

- Do we agree on modular monolith vs microservices?
- Are these components too detailed or appropriate for D1?
- Should API Gateway be included or simplified?
- Is Access Control separated enough?
