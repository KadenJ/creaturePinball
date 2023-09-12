extends Node2D

#goes on node that holds creature

@export var creature : CreatureTemplate

@onready var body = $body
@onready var button = $GridContainer/Button
@onready var button_2 = $GridContainer/Button2
@onready var type = $Type
@onready var creature_bg = $creatureBG

# Called when the node enters the scene tree for the first time.
var _load = true
var loadingPresetCreature = false
#have outside script change choose to false to load set creature
func _process(_delta):
	if _load == false:
		if creature:
			print("exists")
		else:
			creature = load("res://templates/default.tres")
		
		if creature.isShiny == false:
			body.texture = creature.sprite
		else:
			print("shiny creature")
			
		button.text = creature.attack1.name
		button_2.text = creature.attack2.name
		
		type.text = creature.types[creature.creatureType]
		creature_bg.color = creature.typeColors[creature.creatureType]
		_load = true

func _ready():
	pass
