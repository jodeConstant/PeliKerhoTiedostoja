extends StaticBody2D

onready var _ovi = $CollisionShape2D
onready var _avattu = $Auki
onready var _suljettu = $Kiinni

signal ilmoita_tila(tila)

# avaa/sulje
# pitää päättää mikä tila on 'päällä' ja mikä on 'pois päältä'
#	tässä tapauksessa avattu ovi on 'päällä' ja suljettu 'pois päältä'
func aseta_tila(var voi_avata: bool, var voi_sulkea: bool):
	# jos ovi on kiinni, eli törmäykset ovat päällä, eli eivät ole sammutettuja, 
	# ja kytkin voi voi avata oven / 'käynnistää' kohteen
	if (not _ovi.disabled) and voi_avata:
		_ovi.disabled = true		# sammutetaan törmäykset
		_avattu.visible = true		# asetetaan 'avattu' kuva näkyväksi
		_suljettu.visible = false	# piilotetaan 'suljettu' kuva
	# jos ovi on auki, eli törmäykset ovat sammutettuja,
	# ja kytkin voi sulkea oven / 'sammuttaa' kohteen
	elif _ovi.disabled and voi_sulkea:
		_ovi.disabled = false		# asetetaan törmäykset päälle
		_avattu.visible = false		# piilotetaan 'avattu' kuva
		_suljettu.visible = true	# asetetaan 'suljettu' kuva näkyväksi
	
	# jos törmäykset päällä, ovi on suljettu, eli pois päältä
	# jos törmaykset pois päältä, ovi on avattu, eli päällä
	emit_signal("ilmoita_tila", not _ovi.disabled)
