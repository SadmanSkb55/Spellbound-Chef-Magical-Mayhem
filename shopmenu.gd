extends StaticBody2D

var item = 1


var prices = [500, 250, 350, 450, 550, 650, 750, 850, 150, 250, 350, 450, 550, 650, 750, 850, 950, 150, 250, 350, 450, 550]

#var owned = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]

func _ready():
	$icon.play("Nori")
	update_ui()

func _physics_process(delta):
	if self.visible == true:
		$RichTextLabel.text = str(prices[item - 1])
		if Global.coins >= prices[item - 1]:
			$condiLable.text = "Available"
		else:
			$condiLable.text = "Out of coins"

func _on_left_b_pressed():
	swap_item_back()

func _on_right_b_pressed():
	swap_item_forward()

func _on_button_pressed():
	var price = prices[item - 1]
	if Global.coins >= price:
		Global.coins -= price
		print("Coin gg")
		print(Global.coins)
		if item == 1:
			Global.nori += 1
			print("Nori added")
			print(Global.nori)
		elif item == 2:
			Global.rice += 1
		elif item == 3:
			Global.soysauce += 1
		elif item == 4:
			Global.wasabi += 1
		elif item == 5:
			Global.pickledginger += 1
		elif item == 6:
			Global.ricevinegar += 1
		elif item == 7:
			Global.sugar += 1
		elif item == 8:
			Global.salt += 1
		elif item == 9:
			Global.tuna += 1
		elif item == 10:
			Global.salmon += 1
		elif item == 11:
			Global.crabmeat += 1
		elif item == 12:
			Global.cucumber += 1
		elif item == 13:
			Global.avocado += 1
		elif item == 14:
			Global.carrot += 1
		elif item == 15:
			Global.onions += 1
		elif item == 16:
			Global.seed += 1
		elif item == 17:
			Global.mirin += 1
		
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
		$icon.play("Nori")
	elif item == 2:
		$icon.play("rice")
	elif item == 3:
		$icon.play("soysauce")
	elif item == 4:
		$icon.play("wasabi")
	elif item == 5:
		$icon.play("pickledginger")
	elif item == 6:
		$icon.play("vinegar")
	elif item == 7:
		$icon.play("sugar")
	elif item == 8:
		$icon.play("salt")
	elif item == 9:
		$icon.play("tuna")
	elif item == 10:
		$icon.play("salmon")
	elif item == 11:
		$icon.play("crabmeat")
	elif item == 12:
		$icon.play("cucumber")
	elif item == 13:
		$icon.play("avocado")
	elif item == 14:
		$icon.play("carrot")
	elif item == 15:
		$icon.play("onion")    
	elif item == 16:
		$icon.play("seed")
	elif item == 17:
		$icon.play("mirin")
