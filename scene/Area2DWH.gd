extends Area2D

var entered = false

func _on_body_entered(body: PhysicsBody2D) -> void:
	#print("Body entered")
	entered = true

func _on_body_exited(body: PhysicsBody2D) -> void:
	#print("Body exited")
	entered = false

func _process(delta):
	if entered && Input.is_action_just_pressed("ui_accept"):
		#print("clicked")
		get_tree().change_scene_to_file("res://world_3.tscn")
		#get_tree().change_scene_to_packed(pscene)
		#get_tree().call_deferred("change_scene_to_file",pscene)
		
	
		
  
