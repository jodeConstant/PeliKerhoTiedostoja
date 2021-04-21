using System;

public class Program
{
	public static void Main()
	{
		//for-silmukkaesimerkki, Anssi Koskenrannan tyyliin, + omat kommentit

		//esitellään muuttuja:
		int i;

		/* for-silmukassa on yleensä 3 lauseketta sulkeiden sisällä
		 *		- ensimmäinen:	i = 0;	tämä suoritetaan yhden kerran alussa, ennen mitään muuta silmukassa
		 *		- toinen:		i < 10;	tämä on ehto jonka pitää olla tosi jotta silmukan suoritus jatkuisi (tai edes alkaisi)
		 *		- kolmas:		i++;	tämä lauseke suoritetaan aina silmukassa olevan koodin päätteksi
		 *								tarkoitus on, että toisen lausekkeen ehto ei enää toteudu tietyn toistojen määrän jälkeen
		 *								
		 *		i voitaisiin myös esitellä ensimmäisessä lausekkeessa, jos sitä ei tarvita muualla, ks. video:
		 *		https://www.youtube.com/watch?v=uQoy5PnNJbo&list=PLqB3L_mZaFc7K7cw-h0Oaj7hBwe38iITZ&index=6
		 */
		for (i = 0; i < 10; i++)
        {
			Console.WriteLine(i);
        }

		Console.WriteLine("--");//nämä tulostukset auttavat erottamaan mitkä tulostukset ovat silmukan sisällä

		Console.WriteLine(i);

		Console.WriteLine("--");

		i = 12;

		//ensimmäinen lauseke voidaan jättää tyhjäksi, jos käytetty muuttuja on 
        for ( ; i > 0; i--)
        {
			Console.WriteLine(i);
		}

		Console.WriteLine("--");

		Console.WriteLine(i);

		//muista varmistaa että silmukan ehto voi varmasti olla epätosi, eli False, kohtuullisen ajan sisällä
	}
}