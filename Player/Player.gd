extends RigidBody2D

var motion = Vector2.ZERO
var angularVelocity = 0

export(int) var SPEED = 5000
export(int) var ANGULAR_SPEED = 0.1
export(int) var TRAY_MASS = 65535

onready var motionTimer = $MotionTimer
onready var hitPlayer = $HitPlayer

var scores = 0

signal scores_changed(scores)

# TODO: think about using inertia
func _ready():
	gravity_scale = 0
	mass = TRAY_MASS

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_left"):
		motion.x -= SPEED * delta
		motionTimer.start()
	if Input.is_action_just_pressed("ui_right"):
		motion.x += SPEED * delta
		motionTimer.start()

	set_linear_velocity(motion)

func _on_Timer_timeout():
	motion = Vector2.ZERO

func _on_ScoreArea_body_entered(food_entered):
	if food_entered is Food:
		scores += food_entered.calories
		change_user_scores()

func _on_ScoreArea_body_exited(food_exited):
	if food_exited is Food:
		scores -= food_exited.calories
		change_user_scores()

func change_user_scores():
	emit_signal("scores_changed", scores)

func _on_Player_body_entered(body):
	if GlobalStats.is_sound_on:
		hitPlayer.play()
