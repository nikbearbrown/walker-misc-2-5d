# Walker 2.5D — pending capture

Shared recording-window blocker remains. No visible capture until resolved.
Two native3840×2160 Liam films with Walker bookends and regular stock outro;
no burned captions, fake gameplay, or unlabelled speed changes. Keep MIT/source
credits and Juan Linietsky's CC-BY music attribution in descriptions.

Walkthrough evidence: move, walk with Shift, jump, reset; switch U/I/O/J/K/L
through45-degree/isometric/top-down/front/oblique views. Demonstrate T controls
and Tab hints. Enter cube with C, rotate using WASDQE, reset, return with C.
Capture actual shadows and occlusion, including where flat projections conceal
depth. Do not claim hidden geometry ceased to exist.

Gamedev adjacent code/result pairs:

1. PlayerMath25D movement → actual D/W motion and Shift speed comparison.
2. Jump/gravity/reset → actual ascent, fall and R reset. Source allows jump input
   without a grounded condition; do not describe it as grounded-only.
3. Node25D basis multiplication → same physical scene in the six actual views.
4. Player sprite frame/flip selection → actual facing, run and jump animation.
5. ShadowMath25D shapecast and YSort25D → actual shadow landing/occlusion;
   headless transform tests alone cannot establish correct visual layering.
6. CubeMath27 points and rotate calls → genuine cube rotation and reset.
7. Editor plugin → actual editor viewport only after its remaining scripts are
   inspected and real interaction verified. Do not substitute a fabricated UI.

Current headless evidence covers movement/reset/jump,6 basis states,control/hint
toggles,cube entry/return,27 point nodes,D rotation and R reset. Shift speed,
other cube rotation axes,visual alignment,audio and editor behavior remain
unverified in footage. Follow-up headless checks now confirm Shift+D travels1.0
versus D2.0 units over24 physics frames, and all WASDQE keys change cube basis
from identity; exact rotation angles are not asserted.
Diagnostic stop/drain cleanup is clean; abrupt-exit warning remains
documented, not silently fixed. Capture before declaring either film ready.
