extends Node2D

func _ready():
	get_node("animacao/Sprite/AnimationPlayer").play("default")
	get_node("animacao/Sprite2/AnimationPlayer").play("default")

func _on_play_pressed():
	get_tree().change_scene('res://main.tscn')
