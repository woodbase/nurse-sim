# Nurse Sim – PVK Technical Demo (Vertical Slice v0.1)

## Objective

Implement a playable PVK Technical Training demo in Godot.

Scope is intentionally limited to:
- One procedure (PVK)
- One room
- One inventory tray
- Step-by-step validation
- Simple aseptic tracking
- Final feedback screen

No RPG elements.
No generic engine required.
Code must be structured for future refactor.

---

# 1. Project Structure

The following folder structure must be used:

res://
  scenes/
    pvk_room.tscn
    technical_ui.tscn
    feedback_screen.tscn

  systems/
    inventory_system.gd
    procedure_controller.gd

  procedures/
    pvk_data.gd

---

# 2. Inventory System

## Purpose
Handle drag-and-drop items into tray.

## Requirements

Create:

class_name InventorySystem

### Properties

- tray_items : Array
- required_items : Array

### InventoryItem

class_name InventoryItem

Properties:
- item_name : String
- sterile : bool

### Required Functions

func add_item_to_tray(item: InventoryItem)
func remove_item_from_tray(item: InventoryItem)
func validate_tray() -> bool
func get_missing_items() -> Array

### Behavior

validate_tray must:
- Return false if any required item missing
- Ignore extra items (for demo)

---

# 3. PVK Data Definition

File: procedures/pvk_data.gd

Must contain:

var REQUIRED_ITEMS = [
    "hand_disinfectant",
    "gloves",
    "pvk",
    "tourniquet",
    "chlorhexidine",
    "nacl",
    "dressing",
    "label"
]

var STEPS = [
    "hand_disinfection",
    "apply_tourniquet",
    "skin_disinfection",
    "insert_pvk",
    "flush_pvk",
    "fixate_dressing",
    "label_pvk"
]

var ASEPTIC_CRITICAL_STEPS = [
    "insert_pvk",
    "flush_pvk"
]

---

# 4. Procedure Controller

File: systems/procedure_controller.gd

class_name ProcedureController

## Properties

- steps : Array
- current_step : int
- aseptic_broken : bool
- mistakes : Array
- score : int
- procedure_complete : bool

Initialize:
- score = 100
- current_step = 0
- aseptic_broken = false

---

## Required Methods

func initialize(step_array: Array)

func submit_action(action_name: String)

Logic:

1. Compare action_name with steps[current_step]
2. If correct:
      current_step += 1
      If last step -> complete procedure
3. If incorrect:
      mistakes.append(action_name)
      score -= 10

4. If aseptic violation occurs:
      aseptic_broken = true
      score -= 20

func is_complete() -> bool

func get_result() -> Dictionary

Return format:

{
  "score": score,
  "aseptic_broken": aseptic_broken,
  "mistakes": mistakes
}

---

# 5. Aseptic Logic (Demo Level)

Rule:

If player performs any incorrect action AFTER "skin_disinfection"
and BEFORE procedure complete:

→ aseptic_broken = true

No advanced sterile tracking required.

---

# 6. UI Flow

1. PVK Room Scene
   - Items visible
   - Tray area
   - Start Procedure button

2. On Start:
   - Validate tray
   - If invalid → show missing items
   - If valid → load technical_ui.tscn

3. Technical UI
   - Buttons for each step action
   - On button press:
       procedure_controller.submit_action(action_name)

4. If procedure complete:
   - Load feedback_screen.tscn

5. Feedback Screen
   Display:
   - Final score
   - Aseptic status
   - List of mistakes
   - Restart button

---

# 7. Definition of Done

The demo is complete when:

- Player can drag required items into tray
- Tray validation blocks missing materials
- Player can complete PVK step-by-step
- Wrong steps reduce score
- Aseptic can break
- Feedback screen shows result
- Full flow works without errors

---

# 8. Non-Goals (Do NOT implement)

- No JSON system
- No multiple procedures
- No generic architecture
- No RPG features
- No animations required
- No sound required
