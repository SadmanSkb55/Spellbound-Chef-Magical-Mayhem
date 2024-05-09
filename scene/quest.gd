extends StaticBody2D

func _ready():
	self.visible=true

func _on_submit_pressed():
	if Global.spicefall>1 and Global.bakeblast>1 and Global.bladefury>1:
		Global.coins+100000
		Global.nigiri+3
		self.visible=false
	else:
		Global.coins-1000
		$RichTextLabel.bbcode_text="Punishment,-1000 yen"
