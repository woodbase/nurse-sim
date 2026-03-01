# Contributing to Nurse Sim

## Development Model

We use:
- GitHub Projects
- Epics as architecture boundaries
- Issues as implementation units

---

## Before Creating Code

1. Check Epic label.
2. Confirm architectural layer:
   - System
   - Procedure
   - UI
3. Follow folder structure strictly.

---

## Implementation Rules

- No monolithic scripts.
- Use state machines for procedures.
- Use signals.
- Keep methods small.
- Avoid refactoring unrelated code.

---

## Branch Strategy

feature/<short-description>
fix/<short-description>
refactor/<short-description>

---

## Commit Convention

Use Conventional Commits:

feat:
fix:
refactor:
docs:
chore:
