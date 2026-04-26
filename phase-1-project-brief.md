# CITS4401 Software Requirements & Design Group Project Phase 1

## 1 Introduction

You are part of a consultancy team that has successfully won a contract to design and develop a new **Research Ethics Management System (REMS)** for the University of East Angria.

The university currently relies on a collection of disparate, ad hoc systems and manual processes to manage research ethics applications, approvals, and oversight. These systems are inconsistent, inefficient, and difficult to maintain. Your team has been engaged to carry out an initial **requirements engineering phase**. This provides you with an opportunity to apply techniques covered in class.

## 3 Phase 1 – Requirements Engineering

### 3.1 Deliverables Requirements

Ensure that your group number is clearly displayed on the first page or coversheet of every deliverable. Ensure you also list the name, student number, and GitHub (or other VC hosting service) username of each student.

All documents must be clearly structured and presented, and the report should contain numbered headings, with informative heading titles.

If you had to make any reasonable assumptions in order to complete tasks needed for the deliverable, ensure you state what they were.

### 3.2 REMS Scenario

Please take the time to read the following scenario carefully.

The main source of additional information/clarification will be the elicitation interview you conduct. But you may post additional requests for clarification to the discussion forum so that all students can remain equally informed:

- Teaching staff may provide an answer; may ask you to consider the problem as a group, come up with plausible assumptions/decisions, and share these on the forum; or may say that this is a matter for your group to decide (documenting any assumptions made in your report).
- In general, any requests for clarification must be submitted to the forum at least 1 week before the final deadline. So make sure you plan ahead, and try to identify ambiguities or inconsistencies early – if you ask about them less than a week before the deadline, we may say that all available information has been provided, and you must use your best judgement to resolve any remaining issues.

#### 3.2.1 University of East Angria REMS

The University of East Angria has staff and students who conduct research in the sciences, engineering, social sciences, and humanities. All research at the university involving human participants must undergo ethics review and approval before it can proceed.

At present, the university does not have a unified system to support this process. Instead, ethics applications are handled through a patchwork of tools and practices that have evolved over time. Researchers typically complete application forms as documents, which are then submitted via email.

Supporting materials (such as consent forms, information sheets, or risk assessments) are often attached separately or stored in shared folders. Administrative staff track applications using spreadsheets, while committee members may maintain their own notes or annotations independently. Communication about applications – such as requests for clarification or decisions – is conducted via email or informal channels.

This fragmented approach has resulted in inconsistent document versioning, and lack of clarity as to which version of a document is authoritative. Committee members report that obtaining copies of and reviewing materials can be cumbersome, as documents are distributed across multiple systems. Researchers have expressed frustration at delays and a lack of transparency in the process. Administrative staff have stated that it is difficult to track the status of an application.

The university has therefore initiated a project to design a single unified **Research Ethics Management System (REMS)**. The goal is to support the submission, review, approval, and ongoing management of research ethics applications within a single coherent system. Your team works for a consulting company which won the tender for designing and implementing the new system.

Early meetings with university representatives have identified several key groups who may be affected by the system. These include researchers (Honours, Masters, and PhD students, as well as academic staff), members of the university Ethics Committee (which is reconstituted periodically), and study participants (whose data and welfare are central to the ethics process). It is expected that further relevant groups may emerge as the project progresses.

At the university, a research activity refers to a study, experiment, or project that requires ethics approval. From initial interviews, the following points were noted:

- Each research activity must have a clearly identified principal researcher, who is responsible for the application and ongoing compliance
- Research activities may involve multiple team members, whose roles and responsibilities should be recorded
- Applications must include a description of the research, its methodology, and any risks to participants
- Supporting documentation is required, although the exact set of required documents may vary depending on the nature of the research

Sometimes, amendments or extensions to previously approved applications may be required, due to changes in the study.

The ethics approval process for research activities involves several stages:

- Submission of an application by the researcher
- Administrative checks for completeness
- Assignment of the application to one or more committee members for initial review
- Possible requests for clarification or revision
- A decision by the ethics committee (e.g. approval, conditional approval, or rejection)

Committee members note that the review process may involve discussion among reviewers. The exact workflow can vary depending on the complexity and perceived risk of the research activity.

Several constraints were highlighted during initial discussions:

- Access to the system must be controlled through authentication
- Information contained in applications is sensitive and must be kept confidential
- Supporting documents should support versioning, so that changes over time can be tracked
- The system should maintain an audit trail of actions taken (e.g. submissions, reviews, decisions, and modifications)

Committee members also raised the issue of conflicts of interest. It was noted that:

- Ethics committee members should be informed of the members of a research team in advance of reviewing applications
- Committee members must be able to declare and manage conflicts of interest, including recusing themselves from particular reviews

#### 3.2.2 Project Context

The REMS project is currently in its early stages. The information above has been gathered from preliminary meetings and interviews. These discussions have provided an initial understanding of the problem space, but may not be complete or authoritative.

Further elicitation, clarification, and analysis will be required to:

- Identify stakeholders
- Refine and validate requirements
- Resolve ambiguities and inconsistencies, and
- Propose a coherent architecture and system design

Students are expected to build on this initial scenario, engaging in further requirements elicitation and developing appropriate models and design artifacts for the proposed system.

## 4 Phase 1 Tasks

### 4.1 Project Setup and Team Organisation

You should agree on the following details, and record them in a Collaboration & Workflow Plan:

- Team Communication & Responsibilities
    - How will the group communicate throughout the project? What will be the frequency of meetings (e.g., weekly; fortnightly; as needed) and the meeting format (e.g., face-to-face; online via video calls or chat platforms)? Are there any preferred communication tools (e.g., Discord, Slack, MS Teams, email)?
    - How will the group ensure accountability and track progress? Will you assign any initial roles?
- Version Control Strategy
    - Specify where the project’s documents will be hosted (e.g., GitHub, GitLab, Bitbucket).
    - How will you handle merging members’ contributions?
    - If you’re familiar with version control branching strategies, will you adopt any particular strategy or workflow? (e.g., feature branches, main/dev workflow)
    - Identify any version control policies (e.g., commit message conventions, review/approval process before merging).
- Risk Management & Quality Assurance
    - Outline potential risks to the project and how they will be mitigated. (You may wish to think about resourcing risks – e.g. member illness, service outage – as well as technical and operational risks.)
    - Describe how document quality will be maintained. Will you perform internal peer reviews? Will you adopt any standard templates or pro formas?
- Optional – group name
    - Nominate a name for your group – less than 20 characters, may be multiple words. Pronounceable, workplace friendly, and no embedded HTML tags or SQL commands, please.

This document is not a deliverable, but must be made available to staff on request (e.g. to clarify expectations). We will ask you to reflect on how useful your plan was in week 12, when peer evaluations are done.

### 4.2 Version Control and Effort Tracking

As a first step, your group should establish a private version-controlled repository (e.g. on GitHub).

Your group should maintain your documents and other work in version control. You should create a private Git repository (hosted on a service such as GitHub, GitLab, or BitBucket) containing planning documents and deliverables for your project.

We recommend you also keep:

- a shared spreadsheet (either in the repository, or on MS Teams or Google Docs) tracking tasks allocated to and completed by members each week.

Neither the repository nor spreadsheet are submitted for assessment, but your facilitator or the Unit Coordinator may ask to see them (for instance, to clarify contributions made by group members).

Tips:

- When storing your documents in version control, you’re best using a plain text format (such as Markdown, LaTeX, CSV, RTF, or flat Office formats). Your final deliverable, however, should be a PDF generated from that plain text format.
- Version control systems do a poor job of tracking changes to binary formats such as .pptx (PowerPoint), .xslx (Excel), or PDF.
- In general, best practice is to keep in version control the source text or code your binary artifacts are derived from, but not the binary artifacts themselves. (Exception: you may want to store a binary copy of the final submitted version.)

Your repository is not a deliverable, but must be made available to staff on request (e.g. to clarify contributions).

### 4.3 Stakeholder Identification and User Stories (3 marks)

From the REMS scenario, identify a set of relevant stakeholders.

1. For each stakeholder, briefly (at most a few sentences) describe the stakeholder’s roles. What value will this stakeholder get from the system, or what interest do they have?
2. Develop a set of user stories capturing the needs of several stakeholders. We recommend no more than 8 user stories, and 2-3 stakeholders.

Focus on covering different perspectives and ensuring you’ve identified all relevant stakeholders.

### 4.4 Elicitation Interview (6 marks)

Your group will select one stakeholder for deeper investigation. You will:

- Identify and justify a set of **interview questions**
    - Each question should address a specific uncertainty, assumption, or gap in understanding
    - Explain what that uncertainty, etc., is, and how the answers to each question will help refine requirements. If the problem is an ambiguity - describe the two (or more) interpretations which could be placed on it.
    - The questions should all relate to system behaviour or constraints relevant to the stakeholder you have chosen.
- Conduct a **mock interview**
    - The interviewee will be a staff member acting in the stakeholder role
- Produce an interview report, including:
    - Venue and date: where and when was the meeting held?
    - Attendance: who was in attendance? Who was the interviewee, and what was their stakeholder role?
    - Responses: a summary of responses to questions
    - For each question: key insights gained, how your understanding changed, and resulting refinements to requirements or assumptions. (You may choose to group multiple questions together for convenience, but should address all points.)

Your set of interview questions (including justifications and impact) must be submitted via Moodle by 11:59 pm, Thursday 26 March (week 5). You will have 15 to 20 minutes to meet with your stakeholder representative, ask questions, and record their answers, so make sure you plan your time – is the number of questions you have proposed feasible?

Your interview will be conducted in week 6 or during the mid-semester study break.

Your interview report will be included in your phase 1 report, submitted in week 7.

### 4.5 Requirements Specification (3 marks)

Based on your earlier work:

- Select a subset of system functionality (e.g. functionality relevant to your chosen stakeholder, or a clearly defined subsystem). If unsure, you should check with your workshop facilitator whether the scope you have chosen is an appropriate size.
- Write a detailed set of requirements for that subset. Requirements should be:
    - clear and unambiguous
    - testable/verifiable
    - consistently structured
    - uniquely identified

For each requirement, state whether it is a functional or non-functional requirement.

### 4.6 Use Case Modelling (3 marks)

You will model part of the system using use cases - you will produce a **use case diagram**, and one **detailed use case description**. Your modelling should align with your requirements and chosen system subset.

1. Produce a **use case diagram**:
    - It should cover your chosen subset of system functionality.
    - It should include, at a minimum, two actors.

Your diagram should provide clear guidance to a reader as to what the system functionality is, and what actors are involved.

1. Write **one detailed use case description**:
    - Include a main success scenario
    - Include at least two alternative or exceptional flows.

## 5 Deliverables

### 5.1 Interview Questions Document

This is a short document containing proposed interview questions and a justification for each question.

This will be reviewed by your workshop facilitator before the interview takes place.

### 5.2 Phase 1 Report

Submit a single PDF document containing your:

- stakeholder descriptions
- user stories
- interview report
- requirements
- use case diagram
- detailed use case description

There is no maximum or minimum length for the report.
