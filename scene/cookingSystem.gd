extends StaticBody2D

#@onready var pb: ProgressBar = $ProgressBar

var itemIng = 1
var itemDish = 1
var cookItemIndex=1
var amtIng = 0
var amtDish = 0



var lineup="cook/"

var nigiri="cook/Rice+Vinegar+Wasabi+Tuna+Salmon+Nori+Salt+Spicefall+Bladefury+Bakeblast+"
var sashmi="cook/Salmon+SoySauce+Wasabi+Salt+Spicefall+"
var maki="cook/Nori+Rice+Vinegar+Cucumber+Avocado+Tuna+Salt+Bakeblast+Bladefury+"
var temaki="cook/Rice+Vinegar+Nori+Salmon+Cucumber+Avocado+Salt+Bladefury"
var gunkan="cook/Rice+Vinegar+Salmon+Salt+Spicefall"

var filling_duration: float = 5.0  # Duration for filling the progress bar (in seconds)
var fill_speed: float = 70.0  # Speed at which progress bar fills (in units per second)
var current_fill_time: float = 0.0  # Current fill time

var cooking=false

func _ready():
	updateIngUi()
	updateDishUi()
	pass

func _process(delta):
	updateIngUi()
	updateDishUi()
	if cooking:
		current_fill_time += delta
		var fill_amount = current_fill_time / filling_duration * fill_speed
		#pb.value = clamp(fill_amount, 0.0, 100.0)
		cooking = false


func _on_add_items_pressed():
	if itemIng == 1 and Global.nori >= 1:
		Global.nori -= 1
		#nori += 1
		lineup += "Nori+"
	elif itemIng == 2 and Global.rice >= 1:
		Global.rice -= 1
		#rice += 1
		lineup += "Rice+"
	elif itemIng == 3 and Global.soysauce >= 1:
		Global.soysauce -= 1
		#soysauce += 1
		lineup += "SoySauce+"
	elif itemIng == 4 and Global.wasabi >= 1:
		Global.wasabi -= 1
		#wasabi += 1
		lineup += "Wasabi+"
	elif itemIng == 5 and Global.pickledginger >= 1:
		Global.pickledginger -= 1
		#pickledginger += 1
		lineup += "Pickled Ginger+"
	elif itemIng == 6 and Global.ricevinegar >= 1:
		Global.ricevinegar -= 1
		#ricevinegar += 1
		lineup += "Vinegar+"
	elif itemIng == 7 and Global.sugar >= 1:
		Global.sugar -= 1
		#sugar += 1
		lineup += "Sugar+"
	elif itemIng == 8 and Global.salt >= 1:
		Global.salt -= 1
		#salt += 1
		lineup += "Salt+"
	elif itemIng == 9 and Global.tuna >= 1:
		Global.tuna -= 1
		#tuna += 1
		lineup += "Tuna+"
	elif itemIng == 10 and Global.salmon >= 1:
		Global.salmon -= 1
		#salmon += 1
		lineup += "Salmon+"
	elif itemIng == 11 and Global.crabmeat >= 1:
		Global.crabmeat -= 1
		#crabmeat += 1
		lineup += "Crabmeat+"
	elif itemIng == 12 and Global.cucumber >= 1:
		Global.cucumber -= 1
		#cucumber += 1
		lineup += "Cucumber+"
	elif itemIng == 13 and Global.avocado >= 1:
		Global.avocado -= 1
		#avocado += 1
		lineup += "Avocado+"
	elif itemIng == 14 and Global.carrot >= 1:
		Global.carrot -= 1
		#carrot += 1
		lineup += "Carrot+"
	elif itemIng == 15 and Global.onions >= 1:
		Global.onions -= 1
		#onions += 1
		lineup += "Onions+"
	elif itemIng == 16 and Global.seed >= 1:
		Global.seed -= 1
		#seed += 1
		lineup += "Seed+"
	elif itemIng == 17 and Global.mirin >= 1:
		Global.mirin -= 1
		#mirin += 1
		lineup += "Mirin+"
	elif itemIng == 18 and Global.spicefall >= 1:
		Global.spicefall-= 1
		#spicefall+= 1
		lineup += "Spicefall+"
	elif itemIng == 19 and Global.bakeblast>= 1:
		Global.bakeblast-= 1
		#bakeblast+= 1
		lineup += "Bakeblast+"
	elif itemIng == 20 and Global.bladefury >= 1:
		Global.bladefury-= 1
		#bladefury+= 1
		lineup += "Bladefury+"

func _on_left_pressed():
	swap_item_back()

func _on_right_pressed():
	swap_item_forward()

func swap_item_back():
	itemIng -= 1
	if itemIng < 1:
		updateIngUi()

func swap_item_forward():
	itemIng += 1
	if itemIng > 1:
		updateIngUi()

func _on_next_pressed():
	swap_item_back_Dish()

func _on_previous_pressed():
	swap_item_forward_Dish()

func swap_item_back_Dish():
	itemDish += 1
	if itemDish > 1:
		updateDishUi()

func swap_item_forward_Dish():
	itemDish -= 1
	if itemDish < 1:
		updateDishUi()

func _on_cook_pressed():
	if cookItemIndex == 1:
		if lineup == nigiri and canCookNigiri():
			cookNigiri()
		else:
			showCookingResult("Failed: Incorrect lineup or Insufficient ingredients")
	elif cookItemIndex == 2:
		if lineup == sashmi and canCookSashmi():
			cookSashmi()
		else:
			showCookingResult("Failed: Incorrect lineup or Insufficient ingredients")
	elif cookItemIndex == 3:
		if lineup == maki and canCookMaki():
			cookMaki()
		else:
			showCookingResult("Failed: Incorrect lineup or Insufficient ingredients")
	elif cookItemIndex == 4:
		if lineup == temaki and canCookTemaki():
			cookTemaki()
		else:
			showCookingResult("Failed: Incorrect lineup or Insufficient ingredients")
	elif cookItemIndex == 5:
		if lineup == gunkan and canCookGunkan():
			cookGunkan()
		else:
			showCookingResult("Failed: Incorrect lineup or Insufficient ingredients")
	else:
		showCookingResult("Failed")

func canCookNigiri():
	return Global.nori >= 1 and Global.rice >= 1 and Global.ricevinegar >= 1 and Global.wasabi >= 1 and Global.tuna >= 1 and Global.salmon >= 1 and Global.salt >= 1 and Global.spicefall >= 1 and Global.bladefury >= 1 and Global.bakeblast >= 1

func cookNigiri():
	Global.nori -= 1
	Global.rice -= 1
	Global.ricevinegar -= 1
	Global.wasabi -= 1
	Global.tuna -= 1
	Global.salmon -= 1
	Global.salt -= 1
	Global.spicefall -= 1
	Global.bladefury -= 1
	Global.bakeblast -= 1
	Global.nigiri += 1
	showProcess()

func canCookSashmi():
	return Global.salmon >= 1 and Global.soysauce >= 1 and Global.wasabi >= 1 and Global.salt >= 1 and Global.spicefall >= 1

func cookSashmi():
	Global.salmon -= 1
	Global.soysauce -= 1
	Global.wasabi -= 1
	Global.salt -= 1
	Global.spicefall -= 1
	Global.sashimi += 1
	showProcess()

func canCookMaki():
	return Global.nori >= 1 and Global.rice >= 1 and Global.ricevinegar >= 1 and Global.cucumber >= 1 and Global.avocado >= 1 and Global.tuna >= 1 and Global.salt >= 1 and Global.bladefury >= 1 and Global.bakeblast >= 1

func cookMaki():
	Global.nori -= 1
	Global.rice -= 1
	Global.ricevinegar -= 1
	Global.cucumber -= 1
	Global.avocado -= 1
	Global.tuna -= 1
	Global.salt -= 1
	Global.bladefury -= 1
	Global.bakeblast -= 1
	Global.maki += 1
	showProcess()

func canCookTemaki():
	return Global.rice >= 1 and Global.ricevinegar >= 1 and Global.nori >= 1 and Global.salmon >= 1 and Global.cucumber >= 1 and Global.avocado >= 1 and Global.salt >= 1 and Global.bladefury >= 1

func cookTemaki():
	Global.rice -= 1
	Global.ricevinegar -= 1
	Global.nori -= 1
	Global.salmon -= 1
	Global.cucumber -= 1
	Global.avocado -= 1
	Global.salt -= 1
	Global.bladefury -= 1
	Global.temaki += 1
	showProcess()

func canCookGunkan():
	return Global.rice >= 1 and Global.ricevinegar >= 1 and Global.salmon >= 1 and Global.salt >= 1 and Global.spicefall >= 1

func cookGunkan():
	Global.rice -= 1
	Global.ricevinegar -= 1
	Global.salmon -= 1
	Global.salt -= 1
	Global.spicefall -= 1
	Global.gunkan += 1
	showProcess()

func showProcess():
	pass

func showCookingResult(result):
	$Status.bbcode_text = "Cooking"
	$Result.bbcode_text = result


func updateDishUi():
	if itemDish == 1:
		$icon2.play("nigiri")
		$Sushiname.bbcode_text = "Nigiri"
	elif itemDish == 2:
		$icon2.play("sashmi")
		$Sushiname.bbcode_text = "Sasami"
	elif itemDish == 3:
		$icon2.play("maki")
		$Sushiname.bbcode_text = "Maki"
	elif itemDish == 4:
		$icon2.play("temaki")
		$Sushiname.bbcode_text = "Temaki"
	elif itemDish == 5:
		$icon2.play("gunkan")
		$Sushiname.bbcode_text = "Gunkan"

func updateIngUi():
	$itemsaddedonqueue.bbcode_text=lineup
	if itemIng == 1:
		$icon.play("Nori")
		$ItemName.bbcode_text = "Nori"
		$AAm.bbcode_text = str(Global.nori)
	elif itemIng == 2:
		$icon.play("rice")
		$ItemName.bbcode_text = "Rice"
		$AAm.bbcode_text = str(Global.rice)
	elif itemIng == 3:
		$icon.play("soysauce")
		$ItemName.bbcode_text = "Soy Sauce"
		$AAm.bbcode_text = str(Global.soysauce)
	elif itemIng == 4:
		$icon.play("wasabi")
		$ItemName.bbcode_text = "Wasabi"
		$AAm.bbcode_text = str(Global.wasabi)
	elif itemIng == 5:
		$icon.play("pickledginger")
		$ItemName.bbcode_text = "Pickled Ginger"
		$AAm.bbcode_text = str(Global.pickledginger)
	elif itemIng == 6:
		$icon.play("vinegar")
		$ItemName.bbcode_text = "Rice Vinegar"
		$AAm.bbcode_text = str(Global.ricevinegar)
	elif itemIng == 7:
		$icon.play("sugar")
		$ItemName.bbcode_text = "Sugar"
		$AAm.bbcode_text = str(Global.sugar)
	elif itemIng == 8:
		$icon.play("salt")
		$ItemName.bbcode_text = "Salt"
		$AAm.bbcode_text = str(Global.salt)
	elif itemIng == 9:
		$icon.play("tuna")
		$ItemName.bbcode_text = "Tuna"
		$AAm.bbcode_text = str(Global.tuna)
	elif itemIng == 10:
		$icon.play("salmon")
		$ItemName.bbcode_text = "Salmon"
		$AAm.bbcode_text = str(Global.salmon)
	elif itemIng == 11:
		$icon.play("crabmeat")
		$ItemName.bbcode_text = "Crabmeat"
		$AAm.bbcode_text = str(Global.crabmeat)
	elif itemIng == 12:
		$icon.play("cucumber")
		$ItemName.bbcode_text = "Cucumber"
		$AAm.bbcode_text = str(Global.cucumber)
	elif itemIng == 13:
		$icon.play("avocado")
		$ItemName.bbcode_text = "Avocado"
		$AAm.bbcode_text = str(Global.avocado)
	elif itemIng == 14:
		$icon.play("carrot")
		$ItemName.bbcode_text = "Carrot"
		$AAm.bbcode_text = str(Global.carrot)
	elif itemIng == 15:
		$icon.play("onion")
		$ItemName.bbcode_text = "Onion"
		$AAm.bbcode_text = str(Global.onions)
	elif itemIng == 16:
		$icon.play("seed")
		$ItemName.bbcode_text = "Seed"
		$AAm.bbcode_text = str(Global.seed)
	elif itemIng == 17:
		$icon.play("mirin")
		$ItemName.bbcode_text = "Mirin"
		$AAm.bbcode_text = str(Global.mirin)
	elif itemIng == 18:
		$icon.play("mirin")
		$ItemName.bbcode_text = "Spicefall"
		$AAm.bbcode_text = str(Global.spicefall)
	elif itemIng == 19:
		$icon.play("mirin")
		$ItemName.bbcode_text = "Bakeblast"
		$AAm.bbcode_text = str(Global.bakeblast)
	elif itemIng == 20:
		$icon.play("mirin")
		$ItemName.bbcode_text = "bladefury"
		$AAm.bbcode_text = str(Global.bladefury)
	


