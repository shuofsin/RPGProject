extends CharacterBody2D

const SPEED = 100
var current_dir = "none"

func _ready() -> void:
	$AnimatedSprite2D.play("front_idle")
	pass

func _physics_process(delta: float) -> void:
	player_movement(delta)
	pass
	
func player_movement(delta: float) -> void:
	if (Input.is_action_pressed("ui_right")):
		play_anim(1) 
		velocity.x = SPEED 
		velocity.y = 0 
		current_dir = "right"
	elif (Input.is_action_pressed("ui_left")):
		play_anim(1)
		velocity.x = -SPEED 
		velocity.y = 0
		current_dir = "left"
	elif (Input.is_action_pressed("ui_up")):
		play_anim(1)
		velocity.x = 0 
		velocity.y = -SPEED 
		current_dir = "up"
	elif (Input.is_action_pressed("ui_down")):
		play_anim(1)
		velocity.x = 0
		velocity.y = SPEED 
		current_dir = "down"
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func play_anim(movement: int) -> void: 
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if (dir == "right"):
		anim.flip_h = false
		if (movement == 1): 
			anim.play("side_walk")
		elif (movement == 0):
			anim.play("side_idle")
	if (dir == "left"):
		anim.flip_h = true
		if (movement == 1): 
			anim.play("side_walk")
		elif (movement == 0):
			anim.play("side_idle")
	if (dir == "up"):
		anim.flip_h = false
		if (movement == 1): 
			anim.play("back_walk")
		elif (movement == 0):
			anim.play("back_idle")
	if (dir == "down"):
		anim.flip_h = false
		if (movement == 1): 
			anim.play("front_walk")
		elif (movement == 0):
			anim.play("front_idle")
