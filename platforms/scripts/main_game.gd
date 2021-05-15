extends Node

var stars = 0

func _on_player_col_area_entered(area):
	if area.name == "star":
		area.get_parent().queue_free()
		show_star()
		
	if area.name == "damage":
		print("Tomou dano")
	elif area.name == "kill":
		area.get_parent().queue_free()
		$player.jump()

func show_star():
	stars += 1
	if stars == 1:
		$star_status/star1/on.show()
	elif stars == 2:
		$star_status/star2/on.show()
	elif stars == 3:
		$star_status/star3/on.show()
		get_tree().change_scene("res://scences/main_game2.tscn")
