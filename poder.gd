extends Node2D

var distancia 
var contador 
var direcao

# Called when the node enters the scene tree for the first time.
func _ready():
	distancia = 0
	contador = 0
	direcao = 1
func _process(delta):
	if direcao == -1 :
		$raio/Sprite.flip_h = true
	else:
		$raio/Sprite.flip_h = false
	if contador >= distancia :
		global_position.x = 0
		global_position.y = 0
		visible = false
	else :
		contador += 4
		global_position.x += 8*direcao
		visible = true
	
func ativar(value,direc):
	contador = 0
	distancia = value
	direcao = direc


func _on_Area2D_body_entered(body):
	if body.name != "Personagem":
		contador = distancia
		if body.name == "Inimigo" || body.name == "Mini" || body.name == "Mini2" :
			body.dano(2)
