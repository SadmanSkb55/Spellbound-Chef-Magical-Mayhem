extends StaticBody2D

func _ready():
	self.visible=true

func _on_submit_pressed():
	if Global.bladefury>4:
		Global.bladefury-4
		Global.coins+1000
		Global.salmon+10
		Global.tuna+10
		self.visible=false
	else:
		Global.coins-1000
		$RichTextLabel.bbcode_text="Punishment,-1000 yen"
