extends Area2D

signal poiminta(nimi)

func _on_Kolikko_body_entered(body):
	# yritetään luoda muuttuja 'pelaaja' muuttujasta body
	#	onnistuu VAIN jos 'body' on tyyppiä 'PelaajaHahmo', 
	#	eli kyseisessä solmussa/skenessä on kiinnitetty 'PelaajaHahmo' -niminen skripti
	#		'PelaajaHahmo.gd' nimi ei riitä, itse skriptissä pitää olla seuraava rivi:
	#			class_name PelaajaHahmo
	var pelaaja: = body as PelaajaHahmo
	# jos 'body' EI ole oikean tyyppinen, 'pelaaja' -muuttujan arvoksi tulee 'null'
	#	tällöin seuraava ehto ei pidä paikkaansa, ja signaalia ei lähetetä
	if pelaaja:
		# lähetetään signaali 'poiminta' , parametrilla "kolikko"
		emit_signal("poiminta", "kolikko")
		print_debug("uusi signaali lähetetty!")
		# poistetaan solmu johon tämä skripti on kiinnitetty, 
		#	eli tässä tapauksessa kolikko ja sen osat
		queue_free()
