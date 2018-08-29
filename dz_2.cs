
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dz_2_tip_Dannyh
{
    class Program
    {
        static int Number1;
        static int Number2;
        static int Number3;
        static double smetr;
        static double metr;
        static double radius;
        static double length;
        static double areaSquare;
        static double areaCircle;
        const double PiNumber= 3.14;
        static double volume2;
        static double mass2;
        static double volume1;
        static double mass1;
        static double density1;
        static double density2;
        static double resistance1;
        static double resistance2;
        static double tension1;
        static double tension2;
        static double current1;
        static double current2;
        static int min;
        static int max;
        static void Main(string[] args)
        {
            FirstTask();
            SecondTask();
            ThirdTask();
            FourthTask();
            FifthTask();
            SixthTask();
            SeventhTask();
            EighthTask();
            ninthTask();
            TenthTask();
        }
        static void FirstTask()
        {           
            Console.WriteLine("1.	Составить программу вывода на экран в одну строку трех любых чисел с двумя пробелами между ними.");

            Random random = new Random();
            min = -987657;
            max = -1 * min;

            Number1 = random.Next(min,max);
            Number2 = random.Next(min,max);
            Number3 = random.Next(min,max);

            Console.WriteLine(Number1+"  "+ Number2 + "  "+ Number3);
        }
        static void SecondTask()
        {
            Console.WriteLine("2.	Вывести на экран числа 5, 10 и 21 одно под другим.");

            Number1 = 5;
            Number2 = 10;
            Number3 = 21;

            Console.WriteLine(Number1+"\n"+Number2+"\n"+Number3);
        }
        static void ThirdTask()
        {
            Console.WriteLine("//3.Дано расстояние в сантиметрах. Найти число полных метров в нем.");
            Console.WriteLine("Введите сантиметры: ");

            smetr = double.Parse(Console.ReadLine());
            metr = smetr / 100;
           
            Console.WriteLine("Метры в " + smetr + " сантиметрах = " + metr);
        }
        static void FourthTask()
        {
            Console.WriteLine("4.С некоторого момента прошло 234 дня.Сколько полных недель прошло за этот период?");

            int days = 234;
            int weeks = days / 7;

            Console.WriteLine("В "+days+" днях "+weeks+" полных недель");
        }
        static private void FifthTask()
        {
            Console.WriteLine("5.Дано двузначное число. Найти: " +
                "\na.число десятков в нем;\nb.число единиц в нем;\nc.сумму его цифр;" +
            "\nd.произведение его цифр");
            Console.WriteLine("Введите двузначное число: ");

            int twoNumber = int.Parse(Console.ReadLine());

            int buferNumber = twoNumber;

            int CountTen = buferNumber / 10;

            buferNumber = twoNumber;

            int CountOne = buferNumber % 10;

            buferNumber = twoNumber;

            int CountCifr = CountOne + CountTen;

            Console.WriteLine("число десятков: " + CountTen + " \nчисло единиц " + CountOne +
                "\nсуммa цифр  " + CountCifr);
        }
        static protected void SixthTask(){
            Console.WriteLine("6.Вычислить значение логического выражения при следующих значениях" +
            " логических величин А, В и С: А = Истина, В = Ложь, С = Ложь:" +
            "\na.А или В; \nb.А и В; \nc.В или С.");

            bool A = true;
            bool B = false;
            bool C = false;

            Console.WriteLine("А или В : " + (A || B));
            Console.WriteLine("А и В : " + (A && B));
            Console.WriteLine("B или C : " + (B || C));
        }
        static protected void SeventhTask()
        {
            Console.WriteLine(" 7.Даны радиус круга и сторона квадрата.У какой фигуры площадь больше?");
            Console.WriteLine("Введите радиус круга: ");

            radius =double.Parse(Console.ReadLine());
            areaCircle=PiNumber* Math.Pow(radius, 2);

            Console.WriteLine("Введите длину стороны квадрата: ");

            length = double.Parse(Console.ReadLine());            
            areaSquare = Math.Pow(length, 2);

            Console.WriteLine("площадь круга = "+areaCircle +"\nплощадь квадрата= "+areaSquare);

            if (areaCircle > areaSquare) Console.WriteLine("Площадь круга больше");
            else if (areaCircle < areaSquare) Console.WriteLine("Площадь квадрата больше");
            else Console.WriteLine("площади круга и квадрата равные");
        }
        static protected void EighthTask()
        {            
            Console.WriteLine("8.Даны объемы и массы двух тел из разных материалов."
            +"Материал какого из тел имеет большую плотность?");

            Console.WriteLine("введите массу1: ");
            mass1 = double.Parse(Console.ReadLine());

            Console.WriteLine("введите массу2: ");
            mass2 = double.Parse(Console.ReadLine());

            Console.WriteLine("введите объем1: ");
            volume1 = double.Parse(Console.ReadLine());

            Console.WriteLine("введите объем2: ");
            volume2 = double.Parse(Console.ReadLine());

            density1 = volume1 * mass1;
            density2 = volume2 * mass2;

            Console.WriteLine("density1= "+density1+"\ndensity2= "+density2);

            if (density1 > density2) Console.WriteLine("density1 > density2");
            else if(density1<density2) Console.WriteLine("density1 < density2");
            else Console.WriteLine("density1 == density2");
        }
        static private void ninthTask()
        {
            Console.WriteLine("9.Известны сопротивления двух несоединенных друг с другом участков электрической цепи" +
            "\nи напряжение на каждом из них. По какому участку протекает меньший ток?");

            Console.WriteLine("введите сопротивление1: ");
            resistance1 = double.Parse(Console.ReadLine());

            Console.WriteLine("введите сопротивление2: ");
            resistance2 = double.Parse(Console.ReadLine());

            Console.WriteLine("введите напряжени1: ");
            tension1 = double.Parse(Console.ReadLine());

            Console.WriteLine("введите напряжени2: ");
            tension2 = double.Parse(Console.ReadLine());

            current1 = resistance1 * tension1;
            current2 = resistance2 * tension2;

            Console.WriteLine("сила токов: " +current1+"  "+current2);

            if (current1 > current2) Console.WriteLine("из второго");
            else if (current1 < current2) Console.WriteLine("из первого");
            else Console.WriteLine("оба одинаковые");
        }
        static private void TenthTask()
        {
            Console.WriteLine("10.	 Напечатать столбиком" +
            "\na.все целые числа от 20 до 35;" +
            "\nb.квадраты всех целых чисел от 10 до b(значение b вводится с клавиатуры; b > 10);" +
            "\nc.третьи степени всех целых чисел от a до 50 (значение a вводится с клавиатуры; a< 50);" +
            "\nd.все целые числа от a до b(значения a и b вводятся с клавиатуры; b > a).");

            max = 35;
            for(min=20; min<=max;min++ )
                Console.WriteLine(min);

            Console.WriteLine("введите значение для b(b>10): ");
            while (true)
            {
                max = int.Parse(Console.ReadLine());
                if (max > 10) break;
            }
            int extent = 2;
            for(min=10;min<=max;min++)
                Console.WriteLine(Math.Pow(min,extent));

            Console.WriteLine("введите значение для a(a<50): ");
            extent++;
            max = 50;
            while (true)
            {
                min = int.Parse(Console.ReadLine());
                if (min < 50) break;
            }
            Console.WriteLine("\n");
            for (; min <= max; min++)
                Console.WriteLine(Math.Pow(min, extent));

            Console.WriteLine("введите а: ");
            min = int.Parse(Console.ReadLine());

            Console.WriteLine("введите b(b>a): ");
            while (true)
            {
                max = int.Parse(Console.ReadLine());
                if (max > min) break;                
            }
            Console.WriteLine("\n");
            for(; min<=max;min++ )
                Console.WriteLine(min);
        }
    }
}
//      Console.WriteLine("");
