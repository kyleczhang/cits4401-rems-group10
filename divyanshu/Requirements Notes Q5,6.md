# Requirements Notes Q5,6

## Functional Requirement Ideas
- The system shall allow administrative staff to send requests to researchers for missing documents and record those requests against the application.
- The system shall allow Ethics Committee members to send clarification requests to researchers regarding document content.
- The system shall store all application-related communication within the application record.
- The system shall display the current status of an application to authorised users.
- The system shall provide researchers with clear guidance on required supporting documents before submission.
- The system shall validate whether all required documents have been uploaded before the application proceeds to the next stage.
- The system shall notify researchers when an application is returned for clarification or revision.

## Non-Functional Requirement Ideas
- The system shall enforce role-based access control so that administrative staff cannot view document contents unless explicitly authorised.
- The system shall keep communication records secure because application information is sensitive.
- The system should provide a clear and easy-to-understand interface for researchers to reduce confusion during submission.

## Requirement Analysis
The interview responses suggest that the new system should support structured communication between users rather than relying only on informal email chains. In particular, the system should allow administrative staff to contact researchers about missing or incomplete submissions and record those exchanges against the application. It should also allow Ethics Committee members to communicate directly with researchers when clarification is needed about the content of submitted documents. Keeping these communications within the system would improve traceability and make it easier to understand the history of each application.

The interview also highlighted the need for better submission guidance and clearer progress visibility. Since delays often occur when researchers are unsure about required documents, the system should provide clear instructions and checklist-based guidance before and during submission. It should also validate whether all required documents have been uploaded before the application proceeds further in the workflow. In addition, the system should display the current application status clearly so that researchers and staff can understand whether the case is still in submission review, under committee review, or awaiting clarification.

Role-based access control is another major requirement arising from these interview questions. Administrative staff should not be able to view sensitive document contents unless explicitly authorised, while committee members should be able to review the actual contents needed for ethical assessment. This separation reflects the current real-world workflow described in the interview and is necessary for confidentiality and proper handling of sensitive information.
