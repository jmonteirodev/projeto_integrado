extends StaticBody2D
var motion = Vector2()
var flip = true
var posicao_init
var posicao_final
var velocidade = 1
var velocidadeRapida = 3
var noChao = false
var pula = true
var cont = 3
var parar = false
var temBlocoFrente = true
var temBlocoFrentePula = true

func _ready():
	posicao_init = $".".position.x;
	posicao_final = posicao_init + 200

func _physics_process(delta):
	temBlocoFrente = $blocoFrente.is_colliding()
	temBlocoFrentePula = $blocoFrentePula.is_colliding()
	if(!temBlocoFrente && temBlocoFrentePula):
		position.x += 20
	#print("posx= ",global_position.x," id: ",identificador)
	#else:
		#if($Nafrente.is_colliding() && $Nafrente.get_collider().get_name() == "Personagem"):
		#	$".".position.x += velocidadeRapida
		#	posicao_final - $Nafrente.get_collider().get_position().x
		#elif($Atras.is_colliding() && $Atras.get_collider().get_name() == "Personagem"):
		#	position.x += -velocidadeRapida
		#	posicao_init - $Atras.get_collider().get_position().x
		#else:
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
func _on_Area2D_area_entered(area):
	parar = true
