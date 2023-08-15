extends Node2D

@onready var timer = $dashtimer
@onready var dashCD = $coolDown

func start_dash(dur):
	#actually dashing
	if dashCD.is_stopped():
		timer.wait_time = dur
		timer.start()
		print("dash!")
		dashCD.start()
		$dashsfx.play()


	
func is_dashing():
	return !timer.is_stopped()



