extends CharacterBody2D
class_name Player
#first version completed done 2:37am 8/12
#second version done 11:48 8/13, added score and death meter
	#need to delete nodes properly for both bullet and all enemies once you die or else the death meter breaks
	#would also like to learn dash
#third version done 12:00 8/14
	#fixed score and death meter functionality
	#added linear enemy type
	#fixed all enemy death when player dies
#fourth version done 3:43 8/15 - this will be topdown 0.3
	#added dashing


var movespeed = 700
var bullet_speed = 2000
var bullet_scn = preload("res://bullet.tscn")
const dashSpeed = 2000
const dashLength = .2

@onready var dash = $Dash

#@export var score:= 0




func _ready():
	Global.score = 0
	Global.player = self
	$music.play()
	

func _physics_process(delta):
	var acc = Vector2()
	
	if Input.is_action_pressed("dash"):
		dash.start_dash(dashLength)

		dash.is_dashing()
		
		
	var speed = dashSpeed if dash.is_dashing() else movespeed 
	if dash.is_dashing():
		$Area2D/DashEffect.emitting = true

	else:
		$Area2D/DashEffect.emitting = false
		
	
	if Input.is_action_pressed("up"):
		acc.y = -1
	if Input.is_action_pressed("down"):
		acc.y = 1
	if Input.is_action_pressed("left"):
		acc.x = -1
	if Input.is_action_pressed("right"):
		acc.x = 1
		
	velocity += acc.normalized() * delta * speed
	velocity *= .94


	#velocity = velocity.normalized()  * movespeed
	#velocity += Vector2(1,1)
	
	#velocity = Vector2(100,0) * delta
	
	move_and_slide()
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("lmb"):
		fire()
		
	



#le fire func
func fire():
	#time is stupid
	if $Timer.is_stopped():
		$Timer.start()
		$laser.play()
		#"technically more correct"
		var mouseOffset := Vector2.RIGHT.rotated(rotation) 
		var bullet :RigidBody2D = bullet_scn.instantiate()
		#this shit is gay, rotation is the rotation of the player, which was set to the mouse position in line 33
		#both the position and the offset are vectors, which somehow makes sense and doesn't. 
		bullet.position = get_global_position() + mouseOffset * 16
		bullet.rotation = rotation
		
		bullet.linear_velocity = Vector2(500,0).rotated(rotation)
	
		get_tree().get_root().call_deferred("add_child",bullet)

#sends signal to le death code
func _on_area_2d_body_entered(body):
	if body is Enemy and !dash.is_dashing():
		Global.player_death(self)
		#get_tree().set_group(Enemy, is_queued_for_deletion())
	#I once more don't know why it won't accept me doing an or statement for linearEnemy
	#Too Bad!
	if body is linearEnemy and !dash.is_dashing():
		Global.player_death(self)
		
	#dash implementation of killing enemy body
	if body is Enemy or linearEnemy and dash.is_dashing():
		body.queue_free()





