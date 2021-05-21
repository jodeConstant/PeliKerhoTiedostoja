extends KinematicBody2D

#tarvitaan, jotta voidaan viitata tähän skriptiin/luokkaan suoraan nimellä
class_name PelaajaHahmo

# kaksoispiste tarkoittaa että muuttujan 'nopeus' tyyppiä ei voi muuttaa jatkossa
export var nopeus: = 350.0
export var hidastus_ennen_hyppya: = 0.5

var suunta: = Vector2.ZERO

export var hypyn_nopeus: = 1100.0
export var max_hypyn_kesto: = 0.5

var _hypyn_kesto: = 0.0

# 'onready' tarkoittaa että nämä viittaukset (muuttujat) asetetaan vasta kun skene tai peli käynnistyy
# Vaatii 'AnimationPlayer' solmun, nimien on täsmättävä myös
onready var _animation_player = get_node("AnimationPlayer")
# voidaan kirjoittaa myös näin:
#	$AnimatedSprite 
#	on sama kuin:
#	get_node("AnimatedSprite")
onready var _animaation_ohjaus = $AnimatedSprite

func _laske_suunta():
	# Vector2 -muuttujat luodaan seuraavasti:
	#	Vector2(x,y), esim: Vector2(1,0) tai Vector2(4,-9)
	# pitemmät lausekkeet voidaan jakaa useammalle riville, vaikka näin:
	suunta = Vector2(
		Input.get_action_strength("liiku_oikealle") - Input.get_action_strength("liiku_vasemmalle"),
		Input.get_action_strength("liiku_alas") - Input.get_action_strength("liiku_ylös")
		)
	# muistetaan sisennys ekan rivin jälkeen
	
	# .normalized() on funktio jota 
	#		kutsutaan esim. Vector2 tai Vector3 -muuttujalta pisteen kautta, kuten tässä nähdään
	#		palauttaa vektorin, jolla on sama suunta, mutta 'pituus' on 1
	suunta = suunta.normalized()
	# ei palauteta mitään, koska muokataan luokan muuttujaa 'nopeus' suoraan
	

func _physics_process(_delta):
	# käytetään funktiota suunnan laskemiseen, ja kerrotaan nopeudella
	# 	tuloksena on nopeusvektori, jonka 
	#		suuruus/"pituus" on asetettu nopeus
	#		suunta riippuu pelaajan ohjauksesta
	# _laske_suunta() muuttaa tämän skriptin 'suunta' -muuttujaa
	# move_and_slide() liikuttaa pelaajaa, tai muuta sopivaa skeneä:
	#	- tietyllä nopeudella tiettyyn suuntaan, kun sitä kutsutaan jatkuvasti
	#		- tarvitaan vektori, tässä Vector2 -tyyppinen arvo
	#	- ei anna liikkua esteiden läpi
	#	- esim. move_and_slide(Vector2(3,4)) liikuttaisi hahmoa:
	#		3 yksikköä / sekunti oikealle, ja 4 yksikköä / sekunti alas
	
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
		
	
	# Tarkistaa viittaako '_animated_sprite' -muuttuja johonkin solmuun
	if _animaation_ohjaus and nopeus > 0.0:
		# jos viittaus on asetettu oikein, kutsutaan skriptin funktiota
		_animaation_ohjaus.aseta_animaatio(suunta)
		
	# voidaan käyttää 'look_at' funktiota pelaajan kääntämiseen
	#	tarkemmin sanoen: positiivinen x-akseli (suunta 'oikealle') osoittaa tähän suuntaan,
	#	eli pelaajan (tai muun skenen) oikea reuna osoittaisi hiiren nuolen suuntaan
	#	soveltuu jos pitää esim. ampua hiiren suuntaan, ja liikkua erikseen
	#		tarvitaan varmaan täysin-ylhäältä hahmo/animaatio, jotta tämä näyttäisi hyvältä
	
	#look_at(get_global_mouse_position())


# Tämä funktio kutsutaan kun skene tai peli käynnistyy
func _ready():
	print_debug("PelaajaHahmo on valmis!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.get_action_strength("käytä"):
		print_debug("ei mitään käytettävää!")



func _poimi_esine(nimi):
	if nimi == "kolikko":
		print_debug(nimi)
