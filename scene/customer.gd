extends CharacterBody2D

func _ready():
	
	$AnimatedSprite2D.play("stare_left")
	$AnimatedSprite2D.play("stare_right")

func _on_dialogue_dialogue_finished():
	pass 


func _on_area_2d_body_entered(body):
		$Dialogue.start()



