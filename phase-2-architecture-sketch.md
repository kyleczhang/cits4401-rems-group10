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

[TODO] Add use-case-to-component mapping

## 1.6 Non-Functional Requirements that Most Shaped the Design

[TODO] Add NFRs that most shaped the design
