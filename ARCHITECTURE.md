# Nurse Sim – Architecture Overview

## High-Level Architecture

Nurse Sim follows a modular system architecture.

Core layers:

1. Core Engine Layer (Godot)
2. Systems Layer
3. Procedure Layer
4. UI Layer
5. Feedback & Scoring Layer

Each layer must be loosely coupled.

---

## Systems Layer

Located in:

res://systems/

Each system:
- Has its own folder
- Has one controller script
- Communicates via signals
- Is reusable

Examples:
- interaction_system
- procedure_system
- scoring_system
- feedback_system
- input_system

Systems must never directly depend on specific procedures.

---

## Procedure Layer

Located in:

res://procedures/

Each procedure:
- Own folder
- Own scene
- Own state machine
- Own configuration resource

Procedure logic must never live inside systems.

---

## Communication Rules

Use signals for:
- Interaction events
- State transitions
- Scoring events
- Feedback triggers

Never use deep node paths.
Never use tight coupling between systems.

---

## Scalability

Architecture must support:
- Mobile export
- Multiplayer supervisor mode
- AI patient behaviors
- Analytics export

No future feature should require rewriting core systems.
