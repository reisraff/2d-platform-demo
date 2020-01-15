extends KinematicBody2D

export var velocity = 300
var movement = Vector2()
var controll = {
	'up': false,
	'down': false,
	'left': false,
	'right': false,
}

func _physics_process(delta):
	# 0.000234234234243
	controll_loop()
	movement_loop(delta)
	
func controll_loop():
	self.controll['up'] = Input.is_action_pressed('ui_up')
	self.controll['down'] = Input.is_action_pressed('ui_down')
	self.controll['left'] = Input.is_action_pressed('ui_left')
	self.controll['right'] = Input.is_action_pressed('ui_right')

func movement_loop(delta):
	walk()
	
	var motion = (movement * velocity) * delta
	
	self.position = self.position + motion
	
func walk():
	movement.x = -int(self.controll['left']) + int(self.controll['right'])
	movement.y = -int(self.controll['up']) + int(self.controll['down'])

