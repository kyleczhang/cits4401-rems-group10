# CITS3301/4401 Software Requirements & Design Project Phase 2: System Design

## 1. Overview

In Phase 1 of the group project, your group carried out requirements engineering for a subset of a new Research Ethics Management System (REMS) for a client: you analysed stakeholders, identified use cases, and wrote precise, testable requirements. We call this chosen subset your system slice.

Phase 2 builds on that foundation. Your task is to produce a design document showing how a system could be built to implement your system slice. This is not a full implementation – rather, it is a reasoned, concrete proposal that another team of engineers could evaluate and build from.

At the end of Phase 2, each group will participate in a “live critique” session. Your group will in turn act as a **Design Team** (presenting and defending your own design), as well as receiving another group’s work and acting as a **Review Team** (critically evaluating another group’s design).

## 2. Project Rules

Refer to the Phase 1 project brief for project rules – these apply to Phase 2 as well. Phase 2 is marked out of 15, and is worth 15% of your final grade.

## 3. Deliverables and Timeline

The deliverables for Phase 2 of the project are:

- Design report – 8 marks
    - Architecture sketch milestone (required, unassessed)
- Live critique
    - Walkthrough at a live critique (acting as Design team) – 3 marks
    - Critical review at a live critique (acting as Review team) – 2 marks
    - Brief critique writeup (acting as Review team) – 2 marks

The table below shows the due dates:

| Week | Activity                       | Due date                 |
| ---- | ------------------------------ | ------------------------ |
| 9    | Milestone: architecture sketch | 11:59 pm, Thurs 30 April |
| 11   | Design report                  | 11:59 pm, Thurs 14 May   |
| 12   | Live critique sessions         | Week 12 sessions         |
|      | Critique write-up              | 11:59 pm, Sun 24 May     |

## 4. Deliverables Requirements

Refer to section 3.1 “Deliverables requirements” from the Phase 1 project brief for details of how documents should be presented.

In addition, for Phase 2, your documents should contain references for architectures, significant concepts, or technologies that your design makes use of. You need to ensure that it is clear to a reader what your intended meaning is, and where they can locate more information on the particular term. For products or software packages (e.g. “Relational Database System X”), a hyperlink to the product home page is sufficient; for anything else, a reference should be given. (You may use a referencing method of your choosing, as long as it is consistent throughout – see “Referencing Requirements” in the Unit Outline for more details.)

## 5. Milestone: Architecture Sketch

By the due date in week 9, submit a brief written description of the proposed system architecture for your REMS system slice, accompanied by a draft block diagram of the major components (max 1 page of text, plus a diagram). This does not need to be polished – its purpose is to catch major misunderstandings early and give you a stable foundation before you work on other sections.

Submit your architecture sketch as a single PDF file via Moodle. Only one student from each group may make a submission.

This milestone is required, but does not receive a separate mark – after brief feedback from your facilitator, we expect that your revised architecture will be incorporated into your design report.

## 6. The Design Report

Your report should contain the sections D1–D6 described below, in the order listed. The order is also a suggested general working sequence: your architecture (D1) will shape your data model (D2), your scenarios (D3) depend on both, and your interface sketches (D4) follow from your component structure. Technology choices (D5) and assumptions (D6) can be developed in parallel with earlier sections. We envisage that you will add to the “Assumptions” section as you progress through the project, as you’ll need to make references to particular assumptions from earlier sections. We recommend you review sections D5–D6 once the architecture is stable.

- Aim for concision and clarity over length. A focused two-paragraph explanation of a design decision is more valuable than a long one that buries the key point. The final report should be no more than 10 pages of text, but diagrams, tables and cover-sheets do not count toward the length limit, and you are encouraged to make use of tables and diagrams throughout.
- As long as diagrams are clear and legible, no particular tool is required to be used to make them. Some suggestions are:
    - draw.io is good for groups who want fine control over layout.
    - PlantUML or Mermaid are good for groups who prefer to generate diagrams from version-controlled text.

All diagrams must have a caption. They must be referenced and explained from the main text – it is not permissible to include diagrams without explaining them.

All diagrams must include a legend. If your diagram is a standard UML diagram type, adheres to the UML standard, and uses standard icons, then no legend is necessary and it may be omitted. But block diagrams (for instance) are not a standard UML diagram type; therefore, a legend is compulsory for the architecture block diagram.

Submit your report by the due date as a PDF file via Moodle. Only one student from each group may make a submission.

### 6.1. Section D1: System Architecture

Provide an overview of the major components in your proposed system, their responsibilities, and the boundaries and dependencies between them.

Your section should include:

- A **block diagram** showing the major components and their relationships.
- A brief description of each component and its responsibilities.
- An explanation of the major data flows between components – what data is transferred, between which components, in which direction, and why.
- A mapping (even a simple table is fine) of your major components to the **use cases** in your system slice, answering: *Which part of the system handles which user-facing responsibilities?*
- A discussion of which non-functional requirements (NFRs) from Phase 1 most constrain your design, and how your architecture addresses them. Rather than working through every single NFR in turn, focus on the ones that most shaped your decisions.

Ensure you justify your choices. You should be able to explain why you chose this architecture over plausible alternatives, why you allocated responsibilities as you did, and why you separated (or combined) particular concerns.

The review team will ask: *does this system hang together? Does the architecture address the NFRs?*

### 6.2. Section D2: Data Model

Identify the core entities in your system, the relationships between them, and any important invariants or constraints on the data. Your section should provide and explain:

- A description of the core entities and a diagram (e.g. a class diagram).
- Key relationships between entities, including cardinality where relevant.
- Important invariants or constraints – rules the data must always satisfy (e.g. for a product and service ordering system, these might be rules like “an order must have at least one line item”, “a booking cannot overlap another booking for the same resource”).

Your data model should be consistent with your architecture. Provide a mapping (e.g. as a table) which shows, for each entity, which component from Section D1 contains that entity.

The review team will ask: *does the data model seem consistent with the architecture and with the requirements?*

### 6.3. Section D3: Critical Scenarios

Provide two detailed **traces** through your system, showing how your proposed components collaborate to handle a specific situation. These go beyond a use case description: where a use case records what a user and system do, a scenario trace shows how the internal components handle it.

**Scenario 1** should cover a normal, successful flow for one of the most important use cases in your system slice.

**Scenario 2** should cover an exceptional, failure, or security-relevant flow (e.g. an invalid input, a failed external call, an unauthorised access attempt, a concurrency issue).

The scenarios should be taken from the detailed use case description contained in the “Use case modelling” section of your Phase 1 report.

Each scenario should include:

- A brief statement of the situation and the use case and requirements it exercises.
- Accompanying prose explaining the steps, any significant decisions made within components, and how the system responds to the situation.
- A diagram showing the components involved and the messages exchanged. (A sequence diagram or diagrams will usually be the simplest way to depict this, but you may choose some other sort if you wish.)

The review team will ask: *could this actually work in practice? Is the design consistent with what the walkthrough shows?*

### 6.4. Section D4: Key Interface Sketches

Describe the three most critical interactions between components in your system – that is, the interactions whose design most affects whether the system will work correctly.

For each interaction, sketch the **shape** of the data exchanged: what information must be passed in, and what comes back? You are not required to specify a communication mechanism (HTTP, message queue, method call, etc.), though you may note your intentions. We are interested in the structure of the data, not the channel.

You may use any syntax that expresses this clearly. One natural approach is to describe the interaction in terms of the classes or records involved – what fields do they have, and of what types? Java-style class or method sketches are fine; so is a table, a structured prose description, UML class fragments, or any other notation you find clearer.

For each interaction, briefly explain why this interface is designed this way – what alternatives you considered, and what this design makes easy or hard.

The interfaces should be consistent with the data model from Section D2 of your report, and the traces from Section D3.

The review team will ask: *can these components actually interact? Is the interface consistent with the data model and the scenarios?*

### 6.5. Section D5: Technology Choices

Identify and justify the key technology decisions your design depends on. At minimum, address:

- **Persistence**: how and where will data be stored? (e.g. relational database, NoSQL store, file system – and which specific technology, if decided.)
- **Authentication**: how will users be identified and their access controlled?
- **External integrations**: if your system slice depends on any external services, identify them and explain how you plan to integrate.

For each choice, explain:

- What you chose and why.
- What assumptions the choice rests on (e.g. “we assume the organisation already has an Active Directory instance”).
- What constraints or consequences flow from the choice – what does it make easier, harder, or impossible?

You should include cross-references to named assumptions from Section D6.

The review team will ask: *are these choices feasible? What could go wrong if the assumptions don’t hold?*

### 6.6. Section D6: Assumptions and Boundaries

In this section, you address the scope of your design and any assumptions required for it to work.

**Design assumptions**

Explicitly state the assumptions your design depends on. These might include:

- Expected scale or load (e.g. number of concurrent users, data volumes).
- Assumptions about user behaviour or environment.
- Assumptions about external service availability or reliability.
- Assumptions about the organisation’s existing infrastructure (e.g. whether an SSO solution exists, whether a particular platform is already in use).
- Trust and security assumptions (e.g. which actors are trusted, what threat model you are designing against).

Each assumption should be given a unique ID (e.g. A1, A2, etc.), for easy reference from other sections of your report.

**System boundaries**

Clearly state what your proposed implementation does not handle – functionality that is out of scope, delegated to external systems, or deferred to a later iteration. Where you delegate to an external system, identify which system and why.

This section is not an afterthought: making assumptions explicit is a core part of system design. A design whose assumptions are unstated is harder to evaluate and harder to build.

The review team will ask: *what in this system might break if reality differs from these assumptions?*

## 7. The Live Critique

In Week 12, each group will participate in a live critique session. Each session involves one **design team** (the designers) and one **review team** (the evaluators), moderated by a facilitator. Each group will take on both these roles in turn, and group pairings are assigned randomly.

Further details will be provided closer to the date, but in brief:

- Each session runs for at most 20 mins
- The design team should explain their architecture (very briefly), then focus on the critical scenarios for the bulk of the time. They should prepare to briefly discuss 1–2 key design decisions at the end, time permitting.
- This is not a presentation, but rather a technical discussion – so slides are not required. Instead, the design team may prepare short handouts (2 pages max) to focus discussion. Brief slides, to support the discussion, are permitted if your venue supports displaying them.

### 7.1. Design Team: the Design Walkthrough

The design team presents their design. This is not a formal presentation – it is a structured explanation and discussion. The review team may ask questions throughout.

You should be prepared to:

- Explain and justify your design decisions, not just describe them.
- Walk through your critical scenarios in detail.
- Respond to challenges concretely. “We considered that, and decided X because Y” is a strong response; “we didn’t think of that” is a useful one; vague reassurances (“it should work in practice!”) are not.

### 7.2. Review Team: the Critique

The review team’s role is to critically evaluate the design team’s design for realism and consistency. A separate checklist document will be provided to guide your assessment.

**Prior to the session**, the review team must demonstrate to their facilitator that they have read the design team’s report and completed a preliminary assessment against the checklist. Your facilitator will specify how and when they wish to receive this, but typically it will be by email, and must be sent by 9 am of the day of the session.

During the session, aim for critique that is specific and concrete. “This component seems to have too many responsibilities – it handles both authentication and data access, which could make it hard to test and change” is useful feedback. “This won’t scale” or “this seems too complicated” without elaboration is not.

### 7.3. Facilitator Role

The facilitator will:

- Ensure each relevant aspect of the design receives attention.
- Keep time and move discussion along if a single issue runs too long.
- Prompt the review team if the critique stalls.
- Encourage concrete, specific critique.

The facilitator will not adjudicate technical disagreements, however.

### 7.4. After the Session

In your capacity as **Review team** submit your completed checklist and any written notes as part of your review team deliverable, by the deadline specified in section 3 of this project brief.

Submit your notes by the due date as a PDF file via Moodle. Only one student from each group may make a submission.

## 8. Assessment

Phase 2 is worth 15 marks in total. Because each group acts as both design team and review team, marks are awarded for both roles.

In brief, the basis for assessment is:

**Design report (8 marks)**

The report will be assessed on the clarity and strength of justification of design decisions, internal consistency across sections, coverage of the system slice requirements, and quality of diagrams and scenarios.

**Design team live walkthrough (3 marks)**

Assessed on the group’s ability to present clearly, and engage with critique concretely and thoughtfully during the session – not on whether their design is perfect, but on how well they understand and can defend it.

**Review team (2 + 2 marks)**

Assessed on the quality and specificity of the critique: whether it engages with the actual design, raises substantive issues, and is concrete rather than vague.

To receive a mark for the project, your group must submit/complete all deliverables:

- Architecture sketch milestone
- Design report
- Walkthrough at a live critique
- Critical review at a live critique
- Brief critique writeup

In general, a group won’t be permitted to submit a later deliverable, unless and until they have submitted all earlier deliverables.

## 9. Suggested Section Lengths

Below are some guidelines on suggested section lengths for the design report:

- Section D1 (System Architecture): ~2–2.5 pages
- Section D2 (Data Model): ~1.5–2 pages
- Section D3 (Critical Scenarios): ~2–3 pages total
- Section D4 (Key Interface Sketches): ~1–1.5 pages
- Section D5 (Technology Choices): ~1–1.5 pages
- Section D6 (Assumptions and Boundaries): ~0.5–1 page

(Note that your report still has to meet the overall length limitations; if you choose the maximum lengths for all the above sections, your report will go over.)

## 10. Tips

- Phase 1 asked what the system must do; Phase 2 asks how it will do it. If you find yourself writing “the system shall…”, you are probably still thinking in requirements mode.
- Describe components, not features: your architecture should be organised around components with clear responsibilities – not around user-visible features. Ask yourself: what does this component do, and what does it not do?
- Justify, don’t just describe. “We chose a three-tier architecture” is a description. “We chose architecture [X] over a monolith because our NFRs require independent scaling of the application layer” is a justification. Reviewers and markers will ask why you made the choices you did – and will probe into the reasons, to make sure they are plausible. You may want to look at the Academic Skills Centre guide on critical writing and arguments, here (PDF).
- Check consistency across sections before submitting. Your data model, architecture, and scenarios should be consistent and tell a coherent story. Assigning someone to check things like Do the scenarios use entities from the data model? Do the components match the architecture diagram? will help catch many avoidable errors.
