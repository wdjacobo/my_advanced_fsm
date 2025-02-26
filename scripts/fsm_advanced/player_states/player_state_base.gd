class_name StatePlayerBase extends StateBase

var player:Player:
	set(value):
		controlled_node=value
	get:
		return controlled_node
