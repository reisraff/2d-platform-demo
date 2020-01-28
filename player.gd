extends KinematicBody2D

export var velocity = 300

const gravity_power = 100

const JUMP_POWER = -80
const JUMP_STEP = 2

var motion = Vector2()
var movement = Vector2(0, 1)

var controll = {
	'up': false,
	'down': false,
	'left': false,
	'right': false,
	'jump': false,
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
	self.controll['jump'] = Input.is_action_just_pressed('ui_accept') # space bar

func movement_loop(delta):
	update_direction()
	jump(delta)
	update_animation()
	
	motion = movement * velocity

	if !is_on_floor():
		motion.y += gravity_power
	
	motion = move_and_slide(motion, Vector2(0, -1))

func jump(delta):
	if is_on_floor() and self.controll['jump']:
		movement.y = lerp(movement.y, JUMP_POWER, delta * JUMP_STEP)
	else:
		movement.y = lerp(movement.y, 1, delta * JUMP_STEP)

func update_animation():
	if is_on_floor():
		if movement.x != 0:
			$Sprite.play('run')
			if movement.x > 0:
				$Sprite.flip_h = false
			else:
				$Sprite.flip_h = true
		else:
			$Sprite.play('idle')
	else:
		if movement.y != 0:
			if movement.y > 0:
				$Sprite.play('fall')
			else:
				$Sprite.play('jump')

func update_direction():
	movement.x = -int(self.controll['left']) + int(self.controll['right'])

func die():
	print('meu player morreu')