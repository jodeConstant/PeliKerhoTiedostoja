using System;

public class Program
{
	public static void Main()
	{
		//while-silmukkaesimerkki

		//esitellään muuttuja:
		int x = 0;

		/* while-silmukassa oleva koodi suoritetaan toistuvasti niin kauan kuin sulkeissa oleva ehto on tosi
		 *		- ohjelmoijan pitää huolehtia siitä että silmukassa olevan koodi tekee ehdolausekkeen tuloksesta False:n
		 *		TAI että silmukka voidaan keskeyttää, esim. käyttäjän syötteen avulla
		 *		
		 *		ks. video: https://www.youtube.com/watch?v=uQoy5PnNJbo
		 */
		while (x < 10)
        {
			Console.WriteLine(x);
			x++;//tämä pitää huolen että silmukka ei pyöri loputtomasti
        }

		Console.WriteLine("--");

        while (false)
        {
			Console.WriteLine("while");//tätä ei suoriteta kertaakaan
        }
		Console.WriteLine();
		do
		{
			Console.WriteLine("doWhile");//tämä suoritetaan kerran
		} while (false);

		/* Seuraavaklsi katsotaan miten silmukan voi keskeyttää
		 *		- tätä voi tarvita jos haluaa keskeyttää silmukan ilman että suoritetaan lupot sen koodista
		 */

		string vastaus = "kissa";
		string arvaus = "";

		Console.WriteLine("Miksi kutsutaan eläintä jonka tieteellinen nimi on 'Felis Catus'?");//sama triviakysymys kuin ehtolause-esimerkissä

		while (true)//tämä silmukka suoritettaisiin loputtomasti, ellei..
		{
			arvaus = Console.ReadLine();
			if (arvaus == vastaus)
			{
				Console.WriteLine("Oikea vastaus!");
				//break-komento keskeyttää silmukan suorituksen
				break;
			}
			
            Console.WriteLine("Väärin!");
		}
	}
}