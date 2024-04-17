extends CharacterBody2D



var coin = 0
var nama = "MC"
#var inventory = {"shovel"}:
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
const gravity = 0
var canMove = true



func _physics_process(delta):
	movement(delta)
	




func movement(delta):
	velocity.y += gravity * delta
		
	var direction2 = Input.get_axis("up", "down")
	if canMove == true:
		velocity.normalized()
		velocity.y = direction2 * SPEED 
	elif canMove == false:
		velocity.normalized()
		velocity.y = move_toward(velocity.y, 0, SPEED)

	var direction = Input.get_axis("left", "right")
	if canMove == true:
		velocity.normalized()
		velocity.x = direction * SPEED 
		
		
	elif canMove == false:
		velocity.normalized()
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
func lock_movement():
	canMove = false

func unlock_movement():
	canMove = true


func _on_area_2d_body_entered(_body):
	
	if _body.nama == "MC":
		print("player entered")
		print("body is", _body)
	



func _on_area_2d_body_exited(body):
	print("player exited")
	


#func _on_button_pressed():
#	if enteredplayer == true:
		#print("you clicked me")
