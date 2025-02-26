extends StateGravityBase

func on_physics_process(delta):	
	player.play_animation(player.animations.jump)
	player.velocity.x = Input.get_axis("ui_left", "ui_right") * player.movement_stats.running_speed		
	if player.is_on_floor() and player.velocity.y >= 0: 
		player.velocity.y = player.movement_stats.jump_speed
	if player.velocity.y > 0: state_machine.change_to(player.states.Falling)

	handle_gravity(delta)
	player.move_and_slide()

func on_input(event):
	pass
