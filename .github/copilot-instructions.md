# Nurse Sim – Copilot Instructions

## Project Overview
Nurse Sim is a 3D first-person clinical training simulator built in Godot 4.
The goal is to train nursing students in practical procedures such as:
- Peripheral IV insertion (PVK)
- Blood sampling
- Catheterization
- Drug preparation and dilution

The project is structured for scalability and future mobile deployment.

---

## Tech Stack
- Engine: Godot 4.x
- Language: GDScript
- Target: Desktop first, mobile-ready architecture
- Version control: GitHub
- Agile workflow: GitHub Projects with Epics (labels)

---

## Architecture Principles

- Modular design
- One system per scene where possible
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
