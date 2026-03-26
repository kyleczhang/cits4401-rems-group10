# Interview Questions Document

**Group Number:** 10

## 1. Selected Stakeholder

**Stakeholder:** Administrative Staff

**Rationale for selection:** Administrative staff are involved in every stage of the ethics application workflow: checking submissions, assigning reviewers, coordinating communication, and tracking decisions. The project scenario explicitly identifies their difficulty tracking application status as a key driver for the REMS. Interviewing them offers the best opportunity to explore the system from an operational perspective and define detailed workflow-related requirements.

---

## 2. Interview Questions

### Q1. Can you walk us through how the application verification process currently works, what you check to decide whether a submission is complete, and how you'd want that process to work in the new system?

**Justification:**
We know admin staff perform completeness checks, but we have two related gaps here. First, we don't know what “complete” actually means in practice. It could be a fixed checklist that applies to every application, or the criteria might differ by research type. For example, a clinical study probably needs different documents than an online survey. Second, we don't know how the verification is actually carried out right now, whether it's a manual scan through emails, a spreadsheet, or something else. Asking how they'd like it to work in the new system also surfaces expectations we might not think to ask about directly. This is intentionally a broad question that can turn into a longer discussion, but that's the point, from a single answer you get a clear picture of what admin staff actually want out of the new system.

**Impact on requirements:**
If the completeness criteria are fixed, a simple automated validator would cover it. If they vary by research type, the system needs configurable per-category checklists, and that's a much bigger feature to build. Understanding the current process tells us what pain points to address, and the “how would you like it” part may reveal preferences around automation or notifications, for example whether the system should flag missing items to the researcher automatically or whether staff prefer to review and send that feedback themselves.

---

### Q2. How do you currently track the status of each application, and what challenges do you face with this process?

**Justification:**
Difficulty tracking application status is cited as one of the main reasons for building the REMS, so this is a core question. Right now we only have a rough picture of the workflow (submitted → checked → assigned → reviewed → decided), but the real process is probably more nuanced. For instance, we don't know whether “returned for revision” is treated differently from “rejected,” or whether “conditionally approved” is a distinct state that needs ongoing monitoring.

**Impact on requirements:**
Getting the full list of statuses right is fundamental, because missing even one means staff could lose track of applications at that stage. The answer will also tell us when automatic notifications should fire, and what a useful status dashboard would actually show.

---

### Q3. What types of supporting documents do researchers typically submit, and how do you manage different versions of these documents?

**Justification:**
The brief mentions versioning problems and that required documents can vary, but gives no detail on either. We're not sure whether all applications require the same set of documents, or whether different research categories come with different requirements. We also don't know how versions are currently distinguished, whether staff rely on file names, email timestamps, or something else entirely.

**Impact on requirements:**
This shapes what the system needs to store for each document (type, version number, upload date, uploader), and whether document requirements need to be configurable by research category. It also determines whether old versions need to stay visible once a newer one is uploaded.

---

### Q4. How do you assign applications to committee reviewers — is it based on expertise, workload, availability, or something else?

**Justification:**
All we know is that applications get assigned to one or more committee members. We have no idea how that decision is actually made. It could be as simple as round-robin rotation, or staff might be trying to match reviewers to the subject area of the research, or they might just assign whoever has the lightest current load. Each of these would require different things from the system.

**Impact on requirements:**
If assignment is just manual and arbitrary, the system only needs a simple “assign reviewer” action. If expertise or workload matters, the system needs to store reviewer profiles and track current assignments. This question also touches on whether conflict-of-interest status needs to be visible before assignment happens.

---

### Q5. How do you communicate with researchers when clarifications or revisions are needed?

**Justification:**
Currently everything goes through email, but we don't know who sends what. When a clarification is needed, does admin staff write to the researcher, or does the relevant committee member do it directly? And how are responses tracked? Does anyone keep a record of what was asked and answered, or does it just sit in someone's inbox?

**Impact on requirements:**
If all researcher communication is routed through admin staff, the system needs a structured way for them to send and track requests. If committee members communicate directly, admin staff may just need visibility into those exchanges. Either way, these communications probably need to be attached to the application record for audit purposes.

---

### Q6. What are the most common reasons applications are delayed or returned to researchers?

**Justification:**
We know delays and frustration exist, but not what's causing them. Are applications usually returned because something was missing at submission? Are they held up waiting for a committee member to respond? Is there a bottleneck at a particular stage? Without knowing this, we'd be guessing at which features would actually help.

**Impact on requirements:**
Knowing where things tend to go wrong helps us prioritise. If most delays happen at submission (missing documents), better upfront validation is the priority. If delays are at the review stage, the focus should be on reminders and deadline tracking. This shapes both what gets built and in what order.

---

### Q7. How do you handle amendments or extensions to previously approved applications?

**Justification:**
Amendments are mentioned in the brief but with no description of what the process looks like. We don't know whether an amendment kicks off a full re-review identical to a new submission, or whether there's a lighter process where only the changed parts are looked at. These are quite different workflows.

**Impact on requirements:**
If amendments reuse the full workflow, we may just need a flag to distinguish them. If they go through a separate, faster process, that needs to be designed and built separately. We also need to know how an amendment should be linked to the original application, and whether the previously approved version stays visible.

---

### Q8. What information must be kept confidential, and who should have access to which parts of an application?

**Justification:**
The brief says application data is sensitive, but doesn't spell out the boundaries. We don't know whether a reviewer can see the whole application or only their assigned section, whether admin staff can read committee discussions, or whether researchers can see reviewer comments before a decision is made. These distinctions matter a lot for access control.

**Impact on requirements:**
This defines the role-based access model, specifically what each role can read, edit, or download. Depending on the answer, we may need fairly fine-grained controls (e.g., hiding certain fields from certain roles), which affects both the data model and the authentication layer.

---

### Q9. How do you identify or manage conflicts of interest before assigning reviewers?

**Justification:**
We know committee members can declare conflicts and recuse themselves, but we don't know what role admin staff play in that. Do they proactively check for conflicts before assigning, or do they wait for a committee member to flag it? And when a conflict is declared, is it the admin's job to find a replacement reviewer, or does that happen automatically?

**Impact on requirements:**
This determines how conflict management fits into the assignment workflow. If staff need to act on conflict declarations, the system needs to surface them clearly and probably prevent assignment until they're resolved. If it's mostly self-managed by committee members, the admin side might just need a notification.

---

### Q10. Which parts of your current workflow are the most time-consuming or error-prone?

**Justification:**
We have a general sense that the current process is inefficient, but we don't know where the real pain points are. Chasing researchers for missing documents, manually updating spreadsheets, forwarding emails, coordinating reviewer schedules, any of these could be the biggest drain on time. We want to make sure the system addresses the most impactful problems first.

**Impact on requirements:**
Knowing which tasks hurt the most helps us decide what to automate early. It also helps set the scope for an initial version of the system, rather than trying to solve everything at once.

---

### Q11. Are there any deadlines or time limits for processing applications at different stages?

**Justification:**
The brief doesn't mention any time constraints, but many universities have formal turnaround requirements for ethics applications, sometimes set internally and sometimes driven by external regulation. We don't know whether any such rules exist here, and if they do, whether staff are currently expected to track and enforce them.

**Impact on requirements:**
If deadlines exist, the system needs to track them per stage and send reminders when they're approaching or missed. If there are no formal deadlines, this whole feature area can be left out of scope, which would simplify things considerably.

---

### Q12. Do you need to generate reports or summaries about applications — such as approval rates, processing times, or outstanding items?

**Justification:**
Reporting isn't mentioned anywhere in the brief, but in practice, management almost always wants some visibility into how a system is performing. From an industry standpoint, reporting tends to be one of the first things stakeholders ask for once a system goes live, such as how many applications are pending, what the average turnaround time is, or how many were rejected. We want to find out early whether that expectation exists here, rather than discovering it late in the project.

**Impact on requirements:**
If reporting is needed, the system needs to support filtered views, aggregate counts, and probably some kind of export (CSV or PDF). That also affects what data needs to be retained and in what form. Even if formal reporting isn't required right now, confirming it with the interviewee gives us grounds to recommend it as a feature worth considering.

---

## 3. Assumptions

- It is assumed that administrative staff have day-to-day operational familiarity with the entire application lifecycle, from receipt to decision communication.
- It is assumed that the interviewee is a single representative of the administrative staff role; where individual variation may exist, the most common or formalised practices will be targeted.
