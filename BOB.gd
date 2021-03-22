extends KinematicBody2D

var velocity = Vector2(0,0) # This vector is determening where my floor is facing
const SPEED = 220 # This constant determines how fast the sprite moves
const JUMPFORCE = -1200
const GRAVITY = 40 # controls th speed of descent 

# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_pressed("right"): # When the custom input is pressed the sprite will move right
		velocity.x= SPEED
	if Input.is_action_pressed("left"): # When the custom input is pressed the sprite will move left
		velocity.x= -SPEED
	
	
	velocity.y = velocity.y + GRAVITY # this is the y axis and controls up and down (increseses momentum of fall)
	
	if Input.is_action_just_pressed("jump") and is_on_floor(): # when the custom jump input is pressed the sprite will jump
		velocity.y = JUMPFORCE # Jump height
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
