extends Node2D

func _on_got_apple(body):
	if body.name == "player":
		body.got_one_apple()
		get_node("AnimatedSprite").queue_free()
		get_node("Area2D").queue_free()
		get_node("sound").play()
		get_node("Timer").start()

func _on_music_finished():
	queue_free()
