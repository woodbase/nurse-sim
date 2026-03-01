# Nurse Sim – Repository Instructions for Copilot Coding Agent

## 1. Project Vision

Nurse Sim is a 3D first-person clinical training simulator built in Godot 4.

Target audience:
- Nursing students
- Simulation training environments

Primary goal:
Create modular, realistic, expandable clinical procedure simulations.

Design priorities:
- Realism in workflow
- Clear pedagogical feedback
- Expandable system architecture
- Mobile-ready from day one
- Clean separation of systems

---

## 2. Tech Stack

- Engine: Godot 4.x
- Language: GDScript
- Rendering: 3D low poly
- Architecture: Modular systems
- Version Control: GitHub
- Agile: GitHub Projects with Epics (labels)

---

## 3. Core Architecture Rules (CRITICAL)

### 3.1 No Monolithic Scripts

Never create large god-classes.
Each responsibility must be separated.

### 3.2 Systems Must Be Modular

All major functionality belongs in systems:

res://systems/

Examples:
- procedure_system/
- interaction_system/
- scoring_system/
- feedback_system/
- input_system/

Each system:
- Own folder
- Own controller script
- Communicates via signals

---

## 4. Procedure Architecture (MANDATORY)

All clinical procedures MUST use a state machine.

Structure:

res://procedures/<procedure_name>/

Must contain:
- procedure scene
- state_machine.gd
- individual state scripts
- procedure_config resource

### State Rules

Each state:
- Has enter()
- Has exit()
- Has process(delta)
- Emits signals on completion

Never hardcode progression logic outside state machine.

---

## 5. Scene Structure Rules

3D Scenes:
- Player (CharacterBody3D)
- InteractionRay
- Environment
- ProcedureRoot

Never place heavy logic inside scene root.
Use controller scripts.

---

## 6. Interaction System Rules

All interactable objects:
- Must implement an `Interactable` interface pattern
- Must not directly modify procedure state
- Must emit signals

No direct node path dependencies.

Use dependency injection via exported variables.

---

## 7. Scoring & Feedback

Scoring:
- Must be separated from procedure logic
- Event-driven only
- No direct coupling

Feedback system:
- Visual
- Audio
- Text
- Future support for haptic (mobile-ready design)

---

## 8. Mobile-Ready Constraints

When writing code:
- Avoid desktop-only input
- Use abstracted input system
- Avoid performance-heavy loops
- Avoid excessive raycasts per frame

Assume future mobile export.

---

## 9. Folder Structure (Strict)

res://
- scenes/
- systems/
- procedures/
- scripts/
- ui/
- assets/
- resources/
- autoload/

Never mix systems and procedures.

---

## 10. When Implementing GitHub Issues

Copilot must:

1. Respect Epic label.
2. Identify if issue belongs to:
   - System
   - Procedure
   - UI
   - Core architecture
3. Create files in correct folders.
4. Follow state machine pattern if procedure.
5. Avoid refactoring unrelated code.
6. Keep commits minimal and scoped.

---

## 11. Code Style

- Descriptive variable names
- No magic numbers
- Use exported variables
- Document public functions
- Small focused methods
- Use signals over direct references

---

## 12. Commit Convention

Use Conventional Commits:

- feat:
- fix:
- refactor:
- docs:
- chore:

Example:
feat: add IV insertion state machine
fix: correct interaction ray collision mask

---

## 13. Performance Guidelines

- Avoid per-frame allocations
- Cache references
- Use signals over polling
- Reuse scenes when possible
- Avoid expensive physics checks per frame

---

## 14. Expansion Strategy

Future planned features:
- Multiplayer supervision mode
- AI patient reactions
- Dynamic complication system
- Assessment mode vs Practice mode
- Analytics export

Architecture must allow these without rewrites.

---

## 15. Absolute Prohibitions

Copilot must NOT:

- Hardcode node paths
- Create circular dependencies
- Mix UI and gameplay logic
- Bypass state machines for procedures
- Create monolithic manager classes- One system per scene where possible
- Use State Machines for procedures
- Avoid tightly coupled nodes
- Keep logic separate from UI
- Signals over direct node references

---

## Folder Structure

res://
- scenes/
- scripts/
- systems/
- assets/
- ui/
- procedures/

Each procedure should:
- Have its own scene
- Have its own state machine script
- Be reusable

---

## Coding Standards

- Use descriptive variable names
- Keep functions short and single-purpose
- Comment complex logic
- Avoid hardcoding values
- Use exported variables for configuration

---

## When Implementing Issues

When implementing an issue:
1. Follow the folder structure.
2. Create new scenes in `scenes/`.
3. Create related scripts in `scripts/`.
4. If the issue is part of an Epic, respect that Epic's architectural intent.
5. Keep code clean and production-ready.

---

## Design Goals

- Realistic but performant (low poly style)
- Expandable to multiplayer in future
- Clean separation between:
  - Gameplay
  - Procedure logic
  - Scoring system
  - Feedback system
 
  - ## Commit Style

Use conventional commits:
- feat:
- fix:
- refactor:
- docs:
