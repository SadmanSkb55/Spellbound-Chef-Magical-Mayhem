extends StaticBody2D

var item = 1
var castitem = 1

var clownchilli = 0
var grootroot = 0
var cinnamonwand = 0

var jellyfishpowder = 0
var dinosaurbutter = 0
var megladonextract = 0

var ferrumhedge = 0
var ashoftitanium = 0
var starplatinum = 0

var spellcast = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("idle")
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite2D.play("idle")
	pass


func _on_up_pressed():
	swap_item_back()


func _on_down_pressed():
	swap_item_forward()

func swap_item_back():
	item -= 1
	if item < 1:
		updateUi()

func swap_item_forward():
	item += 1
	if item > 1:
		updateUi()

func swap_item_cast():
	castitem += 1
	if castitem >= 1:
		updateUi()
	else:
		item -= 1
		if castitem <= 1:
			updateUi()


func _on_add_pressed():
	if item == 1 and Global.clownchilli >= 1:
		clownchilli += 1
		Global.clownchilli -= 1
		$Ingredient.bbcode_text = "Clown Chilli"
	elif item == 2 and Global.grootroot >= 1:
		grootroot += 1
		Global.grootroot -= 1
		$Ingredient.bbcode_text = "Groot Root"
	elif item == 3 and Global.cinnamonwand >= 1:
		cinnamonwand += 1
		Global.cinnamonwand -= 1
		$Ingredient.bbcode_text = "Cinnamon Wand"
	elif item == 4 and Global.jellyfishpowder >= 1:
		jellyfishpowder += 1
		Global.jellyfishpowder -= 1
		$Ingredient.bbcode_text = "Jelly Fish Powder"
	elif item == 5 and Global.dinosaurbutter >= 1:
		dinosaurbutter += 1
		Global.dinosaurbutter -= 1
		$Ingredient.bbcode_text = "Dinosaur Butter"
	elif item == 6 and Global.megladonextract >= 1:
		megladonextract += 1
		Global.megladonextract -= 1
		$Ingredient.bbcode_text = "Magladon Extract"
	elif item == 7 and Global.ferrumhedge >= 1:
		ferrumhedge += 1
		Global.ferrumhedge -= 1
		$Ingredient.bbcode_text = "Ferrum Hedge"
	elif item == 8 and Global.ashoftitanium >= 1:
		ashoftitanium += 1
		Global.ashoftitanium -= 1
		$Ingredient.bbcode_text = "Ash of Titanium"
	elif item == 9 and Global.starplatinum >= 1:
		starplatinum += 1
		Global.starplatinum -= 1
		$Ingredient.bbcode_text = "Star Platinum"
	updateUi()

func _on_next_pressed():
	swap_item_cast()

func _on_cast_spell_pressed():
	var randomNumber = randi() % 10 + 1
	if randomNumber <= 7:
		spellcast = false
	else:
		if castitem == 1:
			if clownchilli >= 1 and grootroot >= 1 and cinnamonwand >= 1:
				Global.spicefall + 1
				clownchilli - 1
				grootroot - 1
				cinnamonwand - 1
				spellcast = true
		elif castitem == 2:
			if jellyfishpowder >= 1 and dinosaurbutter >= 1 and megladonextract >= 1:
				Global.bakeblast + 1
				jellyfishpowder - 1
				dinosaurbutter - 1
				megladonextract - 1
				spellcast = true
		else:
			if ferrumhedge >= 1 and ashoftitanium >= 1 and starplatinum > 1:
				Global.bladefury + 1
				ferrumhedge - 1
				ashoftitanium - 1
				starplatinum - 1
				spellcast = true
	updateUi()

func updateUi():
	if castitem == 1:
		$ItemName.bbcode_text = "Spice fall"
	elif castitem == 2:
		$ItemName.bbcode_text = "Bake Blast"
	else:
		$ItemName.bbcode_text = "Blade Fury"
	if spellcast:
		$Condition.bbcode_text = "Casted"
	else:
		$Condition.bbcode_text = "failed"

	if item == 1:
		$Ingredient.bbcode_text = "Clown Chilli"
	elif item == 2:
		$Ingredient.bbcode_text = "Groot Root"
	elif item == 3:
		$Ingredient.bbcode_text = "Cinnamon Wand"
	elif item == 4:
		$Ingredient.bbcode_text = "Jelly Fish Powder"
	elif item == 5:
		$Ingredient.bbcode_text = "Dinosaur Butter"
	elif item == 6:
		$Ingredient.bbcode_text = "Magladon Extract"
	elif item == 7:
		$Ingredient.bbcode_text = "Ferrum Hedge"
	elif item == 8:
		$Ingredient.bbcode_text = "Ash of Titanium"
	elif item == 9:
		$Ingredient.bbcode_text = "Star Platinum"
