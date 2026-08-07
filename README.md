# darksim

DarkSim is an experimental 3D simulation framework built on Looking Glass
Studios' **Dark Engine**, the technology behind *Thief: The Dark Project* and
*System Shock 2*.

The aim of the project is not to create another conventional RPG progression
mod. DarkSim uses the Dark Engine as a foundation for a compact, realistic,
simulation-first ruleset in which physical state, equipment, environment,
perception, AI, and player decisions matter more than accumulated experience
points or character-build optimization.

DarkSim is closely related to
[DarkZIL](https://github.com/akosela/darkzil) and **DarkRPG**. DarkRPG
provides the underlying technical rules. DarkZIL demonstrates those rules in a
compact Z-machine text adventure, while DarkSim explores how the same ideas can
be expressed through a real-time 3D simulation.

## Project goals

DarkSim is intended to provide a reusable framework for simulation-oriented
games and experiments using the Dark Engine.

The main goals are:

- build a realistic and internally consistent 3D simulation layer;
- keep the rules small enough to understand and reason about;
- prefer direct physical and systemic consequences over abstract bonuses;
- keep numerical character progression limited or absent;
- make equipment, damage, armor, movement, perception, and environment matter;
- rely on player observation, planning, timing, and execution;
- preserve and extend the strongest simulation features of the Dark Engine;
- support different settings rather than hard-code one particular genre.

"Realistic" in DarkSim does not mean photorealistic graphics or an attempt to
simulate every physical process. It means that the game world should follow
consistent rules and that those rules should correspond as closely as
practical to the state of objects, creatures, equipment, and the environment.

## DarkRPG

The technical rules behind DarkSim are based on **DarkRPG**, the compact
role-playing system also used by DarkZIL.

DarkRPG is intentionally small. It is designed to provide enough structure for
characters, combat, equipment, exploration, and adjudication without requiring
large skill trees, levels, classes, or escalating pools of bonuses.

The core character model uses four attributes:

```text
S   Strength
D   Dexterity
K   Knowledge
W   Weapon Skill
```

Two additional values describe survivability:

```text
HP  Health Points
AP  Armor Points
```

The basic DarkRPG relationship between Strength and health is:

```text
HP = 6 + S
```

Armor directly reduces incoming damage:

```text
final damage = max(0, raw damage - AP)
```

Weapon Skill modifies the basic combat roll:

```text
attack = 1d6 + W
```

In the DarkZIL reference implementation, opposing combatants compare their
attack rolls. A successful weapon hit normally causes a `1d6` damage roll
before armor is applied.

DarkRPG can generate starting attributes from `2d6`:

```text
2-4    = -1
5-8    =  0
9-10   = +1
11-12  = +2
```

DarkSim treats these rules as a compact model rather than as a requirement to
display dice or character sheets to the player. A scenario can also use fixed
attributes when the player represents a predefined character.

For the complete DarkRPG explanation and its reference implementation, see the
[DarkZIL project](https://github.com/akosela/darkzil).

## From tabletop rules to 3D simulation

DarkZIL expresses DarkRPG explicitly because it is a text adventure. Combat is
resolved in turns and the underlying dice rolls can be shown directly.

DarkSim has a different problem.

It must translate the same compact rules into a continuous 3D world in which
the Dark Engine is already simulating:

- position and movement;
- collision and physics;
- objects and containment;
- weapons and projectiles;
- damage;
- AI perception and alertness;
- sound propagation;
- lighting and visibility;
- doors, locks, switches, and machines;
- inventory and equipment;
- environmental hazards;
- scripted object behavior.

The purpose of DarkRPG inside DarkSim is therefore not to replace the Dark
Engine simulation with a tabletop combat loop. It provides a small technical
model for the parts of the simulation that still require numerical
adjudication.

Where the engine can represent something directly, DarkSim should generally
prefer the simulated state over an additional abstract statistic.

## Simulation-first design

DarkSim follows a few basic design rules.

### Player skill before progression

The player should improve primarily by learning the environment and becoming
better at using the available tools.

Success should depend on things such as positioning, timing, stealth,
observation, weapon handling, resource management, and understanding AI
behavior rather than on repeatedly increasing numerical attributes.

### Fixed and bounded capabilities

Attributes are intended to remain small and bounded. A scenario may define
them once rather than continually increasing them during play.

This keeps characters physically understandable and prevents late-game
statistical inflation from overwhelming the simulation.

### Direct equipment effects

Equipment should change the simulated character in a direct and understandable
way.

Armor protects because it absorbs or reduces damage. A weapon is useful
because of its physical and tactical properties. A tool works because the
character has the tool and the situation permits its use.

The framework should avoid arbitrary equipment restrictions whose only purpose
is to enforce a progression tree.

### Dangerous combat

Combat is not intended to be a routine source of experience points.

Weapons are dangerous, armor matters, injuries matter, and avoiding a fight
can be as valid as winning one. This is consistent with the systemic design of
the original Dark Engine games and with the compact, dangerous combat model of
DarkRPG.

### Minimal abstraction

DarkSim attempts to remove abstractions that duplicate something the 3D world
can already represent.

For example, if the engine can determine that the player possesses a tool,
stands within reach of a machine, and can physically operate it, another
artificial unlock layer should not normally be necessary.

## Progression

DarkSim is not designed around conventional level progression.

In particular, the framework does not require the player to accumulate an
experience currency and repeatedly purchase larger statistics in order to
remain viable.

When DarkSim is implemented on top of *System Shock 2*, this philosophy also
means that the original character-development systems can be removed,
bypassed,
or reduced when they conflict with the simulation model. Examples include:

- Cyber Module spending;
- repeated stat upgrades;
- weapon-skill purchase requirements;
- technical-skill purchase requirements;
- trait selection;
- artificial equipment requirements tied only to progression.

The objective is not simply to make everything available without consequence.
The objective is to replace progression gates with consequences that belong to
the simulation itself.

## Attributes in DarkSim

The DarkRPG attributes provide a common vocabulary for simulation rules.

### Strength / S

Strength represents physical power.

It can be used for rules involving:

- health;
- carrying or manipulating heavy objects;
- physical force;
- melee capability;
- other strength-dependent interactions.

The DarkRPG baseline is:

```text
HP = 6 + S
```

### Dexterity / D

Dexterity represents coordination, agility, and physical precision.

In a 3D simulation many dexterity-related actions are already expressed by
player input and engine movement, so Dexterity should not duplicate mechanics
that the player is performing directly.

It remains available for cases that genuinely require character-side
adjudication.

### Knowledge / K

Knowledge represents learned information, technical understanding, and
practical expertise.

It provides a compact basis for interactions that cannot be determined purely
from physical state.

The intention is to use Knowledge only where knowledge actually matters rather
than as a generic level requirement.

### Weapon Skill / W

Weapon Skill represents trained weapon proficiency.

In the DarkRPG reference model it modifies attack resolution:

```text
1d6 + W
```

In DarkSim, real-time aiming, movement, range, weapon behavior, and player
execution already contribute directly to combat. Weapon Skill therefore acts
as a compact rules concept rather than a reason to replace first-person combat
with visible turn-based dice rolls.

## Health and armor

DarkSim favors low, readable health values rather than large pools of hit
points.

DarkRPG defines starting health as:

```text
HP = 6 + S
```

Armor uses direct damage reduction:

```text
final damage = max(0, raw damage - AP)
```

This gives armor a concrete purpose. It reduces physical damage rather than
merely increasing an abstract defense percentage.

Individual DarkSim scenarios may extend this model for different damage types,
body protection, environmental effects, or setting-specific equipment while
retaining the same basic principle.

## Dark Engine

The Dark Engine is unusually well suited to DarkSim because much of the world
is already represented as interacting simulation objects rather than as
special-case level scripting.

Important systems include:

- an archetype-based object hierarchy;
- properties and links;
- physics and collision;
- AI senses and state;
- sound propagation;
- light and visibility;
- inventory and containment;
- damage and weapons;
- environmental interaction;
- scriptable object behavior.

DarkSim builds on these systems instead of replacing them with a separate game
layer whenever possible.

## Implementation

DarkSim development can operate at several levels of the Dark Engine stack.

### GameSys and object properties

Global object behavior can be changed through the GameSys hierarchy and object
properties.

This is useful for defining consistent framework-wide behavior for weapons,
armor, items, creatures, player capabilities, and interactive objects.

### DML

NewDark DML patches provide a compact way to change GameSys and mission data
without rebuilding every original mission.

DML is useful for tasks such as:

- changing object properties;
- adding or removing scripts;
- changing inheritance;
- removing requirements;
- altering links;
- applying mission-specific corrections.

### Scripts

Runtime behavior that cannot be represented cleanly with properties and links
can be implemented with Dark Engine scripts.

DarkSim work may use NewDark scripting facilities, including OSM/Squirrel
where appropriate, for simulation rules that need runtime logic.

### Interface

A simulation framework should expose only information that is useful to the
player.

Interface elements inherited from the host game can therefore be simplified,
hidden, or repurposed when they represent systems that DarkSim does not use.

The long-term aim is for the world itself to communicate as much state as
possible.

## DarkRPG, DarkZIL, and DarkSim

The three projects serve different roles:

```text
                     DarkRPG
                        |
              compact technical rules
                        |
             +----------+----------+
             |                     |
          DarkZIL                DarkSim
             |                     |
       Z-machine / ZIL        Dark Engine / 3D
       text simulation        real-time simulation
```

**DarkRPG** is the common rules model.

**DarkZIL** is a compact old-school text-adventure implementation and a useful
reference for the explicit rules.

**DarkSim** is the 3D simulation project. It applies the same design
philosophy
to a real-time object-based environment.

The DarkZIL project and its DarkRPG documentation are available here:

<https://github.com/akosela/darkzil>

## Scope

DarkSim should be understood as a framework and an ongoing experiment.

It is concerned primarily with reusable simulation rules and engine behavior,
not with reproducing the campaign structure or progression model of a
particular commercial game.

The Dark Engine games provide the host technology, assets, object systems, and
existing simulation mechanisms. DarkSim investigates how far that technology
can be pushed toward a smaller, more coherent and more realistic rule model.

## Status

DarkSim is a work in progress.

The project is being developed incrementally by identifying systems inherited
from the original games, deciding whether they belong in the DarkSim model,
and then removing, simplifying, or replacing them where necessary.

Engine behavior and available commands can differ between original Dark Engine
executables and NewDark builds. Documentation in this repository should
therefore be treated as part of the framework itself: understanding the engine
is necessary to modify it predictably.

## Related project

- [DarkZIL](https://github.com/akosela/darkzil) - compact ZIL/Z-machine
  framework and the current public documentation of the DarkRPG rules.
