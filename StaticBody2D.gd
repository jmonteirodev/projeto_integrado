extends StaticBody2D
var flip = true
var posicao_init
var posicao_final
var velocidade = 1
var viu = false
var identificador = null

func _ready():
	posicao_init = $".".position.x;
	posicao_final = posicao_init + 200
	
func _physics_process(delta):
	#print("posx= ",global_position.x," id: ",identificador)
	if($Nafrente.is_colliding() && $Nafrente.get_collider().get_name() == "Personagem"):
		viu = true
		identificador = $Nafrente.get_collider().get_position().x
		velocidade = 4
	elif($Atras.is_colliding() && $Atras.get_collider().get_name() == "Personagem"):
		viu = true
		identificador = $Atras.get_collider().get_position().x
		velocidade = 4
	else:
		viu = false
		velocidade = 1
	if(viu):
		if $".".global_position.x < identificador:
			$".".position.x += velocidade
		else:
			position.x += -velocidade
	else:
		if(posicao_init <= posicao_final and flip):
			$".".position.x += velocidade
			$Sprite.flip_h = false
			if $".".position.x >= posicao_final :
				flip = false
		if($".".position.x >= posicao_init and !flip):
			$".".position.x += -velocidade
			$Sprite.flip_h = true
			if $".".position.x <= posicao_init :
				flip = true
		
		
func dano():
	$".".queue_free()