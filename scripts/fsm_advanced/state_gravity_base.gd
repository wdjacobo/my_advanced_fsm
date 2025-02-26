class_name StateGravityBase extends StatePlayerBase

var gravity:float = ProjectSettings.get_setting("physics/2d/default_gravity")
	
func handle_gravity(delta):
	controlled_node.velocity.y += gravity * delta

# Aquí también podríamos realizar las llamadas a funciones handle_gravity() y move_and_slide() del método on_physics_process() que comparten todos los PlayerStates
