extends GridContainer

@onready var node_2d = $".."

signal attackPressed (AttackTemplate)


func _on_button_pressed():
	
	if node_2d.creature.stamina >= node_2d.creature.attack1.staminaUse:
		node_2d.creature.stamina -= node_2d.creature.attack1.staminaUse
		attackPressed.emit(node_2d.creature.attack1)
		print(node_2d.creature.attack1.name)
	else:
		print("not enough Stamina")
	

func _on_button_2_pressed():
	if node_2d.creature.stamina >= node_2d.creature.attack2.staminaUse:
		node_2d.creature.stamina -= node_2d.creature.attack2.staminaUse
		attackPressed.emit(node_2d.creature.attack2)
		print(node_2d.creature.attack2.name)
	else:
		print("not enough Stamina")
