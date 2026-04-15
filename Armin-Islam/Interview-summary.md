Venue + date: Online, 08th April
Who attended: Group 10
Stakeholder role: Admin (Syed Gilani)


Q7 How are amendments or extensions to previously approved applications handled?

Response Summary

The stakeholder explained that once an application has been approved, researchers cannot modify it directly. If changes are required, such as adding new participant groups or updating documentation, the original approval remains valid only for the submitted information. Any new or updated information requires the researcher to submit a completely new application, which goes through the full approval process again.

Key Insights
Approved applications are immutable (cannot be edited)
Changes require a new application submission
The approval is tied strictly to the original documentation
There is no separate amendment workflow
Change in Understanding

Initially, it was unclear whether amendments would follow a simplified workflow or reuse the existing process. The interview clarified that amendments are treated as entirely new submissions rather than modifications of existing applications.

Refined Requirements
The system shall prevent modification of approved applications
The system shall require submission of a new application for any changes after approval
The system shall allow linking of new applications to previously approved ones
The system shall maintain visibility of previous approved versions for reference

Q8 What information must be kept confidential, and who should have access to different parts of an application?

Response Summary

The stakeholder explained that administrative staff can only view metadata, such as document titles, to verify correctness. The contents of application documents are accessible only to ethics committee members. Administrative staff and committee members can view administrative audit trails, but committee discussions remain restricted to committee members only. Researchers cannot view internal comments or discussions and are only informed of the final decision and, if rejected, a general reason.

Key Insights
Strict role-based access control is required
Admin staff have limited visibility (metadata only)
Committee members have full access to content and internal discussions
Internal committee discussions are confidential and restricted
Researchers have very limited visibility (decision only)
Change in Understanding

Initially, it was unclear how access was distributed across roles. The interview clarified that access is highly restricted and varies significantly depending on role and type of information, with strong separation between administrative and review responsibilities.

Refined Requirements
The system shall restrict document content access to ethics committee members only
The system shall allow administrative staff to view document metadata but not content
The system shall restrict committee discussions to committee members only
The system shall ensure researchers can only view final decisions and limited feedback
The system shall implement role-based access control with fine-grained permissions
