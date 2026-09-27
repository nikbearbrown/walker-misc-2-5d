extends SceneTree

func _initialize() -> void:
	run_probe.call_deferred()

func tap(code: Key) -> void:
	var event := InputEventKey.new()
	event.keycode = code
	event.physical_keycode = code
	event.pressed = true
	Input.parse_input_event(event)
	for i in range(4):
		await process_frame
	event = event.duplicate()
	event.pressed = false
	Input.parse_input_event(event)
	for i in range(4):
		await process_frame

func run_probe() -> void:
	change_scene_to_file("res://assets/demo_scene.tscn")
	for i in range(8):
		await process_frame
	var player = current_scene.get_node("Player25D").get_child(0)
	var before: bool = player.isometric_controls
	await tap(KEY_T)
	var toggled: bool = player.isometric_controls != before
	await tap(KEY_T)
	var restored: bool = player.isometric_controls == before
	var hints: Control = current_scene.get_node("Overlay/ControlHints")
	var visible_before := hints.visible
	await tap(KEY_TAB)
	var hidden := hints.visible != visible_before
	await tap(KEY_TAB)
	var shown := hints.visible == visible_before
	await tap(KEY_C)
	var cube := current_scene.scene_file_path == "res://assets/cube/cube.tscn"
	var cube_math: Node3D = current_scene.get_node("CubeMath")
	var count_ok := cube_math.get_child_count() == 27
	var rotation_before := cube_math.basis
	await tap(KEY_D)
	var rotated := not cube_math.basis.is_equal_approx(rotation_before)
	await tap(KEY_R)
	var cube_reset := cube_math.transform.is_equal_approx(Transform3D.IDENTITY)
	print("CUBE_POINTS_27=", count_ok, " D_ROTATION=", rotated, " R_RESET=", cube_reset)
	var axes_ok := true
	for code in [KEY_W, KEY_S, KEY_A, KEY_D, KEY_Q, KEY_E]:
		await tap(KEY_R)
		await tap(code)
		var changed := not cube_math.basis.is_equal_approx(Basis.IDENTITY)
		print("ROTATION_KEY=", code, " CHANGED=", changed)
		axes_ok = axes_ok and changed
	await tap(KEY_C)
	var returned := current_scene.scene_file_path == "res://assets/demo_scene.tscn"
	print("T_TOGGLE=", toggled, " RESTORE=", restored, " HINTS_TOGGLE=", hidden, " RESTORE=", shown)
	print("CUBE_ENTRY=", cube, " RETURN=", returned)
	current_scene.get_node("AudioStreamPlayer").stop()
	await create_timer(0.2).timeout
	current_scene.queue_free()
	for i in range(4):
		await process_frame
	quit(0 if toggled and restored and hidden and shown and cube and returned and count_ok and rotated and cube_reset and axes_ok else 1)
