extends RigidBody2D
var blood_scene = preload("res://gpu_particles_2d.tscn")
@export var speed := 500


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_timer_timeout():
	queue_free()

func _on_body_entered(body):
	if body is Enemy:
		$bulletHitbox.queue_free()
		$Sprite2D.queue_free()
		position = Vector2.ONE * -1000000
		
		#$CollisionObject2D.disabled = true
		Global.score +=1
		$expl.play()
		var blood :GPUParticles2D = blood_scene.instantiate()
		get_tree().get_root().call_deferred("add_child", blood)
		blood.position = position
		body.queue_free()
		await $expl.finished
		queue_free()
		
	#i genuinely don't know why i can't just do an or statement in the above but it breaks if it doesn't
	if body is linearEnemy:
		$bulletHitbox.queue_free()
		$Sprite2D.queue_free()
		position = Vector2.ONE * -1000000
		#$CollisionObject2D.disabled = true
		Global.score +=1
		$expl.play()
		var blood :GPUParticles2D = blood_scene.instantiate()
		get_tree().get_root().call_deferred("add_child", blood)
		blood.position = position
		body.queue_free()
		await $expl.finished
		queue_free()

