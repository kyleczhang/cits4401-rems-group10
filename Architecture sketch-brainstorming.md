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

## 5. Questions / Feedback for Team

- Do we agree on modular monolith vs microservices?
- Are these components too detailed or appropriate for D1?
- Should API Gateway be included or simplified?
- Is Access Control separated enough?
