extends Area2D

func _on_portal_body_entered(_body):
	get_tree().change_scene_to_file("res://Level/house.tscn")
