extends KinematicBody2D

var motion = Vector2()
const UP = Vector2(0,-1)
const GRAVIDADE = 20
var direcao
var velocidade
var vida
var invensivel
var ataque
var contadorInvensivel
var contadorAtaque
var semchao
var semchao2
var semchao3
var collision
var collision_position

# Called when the node enters the scene tree for the first time.
func _ready():
	collision = $CollisionShape2D.scale
	collision_position = $CollisionShape2D.position.y
	vida = 1
	velocidade = 200
	direcao = 1
	ataque = 2
	invensivel = false
	contadorInvensivel = 0
	contadorAtaque = 60
	semchao = true
	semchao2 = false

func _process(delta):
	if vida > 0 :
		z_index = 4
		semchao3 = semchao2
		semchao2 = semchao
		semchao = $Baixo.is_colliding()
		if contadorAtaque >= 25 :
			$Sprite.play("Andar")
		else:
			contadorAtaque += 1
		if invensivel :
			contadorInvensivel += 1
			if(contadorInvensivel >= 60) :
				invensivel = false
				contadorInvensivel = 0
		if is_on_wall() || (!semchao && !semchao2 && !semchao3):
			if is_on_wall() && $Frente.is_colliding() :
				if($Frente.get_collider().get_name() != "Personagem" && $Frente.get_collider().get_name() != "poder") :
					direcao *= -1	
			elif is_on_wall() :
				direcao *= -1
			elif !semchao && !semchao2 && !semchao3 :
					direcao *= -1	
			if $Frente.is_colliding() :
				if($Frente.get_collider().get_name() == "Personagem"):
					$Frente.get_collider().dano(direcao,ataque)
					contadorAtaque = 0
					$Sprite.play("Ataque")
		direcao()		
		motion.x = velocidade * direcao
	else:
		motion.x = 0
		$CollisionShape2D.scale.x = 0
		$CollisionShape2D.scale.y = 0
		$CollisionShape2D.position.y = 80
		z_index = 1
	motion.y += GRAVIDADE
	motion = move_and_slide(motion,UP)
func dano(value):
	if !invensivel :
		vida -= value
		invensivel = true
		global_position.y -= 50

func direcao():
	if direcao == -1 :
		$Sprite.flip_h = false
		$Frente.rotation_degrees = 180
		$Sprite.position.x = -60
		$Baixo.position.x = -25
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1;
	else:
		$Sprite.flip_h = true
		$Frente.rotation_degrees = 0
		$Sprite.position.x = 59.274
		$Baixo.position.x = 25
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1;
