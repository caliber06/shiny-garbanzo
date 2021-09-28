extends KinematicBody2D

var speed = 100
var jump_speed = -500
var gravity = 1000

var velocity = Vector2.ZERO


func get_input():
	if Input.is_action_pressed("right"):
			velocity.x += speed
	if Input.is_action_pressed("left"):
			velocity.x -= speed
	if is_on_floor():
		velocity *= 0.9
		speed = 50
	else:
		speed = 5

func _physics_process(delta):
	get_input()
	if is_on_floor():
		rotation = lerp_angle(rotation,(get_floor_normal().angle() + PI/2),0.125)
	
	rotation = lerp_angle(rotation,velocity.x/1000,0.125)
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed - abs(velocity.x*0.25)
			
	

