extends StateGravityBase

func on_physics_process(delta):	
	player.play_animation(player.animations.idle)
	player.velocity.x = 0			

	handle_gravity(delta)
	player.move_and_slide()

func on_input(event):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"): state_machine.change_to(player.states.Run)
	elif Input.is_action_just_pressed("ui_up"): state_machine.change_to(player.states.Jump)
	elif Input.is_action_just_pressed("ui_down"): state_machine.change_to(player.states.Crouch)
