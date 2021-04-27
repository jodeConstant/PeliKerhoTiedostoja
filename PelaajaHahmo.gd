extends KinematicBody2D

export var nopeus: = 350.0
export var suunta: = Vector2.ZERO

func _physics_process(delta):
	suunta = Vector2(
		Input.get_action_strength("liiku_oikealle") - Input.get_action_strength("liiku_vasemmalle"),
		Input.get_action_strength("liiku_alas") - Input.get_action_strength("liiku_ylös")
		)
		
	move_and_slide(suunta * nopeus)
	# huomatkaa, että kun liikutaan viistosuuntaan, hahmo liikkuu vähän nopeammin
	# tämä johtuu siitä, että esim. vektori Vector2(1, 1) on 'pitempi' kuin Vector2(1, 0)
	# kokeilkaa vaihtaa yllä olevan rivin koodi seuraavaan:
	#move_and_slide(suunta.normalized * nopeus)