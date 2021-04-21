using System;

public class Program
{
	public static void Main()
	{
		//ohessa on esimerkki ehtolauseiden toiminnasta
		//	käytetään myös funktiota käyttäjän syötteen lukemista varten

		//arvattava sana
		string sana = "kissa";
		//arvaus
		string arvaus;

		//luetaan käyttäjän arvaus
		Console.WriteLine("Miksi kutsutaan eläintä jonka tieteellinen nimi on 'Felis Catus'?");

		arvaus = Console.ReadLine();

		//verrataan oikeaa sanaa ja arvausta
		//	jos tekstimuuttujissa on sama teksti, tulostetaan onnittelut
		if (arvaus == sana)
		{
			Console.WriteLine("Oikein arvattu!");
		}
		//arvaus.ToLower() luo version tekstistä jossa ei ole isoja kirjaimia
		//kommentit lohkojen välissä eivät haittaa
		else if (arvaus.ToLower() == sana)
		{
			Console.WriteLine("Oikein arvattu! Mutta miksi käytit isoja kirjaimia?");
		}
		else
		{
			Console.WriteLine("Väärin!");
		}
	}
}