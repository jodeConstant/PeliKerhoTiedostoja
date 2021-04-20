using System;

/*
Luokka (class) on ohjelmakoodin kokonaisuus joka sisältää:
    - muuttujia
    - funktioita

Ideana on, että kootaan ominaisuuksia ja toimintoja yhteen kokonaisuuteen.
Tällöin luokka on uusi tietotyyppi, joka mahdollistaa sen tyyppisten muuttujien luomisen.
    Muuttujia joiden tyyppi on jokin luokka, sanotaan olioiksi

Tässä on esimerkkinä luokka Nelio. (vältetään ä ja ö -kirjaimia itse koodissa)

    Nelio -luokalla on 2 omaa muuttujaa, ja 2 omaa funktiota
    avainsana public tarkoittaa että muut ohjelman osat voivat vapaasti käyttää luokkaa, muuttujia ja funktioita


*/

public class Nelio
{
	public float korkeus = 1;
	public float leveys = 1;

	public float PintaAla()
	{
		return korkeus * leveys;
	}

	public float Ymparys()
	{
		return korkeus * 2 + leveys * 2;
	}
}

/*Huomaa että Main -funktio on osa luokkaa Program, mutta tästä luokasta ei tehdä olioita*/

public class Program
{
	public static void Main(string[] args)
	{
		//luodaan uusi Nelio- olio
		//  tyyppinä on luokan nimi, vertaa int, float
		//  tarvitaan avainsanaa new kun luodaan uusi olio tällä tavalla
		Nelio nelio = new Nelio();
		float pinta_ala;

		//objektien / olioiden sisältöön, kuten muuttujiin ja funktioihin, pääsee pisteen kautta
		//  tässä kutsutaan, eli suoritetaan, objektin PintaAla -funktio
		//  tallennetaan tulos muuttujaan
		pinta_ala = nelio.PintaAla();

		//vertaa Console.WriteLine, mutta siinä käytetään *luokan* nimeä, Console

		Console.WriteLine(pinta_ala);//tulostaa oletusarvojen mukaan

		//tässä asetetaan Nelio-objektin arvot korkeus ja leveys
		nelio.korkeus = 2f;
		nelio.leveys = 3f;

		//haetaan pinta-ala uudestaan kuten ennen
		pinta_ala = nelio.PintaAla();

		//nyt tulos on erilainen
		Console.WriteLine(pinta_ala);
	}
}