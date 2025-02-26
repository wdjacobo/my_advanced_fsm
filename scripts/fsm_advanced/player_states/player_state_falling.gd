extends StateGravityBase

func on_physics_process(delta):	
	player.velocity.x = Input.get_axis("ui_left", "ui_right") * player.movement_stats.running_speed
	if player.velocity.y >= 0 and player.is_on_floor(): state_machine.change_to(player.states.Idle)
	else: state_machine.change_to(player.states.Run)

	handle_gravity(delta)
	player.move_and_slide()
