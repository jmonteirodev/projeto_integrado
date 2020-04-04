extends Node2D
func perderVida():
	$vidas.text = String(2)
	
func _ready():
	perderVida()

func _on_reiniciar_pressed():
	get_parent().get_parent().reiniciar()


func _on_reiniciar2_pressed():
	get_parent().get_parent().reiniciar()
