extends TextureRect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle()
func toggle():
	show()
	get_tree().paused=true
	if Input.is_action_just_pressed("ui_cancel"):
		unpause()
func unpause():
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused=false
		hide()
