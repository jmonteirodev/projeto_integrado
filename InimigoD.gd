extends KinematicBody2D

var motion = Vector2()
const UP = Vector2(0,-1)
const GRAVIDADE = 20
var velocidade
var direcao
var vida
var contadorDentro
var limitRadar
var ataque
var contadorRadar
var invensivel
var contadorInvensivel
var semchao 
var semchao2 
var semchao3 
var contadorAtaque
var encontrou = false
var collision
var collision_position
func _ready():
	collision = $CollisionShape2D.scale
	collision_position = $CollisionShape2D.position.y
	vida = 4
	velocidade = 200
	direcao = 1
	ataque = 1
	contadorRadar = 0
	limitRadar = 20
	invensivel = false
	contadorInvensivel = 0
	contadorAtaque = 60
	semchao = true
	semchao2 = false
	contadorDentro = 1

func _physics_process(delta):
	if vida > 0 :
		z_index = 4
		contadorDentro -= 1
		semchao3 = semchao2
		semchao2 = semchao
		semchao = $Baixo.is_colliding()
		if is_on_wall() || (!semchao && !semchao2 && !semchao3):
			if is_on_wall() && $Frente.is_colliding() :
				if($Frente.get_collider().get_name() != "Personagem" && $Frente.get_collider().get_name() != "poder") && contadorDentro < 0 :
					direcao *= -1	
			elif is_on_wall() && contadorDentro < 0 :
				direcao *= -1
			elif !semchao && !semchao2 && !semchao3 :
				if contadorDentro < 0 :
					direcao *= -1	
		else:
			contadorAtaque += 1
		if invensivel :
			contadorInvensivel += 1
			if(contadorInvensivel >= 60) :
				invensivel = false
				contadorInvensivel = 0
		$vida.text = String(vida)
		if vida > 0 :
			if contadorDentro < 0 :
				motion.x = velocidade * direcao
				$Sprite.play("Andar")
			elif contadorDentro > 0 && ((!semchao && !semchao2 && !semchao3) || is_on_wall()):
				motion.x = 0
				$Sprite.play("Parado")
			direcao()
			radar()
			if $Frente.is_colliding() :
				if($Frente.get_collider().get_name() == "Personagem"):
					$Frente.get_collider().dano(direcao,ataque)
					contadorAtaque = 0
					$Sprite.play("Ataque")
	else:
		z_index = 1
		motion.x = 0
		$CollisionShape2D.scale.x = 0
		$CollisionShape2D.scale.y = 0
		$CollisionShape2D.position.y = 120
	motion.y += GRAVIDADE
	motion = move_and_slide(motion,UP)


func dano(value):
	if !invensivel :
		vida -= value
		invensivel = true
		global_position.y -= 50


func _on_visaoArea_area_entered(area):
	if area.name == "pegarItem" :
		contadorAtaque = 0
		contadorDentro = 5
		if(area.global_position.x <= global_position.x):
			direcao = -1	
		else:
			direcao = 1	
func radar():
	$visaoArea/radar.scale.x = contadorRadar
	$visaoArea/radar.scale.y = contadorRadar
	contadorRadar += 8
	if contadorRadar >= limitRadar :
		contadorRadar = 1
	match vida:
		4:
			velocidade = 200
			limitRadar = 25
			ataque = 3
			$Sprite.speed_scale = 1.5
		3:
			velocidade = 200
			limitRadar = 25
			ataque = 3
			$Sprite.speed_scale = 1.5
		2:
			velocidade = 250
			limitRadar = 30
			ataque = 4
			$Sprite.speed_scale = 1.5
		1:
			velocidade = 300
			limitRadar = 40
			ataque = 4
			$Sprite.speed_scale = 2

func direcao():
	if direcao == -1 :
		$Sprite.flip_h = false
		$Sprite.position.x = -78.097
		$Frente.rotation_degrees = 90
		$Sprite.position.x = -60
		$Baixo.position.x = -76.596
		$Frente.cast_to.y = 170
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1;
	else:
		$Sprite.flip_h = true
		$Sprite.position.x = 44.37
		$Frente.rotation_degrees = 270
		$Sprite.position.x = 59.274
		$Baixo.position.x = 44.596
		$Frente.cast_to.y = 130
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1;
