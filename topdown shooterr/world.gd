extends Node2D
var e = preload("res://enemy.tscn")
var le = preload("res://linear_enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

#le enemy spawner
func _on_enemy_spawn_timeout():
	var en :Enemy= e.instantiate()
	var lien:linearEnemy = le.instantiate()
	
	$enemySpawn.wait_time = max($enemySpawn.wait_time * .95, .5)
	var r = randi() % 2
	#linear enemy spawn
	if r == 0:
		enemySpawn(en)
	#curve enemy spawn
	if r == 1:
		enemySpawn(lien)

func enemySpawn(enemyType):
	add_child(enemyType)
	enemyType.position = self.enemySpawnLocation()
	enemyType.add_to_group("mobs")

#return a variable position that isn't within 100 pixels of the player
func enemySpawnLocation() -> Vector2:
	var randPos = Vector2(randf_range(0, 500), randf_range(0, 500))
	var x_is_valid = randPos.x > (Global.player.position.x + 100) or randPos.x < (Global.player.position.x - 100)
	var y_is_valid = randPos.y > (Global.player.position.y + 100) or randPos.y < (Global.player.position.y - 100)
	if x_is_valid and y_is_valid:
		return randPos
	else:
		return enemySpawnLocation()
