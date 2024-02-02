extends Control




func _on_quit_button_pressed():
	get_tree().quit()

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")
