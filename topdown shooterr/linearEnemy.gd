extends CharacterBody2D
class_name linearEnemy
#

const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(_delta):
	var playerPos :Vector2 = Global.player.position
	
	look_at(Global.player.position)
	velocity = Vector2(100,0).rotated(rotation)*3

	var angle = get_angle_to(playerPos)
	#look_at(playerPos*(angle/600))
	
	move_and_slide()
	
	


