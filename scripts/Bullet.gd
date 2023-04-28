extends Area2D


# Declare member variables here. Examples:
var dir = Vector2(0, -1) setget set_dir
var speed = 200 # pixel/seg

func set_dir(val):
	dir = val
	rotation = dir.angle()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	translate(dir * speed * delta)


func _on_VisibilityNotifier2D_screen_exited():
	print("Sai da tela")
	queue_free()
	
