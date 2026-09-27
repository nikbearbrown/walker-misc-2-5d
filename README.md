# Walker 2.5D

**What this is.** An independent GDScript adaptation of Godot's `misc/2.5d`
demo. Three-dimensional physics drives two-dimensional sprites through
projection basis vectors; this is not a rendered 3D camera. A character runs and
jumps across floating platforms under six switchable view modes, and a separate
cube scene shows the same projection on a rotating lattice. It is a tech demo
with a playable sandbox, not a game: there is no goal, win or progression.

**Why it is in Walker.** It is one of Walker's Godot demo adaptations: an
independent copy checked headlessly and queued for two Liam films (see
FRICTIONAL.md and CAPTURE-PLAN.md). Whether it is only a projection lesson or
also a starting point for a Walker 2.5D game is an open question
(design/decisions.md, Q-01).

**What was found and verified.** Title-only initial change; upstream untouched.
FRICTIONAL.md records headless key-event probes of movement, walk, jump, reset,
all six projection bases, the control/hint toggles and the cube scene; these
check runtime state, not rendered sprite alignment, shadows or occlusion. A
recovered design description now exists in `GDD.md`; it describes the code and
approves nothing.

## How to run

Open `godot/project.godot` in Godot 4.7 and run the project. The main scene is
`assets/demo_scene.tscn`.

Controls (from the in-game hints and the input map):

- WASD or arrow keys to move, Shift to walk, Space to jump, R to reset
- U / I / O / J / K / L to change view mode: forty-five degrees, isometric, top
  down, front side, oblique Y, oblique Z
- T to toggle isometric controls, Tab to toggle hints
- C to open the cube demo; there, WASDQE rotates, R resets, C returns
- Esc to quit

Note that the upstream jump has no ground check, so jumping also works in
mid-air. Controllers are mapped in the project but have not been tested.

## Design

The design package is a **recovered, unapproved description** of what the code
does, written by the Walker `/gdd reverse` pass in silent mode. No design gate
has been signed.

- [GDD.md](GDD.md) — recovered Game Design Document (identical copy of `design/GDD.md`)
- [design/DECK.html](design/DECK.html) — review slides
- [design/IMPLEMENTATION-MAP.md](design/IMPLEMENTATION-MAP.md) — feature → scene/script paths
- [design/decisions.md](design/decisions.md) — open questions the code cannot answer

## Source & license

Independent GDScript adaptation of Godot `misc/2.5d`, source checkout
a3b5c113112f77291d5f3d1360f33a882fdc52f7. Title-only initial change; upstream
untouched, MIT notice retained. Original README and assets preserved in godot/.
This is the GDScript demo, not its separate C# counterpart.

Music `assets/mr_mrs_robot.ogg`: Juan Linietsky, circa 2008, CC-BY Attribution,
as credited upstream. Preserve this attribution in future film descriptions.

## Status

- Six view modes and a separate cube demonstration require actual input checks;
  FRICTIONAL.md records headless key-event probes of them.
- Actual gameplay verification, capture and both Liam films remain pending.

Repository: https://github.com/nikbearbrown/walker-misc-2-5d
