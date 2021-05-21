extends AnimatedSprite

class_name AnimaationOhjaus

export var animaatio_paikalla: = "paikalla"
export var animaatio_norm_liike: = "liike_norm"

export var animaatio_suunta_ylos: = "_y"
export var animaatio_suunta_alas: = "_a"
export var animaatio_suunta_oikealle: = "_o"
export var animaatio_suunta_vasemmalle: = "_v"

var _animaationimi: = ""

var _viime_suunta: = Vector2.DOWN

func aseta_animaatio(var uusi_suunta: Vector2):
	# jos pelaaja liikkuu:
	#	paivitetään _viimeisin_suunta
	#	animaation tyypiksi valitaan kävely
	if uusi_suunta != Vector2.ZERO:
		_viime_suunta = uusi_suunta
		_animaationimi = animaatio_norm_liike
	else:
		_animaationimi = animaatio_paikalla
	
	# ehtolauseet käydään aina järjestyksessä
	#	tässä tapauksessa sivusuuntaliikkeet otetaan huomioon ennen pystysuuntliikkeitä
	if _viime_suunta.x > 0:
		_animaationimi = _animaationimi + animaatio_suunta_oikealle
	elif _viime_suunta.x < 0:
		_animaationimi = _animaationimi + animaatio_suunta_vasemmalle
	elif _viime_suunta.y < 0:
		_animaationimi = _animaationimi + animaatio_suunta_ylos
	else:
		# suunta on alas tai suuntaa ei ole asetettu
		_animaationimi = _animaationimi + animaatio_suunta_alas
		
	play(_animaationimi)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
