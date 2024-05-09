extends StaticBody2D

var item = 1
var prices = [150, 250, 350, 450, 550]
var itemstaken = 0

func _ready():
	update_ui()

func _process(delta):
	update_ui()
	pass

func _on_right_pressed():
	swap_item_back()

func swap_item_back():
	item -= 1
	if item < 1:
		item = prices.size()
	update_ui()

func _on_sell_pressed():
	var price = prices[item - 1]
	if item == 1:
		if Global.nigiri >= 1:
			Global.nigiri -= itemstaken
			Global.coins += Global.PrcOfnigiri * itemstaken
	elif item == 2:
		if Global.sashimi >= 1:
			Global.sashimi -= itemstaken
			Global.coins += Global.PrcOfsashimi * itemstaken
	elif item == 3:
		if Global.maki >= 1:
			Global.maki -= itemstaken
			Global.coins += Global.PrcOfmaki * itemstaken
	elif item == 4:
		if Global.teamki >= 1:
			Global.teamki -= itemstaken
			Global.coins += Global.PrcOftamki * itemstaken
	elif item == 5:
		if Global.gunkan >= 1:
			Global.gunkan -= itemstaken
			Global.coins += Global.PrcOfgunkan * itemstaken
	update_ui()

func _on_add_more_pressed():
	itemstaken += 1
	update_ui()

func update_ui():
	if item == 1:
		$icon.play("nigiri")
		$ItemName.bbcode_text = "Nigiri"
		$amtavailable.bbcode_text = str(Global.nigiri)
		$TotalYen.bbcode_text = str(Global.PrcOfnigiri * itemstaken)
	elif item == 2:
		$icon.play("sashmi")
		$ItemName.bbcode_text = "Sasami"
		$amtavailable.bbcode_text = str(Global.sashimi)
		$TotalYen.bbcode_text = str(Global.PrcOfsashimi * itemstaken)
	elif item == 3:
		$icon.play("maki")
		$ItemName.bbcode_text = "Maki"
		$amtavailable.bbcode_text = str(Global.maki)
		$TotalYen.bbcode_text = str(Global.PrcOfmaki * itemstaken)
	elif item == 4:
		$icon.play("temaki")
		$ItemName.bbcode_text = "Temaki"
		$amtavailable.bbcode_text = str(Global.teamki)
		$TotalYen.bbcode_text = str(Global.PrcOftamki * itemstaken)
	elif item == 5:
		$icon.play("gunkan")
		$ItemName.bbcode_text = "Gunkan"
		$amtavailable.bbcode_text = str(Global.gunkan)
		$TotalYen.bbcode_text = str(Global.PrcOfgunkan * itemstaken)
