extends Node2D

onready var _animaatio_soitin = $AnimationPlayer

export var auki: = true

signal ilmoita_tila(tila)

func aseta_tila(var voi_avata: bool, var voi_sulkea: bool):
	# jos ovi on auki,
	# ja kytkin voi sulkea oven / 'sammuttaa' kohteen
	if auki and voi_sulkea:
		auki = false
		_animaatio_soitin.play_backwards("Avaus")
	# jos ovi on kiinni, 
	# ja kytkin voi voi avata oven / 'käynnistää' kohteen
	elif (not auki) and voi_avata:
		auki = true
		_animaatio_soitin.play("Avaus")
		
	emit_signal("ilmoita_tila", auki)

func _ready():
	if auki:
		_animaatio_soitin.play("Avaus")
		_animaatio_soitin.advance(_animaatio_soitin.current_animation_length)
