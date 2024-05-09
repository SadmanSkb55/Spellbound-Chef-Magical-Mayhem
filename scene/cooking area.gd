extends Area2D


func _ready():
	self.visible=false
	pass

func _process(delta):
	#self.visible=false
	pass

func _on_body_entered(body: PhysicsBody2D):
	if body.has_method("player"):
		print("Entered")
		self.visible=true

func _on_body_exited(body):
	self.visible=false

