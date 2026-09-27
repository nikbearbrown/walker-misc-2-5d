# Frictional

2026-09-21 00:24UTC: Created separate title-only source copy, retaining MIT and
music attribution. Inspected README, player motion/sprite and Node25D projection
code. No behavior changes. Shared visible-recording blocker remains; previous
games are not retired. Need verify movement, jump, reset, six projection modes,
control toggles and cube transition before films. Editor plugin and remaining
runtime scripts need further inspection. No visible game window opened.

Headless editor import session64765 exits0 without reported errors. Bounded
120-frame runtime exits0 but reports4 leaked ObjectDB instances and2 resources
still in use: not a clean runtime pass. Investigate orderly audio/resource
shutdown in a diagnostic harness before claiming verification. No input checks yet.

2026-09-21 00:56UTC: Diagnostic harness stops music, allows200ms mixer drain,
then frees scene before quitting. Session98247 exits0 without cleanup warnings;
runtime source unchanged. Extended session58027 sends actual D/R key events
through Input.parse_input_event:24 physics frames move x to2.0, reset restores
x/z near0, both assertions true. Music playing state true, listening not tested.
No window or footage. This isolates an orderly diagnostic shutdown path, not a
claim that every game exit path is fixed. Projection/jump/cube checks remain.

2026-09-21 01:28UTC: Extended actual-key-event harness: Space increases player
height by more than1 in8 physics frames. U/I/O/J/K/L select all6 expected
projection bases within0.001 per basis vector. Movement/reset regressions pass;
session82067 exits0 cleanly using diagnostic audio drain. This verifies runtime
basis state, not rendered sprite alignment/occlusion. Toggles/cube and visual
capture remain pending. Source runtime unchanged, no visible window opened.

2026-09-21 02:00UTC: test_modes.gd sends T/Tab/C key events. Isometric-control
toggle/restore, hint visibility toggle/restore and cube entry/return all pass.
Session49255 exits0 cleanly after final music stop/drain. Scene transitions use
normal input handlers, no manual swapping or state assignment. Actual sprite
alignment and cube rotation remain unverified; no visible capture attempted.

2026-09-21 02:31UTC: Cube input regression confirms27 math child points,
D changes cube basis, R restores identity. Existing toggle/entry/return checks
pass; session50235 exits0 cleanly. Prepared capture plan with remaining visual,
Shift-speed,other-axis and editor checks explicitly pending. No films or visible
windows; source runtime unchanged.

2026-09-21 03:03UTC: Extended input probes pass all WASDQE cube rotation keys
from reset identity (nonidentity result checks, not angle-accuracy assertions).
Shift+D moves1.00000012 units over24 physics frames versus D alone2.0, matching
half-speed behavior. Sessions81925 and27164 exit0 cleanly with existing checks.
Editor interaction and visual quality remain pending; no captured films yet.
