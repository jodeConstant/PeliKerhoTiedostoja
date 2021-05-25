extends KinematicBody2D

class_name Hahmo

# koostuu avaimista ja niitä vastaavista arvoista
# tässä tapauksessa avain olisi tavaran nimi tekstinä, ja sitä vastaisi sen määrä
export var tavarat: Dictionary

func _poimi_esine(nimi):
	# jos tälläinen esine löytyy jo, lisätään määrää yhdellä
	if tavarat.has(nimi):
		tavarat[nimi] = tavarat[nimi] + 1
	# jos ei löydy, asetetaan arvoksi 1
	else:
		tavarat[nimi] = 1
	print_debug(nimi)
