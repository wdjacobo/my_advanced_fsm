class_name StateMachine extends Node

@onready var controlled_node:Node = self.owner

@export var default_state:StateBase
@export var debug_mode:= true

var current_state:StateBase = null

func _ready():
	call_deferred("_state_default_state") # Llamamos cuando todos los nodos, la máquina incluida, estén listos.

func _state_default_state() -> void:
	current_state = default_state
	_state_start()

func _state_start() -> void:
	if debug_mode: prints("StateMachine", controlled_node.name, "start state", current_state.name)
	current_state.controlled_node = controlled_node
	current_state.state_machine = self
	current_state.start()

func change_to(new_state:String) -> void:
	if current_state and current_state.has_method("end"): current_state.end()
	current_state = get_node(new_state)
	_state_start()
	
#region Métodos que se ejecutan sólos
#Ejecutarán lo que serían los métodos automáticos de cada nodo, con un nombre ligeramente distinto, para poder ejecutar aquellos que queremos únicamente

func _process(delta: float) -> void:
	if current_state and current_state.has_method("on_process"):
		current_state.on_process(delta)
	
func _physics_process(delta: float) -> void:
	if current_state and current_state.has_method("on_physics_process"):
		current_state.on_physics_process(delta)
	
func _input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_input"):
		current_state.on_input(event)

func _unhandled_input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_unhandled_input"):
		current_state.on_unhandled_input(event)

func _unhandled_key_input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_unhandled_key_input"):
		current_state.on_unhandled_key_input(event)

#endregion
	
