extends Node2D

@onready var player_spaghetti: Player = $PlayerSpaghetti
@onready var player_fsm_simple: Player = $PlayerFSMSimple
@onready var player_fsm_advanced: Player = $PlayerFSMAdvanced

func hello():
	pass

func _ready():
	print("Se están borrando los nodos de los players no utilizados")
	#remove_child(player_spaghetti)
	remove_child(player_fsm_simple)
	remove_child(player_fsm_advanced)
