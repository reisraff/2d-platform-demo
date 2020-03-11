extends Node2D


func _on_Area2D_body_entered(body):
	if body.get_name() == 'player':
		body.win()
