extends KinematicBody2D

var personagem = Vector2()
const CHAO = Vector2(0,-1);
const GRAVIDADE = 20
const VELOCIDADE = 350
const ALTURAPULO = -850
var vida
var invensivel
var contadorInvensivel
var power
var direcao = 1
var barraVida
var pulo
var tempoPoder

func _ready():
	personagem = Vector2()
	vida = 3
	invensivel = false
	contadorInvensivel = 0
	power = true
	barraVida = 8
	tempoPoder = 40

func _physics_process(delta):
	tempoPoder += 1
	personagem.y += GRAVIDADE
	if invensivel :
		contadorInvensivel += 1
		if(contadorInvensivel >= 120) :
			invensivel = false
			contadorInvensivel = 0
	if vida > 0 :
		if Input.is_action_pressed("ui_right"):
			$Sprite.flip_h = false
			$Sprite.position.x = -4.523
			personagem.x = VELOCIDADE
			direcao = 1
			$Sprite.play("Andar")
		elif Input.is_action_pressed("ui_left"):
			$Sprite.flip_h = true
			$Sprite.position.x = -4.477
			direcao = -1
			personagem.x = -VELOCIDADE
			$Sprite.play("Andar")
		elif Input.is_action_pressed("AtivarPoder") && power:
			$Sprite.play("Poder")
			$".".get_parent().ativarAtaque(global_position,direcao)
			tempoPoder = 0
		else:
			if tempoPoder >= 40 :
				$Sprite.play("Parada")
			personagem.x = 0
	if is_on_floor() :
		if Input.is_action_pressed("ui_up"):
			personagem.y = ALTURAPULO
	elif vida <= 0 :
		personagem.x = 0
		$Sprite.play("Morte")
	else:
		$Sprite.play("Pulo")
	personagem = move_and_slide(personagem, CHAO)

func _on_dano_body_entered(body):
	if body.name == "Morte" :
		vida -= 1
		if vida > 0:
			barraVida = 8
		else:
			pulo = 10

func dano(direcao,value):
	if !invensivel :
		$".".global_position.x += direcao*20
		personagem.y = ALTURAPULO/2
		barraVida -= value
		invensivel = true
		pulo = 5
	
func ganharVida():
	if barraVida < 8 :
		barraVida += 1

func ativarPoder():
	power = true

func _on_dano_area_entered(area):
	if area.name == "areaDano" && vida > 0 :
		if area.get_parent().vida > 0 :
			area.get_parent().dano(1)
			personagem.y = ALTURAPULO/2
			$Sprite.play("Pulo")
		
