extends ProgressBar

class_name healthbar

@export var player: Player

#func _ready():
	#player.healthChanged.connect(update)
	#update()
#
#func update():
	#value = player.currentHealth
