extends KinematicBody2D


# Declare member variables here. Examples:
var speed = 100
#Carregar uma cena em memória
var pre_bullet = preload("res://scenes/Bullet.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir_x = 0
	var dir_y = 0
	if(Input.is_action_pressed("ui_right")):
		dir_x += 1
	if(Input.is_action_pressed("ui_left")):
		dir_x -= 1
	if(Input.is_action_pressed("ui_up")):
		dir_y -= 1
	if(Input.is_action_pressed("ui_down")):
		dir_y += 1
		
	if(Input.is_action_just_pressed("ui_shooting")):
		# print("boom")
		var shots = get_tree().get_nodes_in_group("cannonBullets")
		if shots.size()  < 4:
			var bullet = pre_bullet.instance()
			bullet.global_position = $barrel/origin.global_position
			bullet.dir = Vector2(cos(rotation), sin(rotation)).normalized()
			$barrel/animation.play("fire")
			$"../".add_child(bullet)
			
		
	look_at(get_global_mouse_position())
	
	translate(Vector2(dir_x, dir_y) * delta * speed)

