extends SceneTree

func _initialize() -> void:
	run_probe.call_deferred()

func key(code: Key, pressed: bool) -> void:
	var event := InputEventKey.new()
	event.keycode = code
	event.physical_keycode = code
	event.pressed = pressed
	Input.parse_input_event(event)

func run_probe() -> void:
	change_scene_to_file("res://assets/demo_scene.tscn")
	for i in range(120):
		await physics_frame
	var scene := current_scene
	var player: Node3D = scene.get_node("Player25D").get_child(0)
	print("PLAYER_PRESENT=", player is CharacterBody3D)
	print("PLAYER_POSITION=", player.position)
	var start := player.position
	key(KEY_D, true)
	for i in range(24):
		await physics_frame
	key(KEY_D, false)
	await physics_frame
	var moved := player.position.x > start.x + 1.0
	print("D_MOVEMENT=", moved, " POSITION=", player.position)
	key(KEY_R, true)
	await physics_frame
	await physics_frame
	key(KEY_R, false)
	var reset := absf(player.position.x) < 0.01 and absf(player.position.z) < 0.01
	print("R_RESET=", reset)
	var walk_start := player.position.x
	key(KEY_SHIFT, true)
	key(KEY_D, true)
	for i in range(24):
		await physics_frame
	key(KEY_D, false)
	key(KEY_SHIFT, false)
	await physics_frame
	var walk_distance := player.position.x - walk_start
	var walk_ok := absf(walk_distance - 1.0) < 0.1
	print("SHIFT_WALK=", walk_ok, " DISTANCE=", walk_distance)
	var jump_start := player.position.y
	key(KEY_SPACE, true)
	for i in range(8):
		await physics_frame
	key(KEY_SPACE, false)
	var jumped := player.position.y > jump_start + 1.0
	print("SPACE_JUMP=", jumped)
	var node25d = scene.get_node("Player25D")
	var projection_ok := true
	var expected_bases := [
		[Vector2(32, 0), Vector2(0, -22.627417), Vector2(0, 22.627417)],
		[Vector2(27.712813, 16), Vector2(0, -32), Vector2(-27.712813, 16)],
		[Vector2(32, 0), Vector2.ZERO, Vector2(0, 32)],
		[Vector2(32, 0), Vector2(0, -32), Vector2.ZERO],
		[Vector2(32, 0), Vector2(-22.627417, -22.627417), Vector2(0, 32)],
		[Vector2(32, 0), Vector2(0, -32), Vector2(-22.627417, 22.627417)]
	]
	var mode_keys := [KEY_U, KEY_I, KEY_O, KEY_J, KEY_K, KEY_L]
	for mode in range(6):
		key(mode_keys[mode], true)
		for i in range(3):
			await process_frame
		key(mode_keys[mode], false)
		var basis = node25d.get_basis()
		var matches := true
		for axis in range(3):
			matches = matches and basis[axis].distance_to(expected_bases[mode][axis]) < 0.001
		print("PROJECTION_MODE=", mode, " BASIS_MATCH=", matches)
		projection_ok = projection_ok and matches
	var music: AudioStreamPlayer = scene.get_node("AudioStreamPlayer")
	print("MUSIC_PLAYING_STATE=", music.playing, " LISTENED=false")
	# Diagnostic shutdown only: allow the mixer to release playback references.
	music.stop()
	await create_timer(0.2).timeout
	scene.queue_free()
	for i in range(4):
		await process_frame
	quit(0 if moved and reset and walk_ok and jumped and projection_ok else 1)
