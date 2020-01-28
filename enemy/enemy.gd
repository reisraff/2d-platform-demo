extends KinematicBody2D

const VELOCITY:int = 100

var direction:int = -1
var motion:Vector2 = Vector2()

func _process(delta):
	if is_on_wall():
		direction *= -1
	
	motion.x = VELOCITY * direction
	
	motion = move_and_slide(motion, Vector2(0, -1))

func _on_Area2D_body_entered(body):
	if body.get_name() == 'player':
		body.die()
