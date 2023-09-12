extends Node2D

@onready var p_1_spawn = $p1Spawn

var creature1 = preload("res://templates/fireking.tres")
var creaturesList = []

var p1Choose = false

func _ready():
	#get different folders depending on creature type due to creatures being world dependant
	#this script would go on board to create creature list
	var dir = DirAccess.open("res://templates/")
	#if fire creature open ("res://templates/fire/")
	if dir:
		dir.list_dir_begin()
		var fileName = dir.get_next()
		while fileName != "":
			if dir.current_is_dir():
				print("Found directory: " + fileName)
			else:
				print("Found file: " + fileName)
				creaturesList.append("res://templates/" + fileName)
			fileName = dir.get_next()
	print(creaturesList)
	#go into directory
	#get creature files
	#append to array creatures


#player 1 chooses creature
#player2 chooses creature
#load creature to correct template

#load and randomize creatures
#load preset creature(caught creatures,load creature template then shiny and accessory options)
#save creatureList position and accessory options
#make json that saves creature list number, isShiny, and hasAccessory 

var creatureAlreadyMade = false
func _on_button_pressed():
	#grabs and loads creature from creatureList
	#set creature desired creature resource before loading 
	#can be changed from button presed to load creature to anything
	if creatureAlreadyMade == false:
		p_1_spawn.add_child(load("res://scenes/creature.tscn").instantiate())
		var creatureListLocation = creaturesList[1] #could change to random creature using randi
		p_1_spawn.get_child(0).creature = load(creatureListLocation) #load creature resource to creature template scene
		var shinyNumb = randi() % 4
		print(shinyNumb)
		if shinyNumb == 3:
			p_1_spawn.get_child(0).creature.isShiny = true
		else:
			p_1_spawn.get_child(0).creature.isShiny = false
		p_1_spawn.get_child(0)._load = false #set choose bool to false to start creature load
		creatureAlreadyMade = true
	


func _on_button_2_pressed():
	#deletes creature from scene
	if p_1_spawn.get_child_count() != 0:
		for i in p_1_spawn.get_children():
			i.queue_free()
	creatureAlreadyMade = false

func _on_button_3_pressed():
	if creatureAlreadyMade == true:
		saveCreature()

var saveList = 0
func saveCreature():
	#var dir = DirAccess.open("res://savedCreatures/")
	saveList = DirAccess.open("res://savedCreatures/").get_files().size()
	var savedCreature = p_1_spawn.get_child(0).creature
	saveList += 1
	var result = ResourceSaver.save(savedCreature, "res://savedCreatures/" + str(saveList) + ".tres")#need to save to different files
	assert(result == OK)


func _on_button_4_pressed():
	loadCreature("res://savedCreatures/1.tres")
	
#set to load chosen creatures
func loadCreature(fileName):
	if creatureAlreadyMade == false:
		if ResourceLoader.exists(fileName):
			p_1_spawn.add_child(load("res://scenes/creature.tscn").instantiate())
			p_1_spawn.get_child(0).creature = ResourceLoader.load(fileName)
			p_1_spawn.get_child(0)._load = false
		creatureAlreadyMade = true
