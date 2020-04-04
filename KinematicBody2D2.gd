extends KinematicBody2D

var motion = Vector2()
const UP = Vector2(0,-1)


func _physics_process(delta):
	motion.x +=1;
	#if($RayCast2D.is_colliding() && $RayCast2D.get_collider().get_class() == "KinematicBody2D") :
	#	motion.x = 300
	#else:
	#	motion.x = -100
	move_and_slide(motion,UP)
	