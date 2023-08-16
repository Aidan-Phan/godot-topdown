extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	rotation=0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position = Global.player.position
