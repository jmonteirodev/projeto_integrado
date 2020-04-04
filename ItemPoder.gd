extends StaticBody2D


func _on_Area2D_area_entered(area):
	if area.get_parent().get_name() == "Personagem" && visible == true:
		area.get_parent().ativarPoder()
		visible = false
