extends Node2D

var quantVidas
var morto
var inimigoMorto
var power
var inicio
var inicioInimigo
var quantBarras
var contadorMortePersonagem
var contadorFinal
var semcolision = false
func _ready():
	quantVidas = $Personagem.vida
	inicioInimigo = $Inimigo.global_position 
	morto = false
	inimigoMorto = false
	contadorMortePersonagem = 0
	inicio = $Personagem.global_position
	quantBarras = $Personagem.barraVida
	contadorFinal = 0

func _process(delta):
	if morto && contadorMortePersonagem < 100 :
		contadorMortePersonagem += 1
		$Personagem.global_position.y -= $Personagem.pulo
		$Personagem/Sprite.play("Morte")
		if !semcolision :
			$Personagem/CollisionShape2D.disabled = true
			semcolision = true
	elif(quantVidas <= 0 && !morto):
		quantVidas = 0
		morto = true
	elif morto :
			$HUD/Derrota.visible = true
	elif !morto:
		power = $Personagem.power
		if quantVidas != $Personagem.vida :
			quantVidas = $Personagem.vida
			if quantVidas > 0 :
				$Personagem.global_position = inicio
				$Personagem.barraVida = 8
		match quantVidas :
			3: 
				$"HUD/hud/Sprite/coração/3".visible = true
				$"HUD/hud/Sprite/coração/2".visible = false
				$"HUD/hud/Sprite/coração/1".visible = false
				$"HUD/hud/Sprite/coração/0".visible = false
			2: 
				$"HUD/hud/Sprite/coração/3".visible = false
				$"HUD/hud/Sprite/coração/2".visible = true
				$"HUD/hud/Sprite/coração/1".visible = false
				$"HUD/hud/Sprite/coração/0".visible = false
			1: 
				$"HUD/hud/Sprite/coração/3".visible = false
				$"HUD/hud/Sprite/coração/2".visible = false
				$"HUD/hud/Sprite/coração/1".visible = true
				$"HUD/hud/Sprite/coração/0".visible = false
			0: 
				$"HUD/hud/Sprite/coração/3".visible = false
				$"HUD/hud/Sprite/coração/2".visible = false
				$"HUD/hud/Sprite/coração/1".visible = false
				$"HUD/hud/Sprite/coração/0".visible = true
		quantBarras = $Personagem.barraVida
		match quantBarras :
			8:
				$"HUD/hud/Sprite/vidas".visible = true
			7:
				$"HUD/hud/Sprite/vidas".visible = false
				$"HUD/hud/Sprite/vidas - 1".visible = true
			6:
				$"HUD/hud/Sprite/vidas".visible = false
				$"HUD/hud/Sprite/vidas - 1".visible = false
				$"HUD/hud/Sprite/vidas - 2".visible = true
			5:
				$"HUD/hud/Sprite/vidas".visible = false
				$"HUD/hud/Sprite/vidas - 1".visible = false
				$"HUD/hud/Sprite/vidas - 2".visible = false
				$"HUD/hud/Sprite/vidas - 3".visible = true
			4:
				$"HUD/hud/Sprite/vidas".visible = false
				$"HUD/hud/Sprite/vidas - 1".visible = false
				$"HUD/hud/Sprite/vidas - 2".visible = false
				$"HUD/hud/Sprite/vidas - 3".visible = false
				$"HUD/hud/Sprite/vidas - 4".visible = true
			3:
				$"HUD/hud/Sprite/vidas".visible = false
				$"HUD/hud/Sprite/vidas - 1".visible = false
				$"HUD/hud/Sprite/vidas - 2".visible = false
				$"HUD/hud/Sprite/vidas - 3".visible = false
				$"HUD/hud/Sprite/vidas - 4".visible = false
				$"HUD/hud/Sprite/vidas - 5".visible = true
			2:
				$"HUD/hud/Sprite/vidas".visible = false
				$"HUD/hud/Sprite/vidas - 1".visible = false
				$"HUD/hud/Sprite/vidas - 2".visible = false
				$"HUD/hud/Sprite/vidas - 3".visible = false
				$"HUD/hud/Sprite/vidas - 4".visible = false
				$"HUD/hud/Sprite/vidas - 5".visible = false
				$"HUD/hud/Sprite/vidas - 6".visible = true
			1:
				$"HUD/hud/Sprite/vidas".visible = false
				$"HUD/hud/Sprite/vidas - 1".visible = false
				$"HUD/hud/Sprite/vidas - 2".visible = false
				$"HUD/hud/Sprite/vidas - 3".visible = false
				$"HUD/hud/Sprite/vidas - 4".visible = false
				$"HUD/hud/Sprite/vidas - 5".visible = false
				$"HUD/hud/Sprite/vidas - 6".visible = false
				$"HUD/hud/Sprite/vidas - 7".visible = true
			0:
				$"HUD/hud/Sprite/vidas".visible = false
				$"HUD/hud/Sprite/vidas - 1".visible = false
				$"HUD/hud/Sprite/vidas - 2".visible = false
				$"HUD/hud/Sprite/vidas - 3".visible = false
				$"HUD/hud/Sprite/vidas - 4".visible = false
				$"HUD/hud/Sprite/vidas - 5".visible = false
				$"HUD/hud/Sprite/vidas - 6".visible = false
				$"HUD/hud/Sprite/vidas - 7".visible = false
				$Personagem.vida -= 1
				if $Personagem.vida > 0 :
					$Personagem.barraVida = 8
			-1:
				$"HUD/hud/Sprite/vidas".visible = false
				$"HUD/hud/Sprite/vidas - 1".visible = false
				$"HUD/hud/Sprite/vidas - 2".visible = false
				$"HUD/hud/Sprite/vidas - 3".visible = false
				$"HUD/hud/Sprite/vidas - 4".visible = false
				$"HUD/hud/Sprite/vidas - 5".visible = false
				$"HUD/hud/Sprite/vidas - 6".visible = false
				$"HUD/hud/Sprite/vidas - 7".visible = false
				$Personagem.vida -= 1
				if $Personagem.vida > 1 :
					$Personagem.barraVida = 8
			-2:
				$"HUD/hud/Sprite/vidas".visible = false
				$"HUD/hud/Sprite/vidas - 1".visible = false
				$"HUD/hud/Sprite/vidas - 2".visible = false
				$"HUD/hud/Sprite/vidas - 3".visible = false
				$"HUD/hud/Sprite/vidas - 4".visible = false
				$"HUD/hud/Sprite/vidas - 5".visible = false
				$"HUD/hud/Sprite/vidas - 6".visible = false
				$"HUD/hud/Sprite/vidas - 7".visible = false
				$Personagem.vida -= 1
				if $Personagem.vida > 0 :
					$Personagem.barraVida = 8
	if !inimigoMorto :
		if $Inimigo.vida <= 0 :
			inimigoMorto = true
			$Inimigo.global_position = $Inimigo.global_position
			$Inimigo/Sprite.play("Morte")
			$Inimigo/vida.visible = false
	else:
		contadorFinal += 1
		if(contadorFinal >= 120):
			$HUD/Vitoria.visible = true
	if $Mini.vida <= 0 :
		$Mini/Sprite.play("Morte")
	if $Mini2.vida <= 0 :
		$Mini2/Sprite.play("Morte")
	if power :
		$"HUD/hud/Sprite/Poder true".visible = true
		$"HUD/hud/Sprite/Poder false".visible = false
	else:
		$"HUD/hud/Sprite/Poder true".visible = false
		$"HUD/hud/Sprite/Poder false".visible = true
		
func ativarAtaque(posicao,direcao):
	$poder.global_position = posicao
	$Personagem.power = false
	$poder.ativar(500,direcao)
func reiniciar():
	$Personagem.barraVida = 8
	$Personagem.vida = 3
	$Personagem.power = false
	$Personagem/CollisionShape2D.disabled = false
	$Personagem.global_position = inicio
	$Inimigo.vida = 4
	$Inimigo.global_position = inicioInimigo
	$Inimigo.z_index = 3
	$Inimigo/vida.visible = true
	$Inimigo/CollisionShape2D.scale = $Inimigo.collision
	$Inimigo/CollisionShape2D.position.y = $Inimigo.collision_position
	quantVidas = $Personagem.vida
	morto = false
	inimigoMorto = false
	contadorMortePersonagem = 0
	quantBarras = $Personagem.barraVida
	semcolision = false
	$HUD/Derrota.visible = false
	$HUD/Vitoria.visible = false
	$Itens/Item/Item.visible = true
	$Itens/Item2/Item.visible = true
	$Itens/Item3/Item.visible = true
	$Itens/Item4/Item.visible = true
	$Itens/ItemPoder/ItemPoder.visible = true
	$Itens/ItemPoder2/ItemPoder.visible = true
	$Mini.vida = 4
	$Mini2.vida = 4
	contadorFinal = 0
	contadorMortePersonagem = 0
	$Mini/CollisionShape2D.scale = $Mini.collision
	$Mini/CollisionShape2D.position.y = $Mini.collision_position
	$Mini2/CollisionShape2D.scale = $Mini2.collision
	$Mini2/CollisionShape2D.position.y = $Mini2.collision_position