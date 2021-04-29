extends KinematicBody2D

# kaksoispiste tarkoittaa että muuttujan 'nopeus' tyyppi on aina 'Vector2'
export var nopeus: = 350.0
export var hidastus_ennen_hyppya: = 0.5

var suunta: = Vector2.ZERO

export var hypyn_nopeus: = 1100.0
export var max_hypyn_kesto: = 0.5

var _hypyn_kesto: = 0.0

func _laske_suunta():
	suunta = Vector2(
		Input.get_action_strength("liiku_oikealle") - Input.get_action_strength("liiku_vasemmalle"), 
		Input.get_action_strength("liiku_alas") - Input.get_action_strength("liiku_ylös")
		)
	# .normalized() on finktio jota 
	#		kutsutaan esim. Vector2 tai Vector3 -muuttujalta pisteen kautta, kuten tässä nähdään
	#		palauttaa vektorin, jolla on sama suunta, mutta 'pituus' on 1
	suunta = suunta.normalized()
	# ei palauteta mitään, koska muokataan luokan muuttujaa 'nopeus' suoraan
	

func _physics_process(_delta):
	# käytetään funktiota suunnan laskemiseen, ja kerrotaan nopeudella
	# 	tuloksena on nopeusvektori, jonka 
	#		suuruus/"pituus" on asetettu nopeus
	#		suunta riippuu pelaajan ohjauksesta
	# _laske_suunta()
	
	# jos pelaaja painaa hyppy-näppäintä, lisätään tulevan hypyn kestoa, rajoitukseen asti
	if Input.get_action_strength("hyppy"):
		if _hypyn_kesto < max_hypyn_kesto:
			_hypyn_kesto += _delta
			if _hypyn_kesto > max_hypyn_kesto:
				_hypyn_kesto = max_hypyn_kesto
		# pelaaja voi silti liikkua
		_laske_suunta()
		move_and_slide(suunta * nopeus * hidastus_ennen_hyppya)
		
	# jos EI paineta hyppy-näppäintä, jos hypyn kesto on suurempi kuin 0, JA suunta ei ole 0-vektori
	elif not Input.get_action_strength("hyppy") and _hypyn_kesto > 0.0:
		if suunta == Vector2.ZERO:
			_hypyn_kesto = 0.0
		move_and_slide(suunta * hypyn_nopeus)
		_hypyn_kesto -= _delta
		
	else:
		_hypyn_kesto = 0.0
		_laske_suunta()
		move_and_slide(suunta * nopeus)

# Called when the node enters the scene tree for the first time.
func _ready():
	print_debug("PelaajaHahmo on valmis!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.get_action_strength("käytä"):
		print_debug("ei mitään käytettävää!")
		
