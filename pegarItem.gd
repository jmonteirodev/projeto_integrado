extends Area2D

var vida
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	vida = get_parent().vida
