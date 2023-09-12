class_name CreatureTemplate
extends Resource

#arrays alligned with eachOther
var types = ["NORMAL", "AIR", "WATER", "FIRE", "GRASS"]
var typeColors = [Color.DARK_GRAY, Color.BEIGE, Color.SKY_BLUE, Color.FIREBRICK, Color.SEA_GREEN]
#can the 2 arrays be changed to 1 dictionary ex) 1:"FIRE",Color.Red

@export var name = ""
@export var sprite = Texture2D
@export var isShiny = false

@export var health = 10
@export var stamina = 15


@export var creatureType = 0

#removeable for pinball creature
@export var attack1 = AttackTemplate
@export var attack2 = AttackTemplate


#for pinball
#could different folders sorted with different types

