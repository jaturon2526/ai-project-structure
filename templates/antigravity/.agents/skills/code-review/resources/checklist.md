# Code Review Checklist Reference

Use this checklist during step 2 of the code review workflow:

### 1. Correctness & Edge Cases
- [ ] Are null, undefined, or empty values handled properly?
- [ ] Are boundary conditions tested (0, negative numbers, max length)?
- [ ] Are async operations handled with proper awaits and error catching?
- [ ] Are race conditions possible?

### 2. Architecture & Design
- [ ] Does the code adhere to the single responsibility principle?
- [ ] Is business logic separated from presentation and transport layers?
- [ ] Are interfaces clean, minimal, and decoupled?
- [ ] Are there unnecessary dependencies introduced?

### 3. Security
- [ ] Are secrets, credentials, or private tokens completely absent from code?
- [ ] Are user inputs properly validated and sanitized?
- [ ] Are authorization checks performed before accessing sensitive resources?

### 4. Maintainability & Style
- [ ] Are variable, function, and file names clear and descriptive?
- [ ] Is dead or commented-out code removed?
- [ ] Is complex logic accompanied by concise explanatory comments?
- [ ] Are unit tests provided for newly added functionality?
