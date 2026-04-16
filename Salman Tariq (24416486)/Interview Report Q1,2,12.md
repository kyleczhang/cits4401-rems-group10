## 5.2 Interview Report

### 5.2.1 Interview Details

**Venue and Date:**  
The interview was conducted online via a virtual meeting platform during Week 6 of the semester.

**Attendance:**  
- **Interviewee:** Syed Gilani (acting as Administrative Staff stakeholder)  
- **Interviewers:**  
  - Salman Tariq  
  - Fahim Abrar  
  - Armin Islam  
  - Cheng Zhang  
  - Divyanshu Brijesh Singh  
  - Kalp Riteshkumar Prajapati  

**Stakeholder Role:**  
The interviewee represented the Administrative Staff, who are responsible for receiving applications, performing completeness checks, coordinating communication, and acting as intermediaries between researchers and the ethics committee.

---

### 5.2.2 Summary of Responses and Analysis

This section presents a structured analysis of selected interview questions (Q1, Q2, and Q12), including response summaries, key insights, and resulting refinements to system requirements.

---

### 5.2.3 Q1 – Application Verification Process

**Question:**  
Can you walk us through how the application verification process currently works, what you check to decide whether a submission is complete, and how you'd want that process to work in the new system?

**Response Summary:**  
The application verification process begins with researchers completing a risk assessment questionnaire on an external platform, which produces a numerical risk score. This score determines the category of the application and defines the required supporting documentation.

Administrative staff use this classification to verify completeness through a checklist-based approach. However, the process is highly fragmented, as documents are submitted and stored across multiple platforms, including email, SharePoint, and the existing system. Certain sensitive or time-limited documents cannot be uploaded due to system limitations, further increasing reliance on external tools.

As a result, administrative staff must manually locate, track, and link documents to their respective applications. If any required documents are missing, staff communicate with researchers via email to request additional information. The interviewee emphasised that the main challenge lies not in verifying completeness, but in managing and tracking documents across different systems.

**Key Insights:**
- Document requirements are dynamic and dependent on risk classification.
- Verification itself is simple and checklist-driven.
- The primary inefficiency arises from distributed document storage.
- Lack of centralised document management.

**Impact on Requirements and Refinements:**
- Support dynamic, risk-based document requirements.
- Centralised document repository.
- Support multiple file formats.
- Maintain clear linkage between documents and applications.

---

### 5.2.4 Q2 – Application Status Tracking

**Question:**  
How do you currently track the status of each application, and what challenges do you face with this process?

**Response Summary:**  
There is no centralised system for tracking application status. Administrative staff rely on email chains. Once forwarded to the ethics committee, visibility is lost. Updates occur only when the committee communicates back.

**Key Insights:**
- Tracking is informal and email-based.
- No lifecycle or dashboard exists.
- Admin acts as intermediary.

**Impact on Requirements and Refinements:**
- Define application lifecycle states.
- Implement dashboard for tracking.
- Enable visibility across all stages.
- Automate notifications.

---

### 5.2.5 Q12 – Reporting and Analytics Requirements

**Question:**  
Do you need to generate reports or summaries about applications?

**Response Summary:**  
Reporting is not currently required and is handled externally. However, it would be useful for planning and workload estimation.

**Key Insights:**
- Reporting not core requirement.
- No internal analytics capability.
- Future value recognised.

**Impact on Requirements and Refinements:**
- Treat reporting as future enhancement.
- Capture structured data for analytics.
- Enable export functionality.

---

### 5.2.6 Overall Observations

- System is fragmented and inefficient.
- Major issue is lack of centralisation.
- Admin acts as coordinator.
- Strong need for integrated system.
