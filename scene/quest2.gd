extends StaticBody2D

func _ready():
	self.visible=true

func _on_submit_pressed():
	if Global.nigiri>1 and Global.sashimi>1 and Global.maki>1 and Global.teamki>1 and Global.gunkan:
		Global.coins+10000
		Global.spicefall+1
		Global.bakeblast+1
		Global.bladefury+1
		self.visible=false
	else:
		Global.coins-1000
		$RichTextLabel.bbcode_text="Punishment,-1000 yen"
