extends CharacterBody2D
class_name Enemy
#

const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(_delta):
	var smooth:= 0.25
	var maxturn:= .03
	var playerPos :Vector2 = Global.player.position
	
	#look_at(Global.player.position)
	#rotator enemy
	velocity = Vector2(100,0).rotated(rotation)*2
	rotation += clamp(to_local(playerPos).angle() * smooth, -maxturn, maxturn)
	#var angle = get_angle_to(playerPos)
	#look_at(playerPos*(angle/600))
	
	move_and_slide()
	
	


