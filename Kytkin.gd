extends Area2D

class_name Kytkin

# voiko tämä kytkin 'käynnistää' kohteen:
export var voi_kaynnistaa: bool = true
# voiko tämä kytkin 'sammuttaa' kohteen:
export var voi_sammuttaa: bool = true

# muuttuuko kytkimen kuva aina kun sitä käytetään riippumatta kohteen tilasta:
export var irrallinen_tila: bool = true
#	katso skriptin lopussa 'aseta_tila' -funktio

# vaihtaa kytkimen asentoa/tilaa alussa
export var siirretty_alussa: = false

export var vaadittu_tavara: String
export var vaadittu_maara: int = 1

onready var kuva: = $Kuva

var _pelaaja: PelaajaHahmo

# ohjaa valittua/valittuja objekteja
#	yhdistetään käsin skenessä halutun objektin skriptin funktioon
signal kytkin_signaali(on, off)

# tämä funktio yhdistetään pelaajan, eli 'PelaajaHahmo' -skriptin omaavan skenen
# lähettämään signaaliin, kun pelaaja tulee kosketuksiin kytkimen alueen kanssa
func _laheta_signaali(var tavarat: Dictionary):
	# löytyy tarvittavat
	#	pitää tarkistaa onko 'kokoelmassa' vaadittava nimi, ennen kuin voi edes tarkistaa määrää
	if tavarat.has(vaadittu_tavara):
		if (tavarat[vaadittu_tavara] >= vaadittu_maara):
			emit_signal("kytkin_signaali", voi_kaynnistaa, voi_sammuttaa)
	# TAI vaadittu_tavara on tyhjä, eli ei vaadita mitään
	elif vaadittu_tavara == "":
		emit_signal("kytkin_signaali", voi_kaynnistaa, voi_sammuttaa)
		
	if irrallinen_tila:
		if kuva.frame == 0:
			kuva.frame = 1
		else:
			kuva.frame = 0
	print_debug("signaali lähetetty")

# tämä funktio suoritetaan aina kun jokin fyysinen hahmo/kappale/muu vastaava
# tulee kosketuksiin kytkimen alueen kanssa
func _on_Kytkin_body_entered(body):
	# tarkistetaan onko kyseessä pelaaja, 
	#	yrittämällä luoda 'PelaajaHahmo' -tyyppinen muuttuja, muuttujasta 'body'
	#		jos tämä onnistuu, kyseessä on pelaaja
	# jos havaittiin pelaaja, yhdistetään sen skriptistä/luokasta löytyvä signaali 
	#	voidaan myös tarkistaa tässä onko pelaajalla vaadittu avain
	var hahmo = body as PelaajaHahmo
	if hahmo:
		hahmo.connect("interact", self, "_laheta_signaali")

# tämä funktio suoritetaan aina kun jokin fyysinen hahmo/kappale/muu vastaava
# poistuu kytkimen alueelta
func _on_Kytkin_body_exited(body):
	var hahmo = body as PelaajaHahmo
	if hahmo:
		hahmo.disconnect("interact", self, "_laheta_signaali")
	
# voidaan asettaa kytkimen tila/ulkonäkö sen ohjaaman kohteen tilan mukaan
# yhdistämällä signaali kohteesta takaisin tähän
# 	voi jättää käyttämättä
func aseta_tila(var tila: bool):
	if tila:
		kuva.frame = 1
	else:
		kuva.frame = 0

func _ready():
	if siirretty_alussa:
		kuva.frame = 1
