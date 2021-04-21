using System;

namespace DataTestingMain
{
    public class Pelaaja
    {
        public int paikka_x;
        public int paikka_y;
        public char merkki = 'X';

        public void Siirto(int vaaka, int pysty)
        {
            /*

            suunta voi olla:
            ylös          y = y - 1
            alas          y = y + 1
            vasemmalle    x = x - 1
            oikealle      x = x + 1
            */
        }
    }

    public class Vihollinen
    {
        public int paikka_x;
        public int paikka_y;

        public void Siirto(int x, int y)
        {
            //liikkuu kohti pelaajaa joka toisella siirrolla
        }
    }

    public class Program
    {
        public static int vasenRaja = 0;
        public static int oikeaRaja = 10;
        public static int yläraja = 0;
        public static int alaRaja = 10;

        public static void Main(string[] args)
        {
            int siirto = 0;

            string syote;
            
            int leveys = 10;
            int korkeus = 10;
            string tulostus;

            Pelaaja pelaaja = new Pelaaja();
            Vihollinen vihollinen = new Vihollinen();

            do//pääsilmukka
            {
                do//pelaajan komennot
                {
                    //ohjeet:
                    Console.WriteLine("Ohjaus:\n \"vasemmalle\"\n \"oikealle\"\n \"ylös\"\n \"alas\"");
                    Console.WriteLine("Tai: \"lopeta\"");
                    Console.WriteLine();
                    syote = Console.ReadLine();
                    if (syote == "ylös")
                    {
                        Console.WriteLine("Siirrytään ylös");
                        pelaaja.Siirto(0, -1);
                        break;
                    }
                    else if (syote == "vasemmalle")
                    {
                        Console.WriteLine("Siirrytään vasemmalle");
                        pelaaja.Siirto(-1, 0);
                        break;
                    }
                    else if (syote == "alas")
                    {
                        Console.WriteLine("Siirrytään alas");
                        pelaaja.Siirto(0, 1);
                        break;
                    }
                    else if (syote == "oikealle")
                    {
                        Console.WriteLine("Siirrytään oikealle");
                        pelaaja.Siirto(1, 0);
                        break;
                    }
                    else
                    {
                        Console.WriteLine("väärä komento!");
                    }

                } while (syote != "lopeta");

                siirto++;

                if (siirto % 2 == 0)
                {
                    vihollinen.Siirto(pelaaja.paikka_x, pelaaja.paikka_y);
                }

                for (int y = 0; y < korkeus; y++)
                {
                    tulostus = "";
                    for (int x = 0; x < leveys; x++)
                    {
                        if (pelaaja.paikka_x == x && pelaaja.paikka_y == y)
                        {
                            tulostus += pelaaja.merkki;//"piirretään" pelaaja tulostuksen oikeaan kohtaan
                        }
                        else
                        {
                            tulostus += '.';//"piirretään" tyhjää
                        }
                    }
                    Console.WriteLine(tulostus);
                }

            } while (syote != "lopeta");
        } 
    }
}
