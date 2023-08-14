extends Node2D
var e = preload("res://enemy.tscn")
var le = preload("res://linear_enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_enemy_spawn_timeout():
	
	$enemySpawn.wait_time = max($enemySpawn.wait_time * .95, .5)
	var r = randi() % 2
	print(r)
	
	#linear enemy spawn
	if r == 0:
		var len:linearEnemy = le.instantiate()
		len.position = Vector2(randf_range(0, 500), randf_range(0, 500))
		#get_tree().get_root().call_deferred("add_child", en)
		add_child(len)
		len.add_to_group("mobs")
	#curve enemy spawn
	if r == 1:
		var en :Enemy= e.instantiate()
		en.position = Vector2(randf_range(0, 500), randf_range(0, 500))
		#get_tree().get_root().call_deferred("add_child", en)
		add_child(en)
		en.add_to_group("mobs")
	

