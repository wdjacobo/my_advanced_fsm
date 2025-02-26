extends StateGravityBase

func on_physics_process(delta):	
	player.play_animation(player.animations.run)
	player.velocity.x = Input.get_axis("ui_left", "ui_right") * player.movement_stats.running_speed

	handle_gravity(delta)
	player.move_and_slide()

func on_input(event):
	if Input.is_action_just_pressed("ui_up"): state_machine.change_to(player.states.Jump)
	elif Input.is_action_just_pressed("ui_down"): state_machine.change_to(player.states.Crouch)
	elif not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"): state_machine.change_to(player.states.Idle)
