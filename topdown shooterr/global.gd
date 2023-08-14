extends Node
var player : Player


@export var score := 0
@export var deaths:= 0

#le death code
func player_death(body):
	print("death")
	Global.deaths += 1
	get_tree().reload_current_scene()
	var enemies = get_tree().get_nodes_in_group("mobs") 
	for child in enemies: child.queue_free()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
