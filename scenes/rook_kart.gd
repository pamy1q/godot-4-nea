extends CharacterBody2D
@export var speed = 100
#
var last_direction = Vector2.ZERO
#
var animated_sprite

func _ready():
	# 
	animated_sprite = $AnimatedSprite2D
 
func _physics_process(delta):
	#direction of movement is based on arrow keys pressed
	#the  ".get_vector" return a Vector 2 represents coordinates such as :
	#X= -1 --> for "ui_left", 1 if "ui_right is" pressed, or 0 else
	#Y= -1 --> for "ui_up", 1 if "ui_down is" pressed, or 0 else
	#if THERE is a combo of both up and right the vector returns (1,-1)
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	velocity = direction * speed
	# velocity is a property of characterbody2D that is used to move the sprite
	if direction != Vector2.ZERO :
		last_direction = direction
	#play the idle animation if down key is pressed
	#play the right animation based on the direction, turing right or steering right
	if direction.x !=0:
		animated_sprite.play("turn_straight")
	elif direction.y < 0:
		animated_sprite.play("steer_right")
	elif direction.y > 0:
		animated_sprite.play("idle_car")
	else:
		#If the kart is not moving, play the idle animation
		#play the idle animation if key is left or right
		#play the steer left animation if up key is pressed
		#This gives an abstraction of steering the kart
		if  last_direction.x != 0:
			animated_sprite.play("idle_car")
		elif last_direction.y < 0:
			animated_sprite.play("steer_right")
		elif last_direction.y > 0:
			animated_sprite.play("steer_left")
		#flip the sprite horizontally if the last direction x direction is left 
		#This allows the sprite animation to be used for both left and right
		# This is justified as it saves memory and time
	animated_sprite.flip_h = last_direction.x > 0

	move_and_slide()
	#move_and_slide is a method of characterbody 2D that moves the sprite
