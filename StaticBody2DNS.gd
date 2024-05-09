extends StaticBody2D

var item = 1


var prices = [1000, 1250, 790, 999, 3700, 3799, 678, 4537, 3468]

#var owned = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]

func _ready():
	update_ui()

func _process(delta):
	pass

func _physics_process(delta):
	if self.visible == true:
		$ItemPrice.bbcode_text = str(prices[item - 1])
	else:
		$ItemName.bbcode_text= "Out of coins"
			
func _on_right_pressed():
	swap_item_back()


func _on_left_pressed():
	swap_item_forward()


func _on_buy_pressed():
	var price = prices[item - 1]
	if Global.coins >= price:
		Global.coins -= price
		if item == 1:
			Global.clownchilli += 1
		elif item == 2:
			Global.grootroot += 1
		elif item == 3:
			Global.cinnamonwand += 1
		elif item == 4:
			Global.jellyfishpowder += 1
		elif item == 5:
			Global.dinosaurbutter += 1
		elif item == 6:
			Global.megladonextract += 1
		elif item == 7:
			Global.ferrumhedge += 1
		elif item == 8:
			Global.ashoftitanium += 1
		elif item == 9:
			Global.starplatinum += 1
		else:
			$ItemName.bbcode_text="Failed to pursache"
		update_ui()

func swap_item_back():
	item -= 1
	if item < 1:
		item = prices.size()
	update_ui() # Update UI when item is swapped

func swap_item_forward():
	item += 1
	if item > prices.size():
		item = 1
	update_ui() # Update UI when item is swapped

func update_ui():
	if item == 1:
		$ItemName.bbcode_text = "Clown Chilli"
		$ItemPrice.bbcode_text = str(Global.clownchilli)
	elif item == 2:
		$ItemName.bbcode_text = "Groot Root"
		$ItemPrice.bbcode_text = str(Global.grootroot)
	elif item == 3:
		$ItemName.bbcode_text = "Cinnamon Wand"
		$ItemPrice.bbcode_text = str(Global.cinnamonwand)
	elif item == 4:
		$ItemName.bbcode_text = "Jelly Fish Powder"
		$ItemPrice.bbcode_text = str(Global.jellyfishpowder)
	elif item == 5:
		$ItemName.bbcode_text = "Dinosaur Butter"
		$ItemPrice.bbcode_text = str(Global.dinosaurbutter)
	elif item == 6:
		$ItemName.bbcode_text = "Magladon Extract"
		$ItemPrice.bbcode_text = str(Global.megladonextract)
	elif item == 7:
		$ItemName.bbcode_text = "Ferrum Hedge"
		$ItemPrice.bbcode_text = str(Global.ferrumhedge)
	elif item == 8:
		$ItemName.bbcode_text = "Ash of Titanium"
		$ItemPrice.bbcode_text = str(Global.ashoftitanium)
	elif item == 9:
		$ItemName.bbcode_text = "Star Platinum"
		$ItemPrice.bbcode_text = str(Global.starplatinum)
	# Add similar conditions for the rest of the items

	


	


