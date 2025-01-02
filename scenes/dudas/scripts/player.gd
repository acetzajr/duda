extends CharacterBody2D

@onready var visuals: AnimatedSprite2D = $Visuals

const SPEED : float = 100.0
const DELTA : float = 10.0

func update_visuals(direction: Vector2) -> void:
	if direction.length() == 0.0:
		return
	visuals.rotation = direction.angle()

func _physics_process(delta: float) -> void:
	var direction : Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity.x = move_toward(velocity.x, SPEED * direction.x, DELTA)
	velocity.y = move_toward(velocity.y, SPEED * direction.y, DELTA)
	update_visuals(direction)
	move_and_slide()
