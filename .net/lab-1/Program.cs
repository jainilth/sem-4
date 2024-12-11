using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace lab_1
{
    public class Program
    {
        static void Main(string[] args)
        {
            //program 1
            Console.WriteLine("thummar jainil");
            Console.WriteLine("rajkot");
            Console.WriteLine("1322021025");
            Console.WriteLine("rajkot");

            //Program 2
            int num1 = Convert.ToInt32(Console.ReadLine());
            int num2 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine(num1);
            Console.WriteLine(num2);

            //program 3
            Console.WriteLine("enter your name");
            string name = (Console.ReadLine());
            Console.WriteLine("enter your country");
            string country = (Console.ReadLine());
            Console.WriteLine("hello " + name + " from country " + country);

            //program 4
            Console.WriteLine("enter size of side");
            int side = Convert.ToInt32(Console.ReadLine());
            int area = side * side;
            Console.WriteLine(area);

            //program 5
            Console.WriteLine("enter size of side");
            double side1 = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("enter length and width");
            double length = Convert.ToDouble(Console.ReadLine());
            double width = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("enter radius of circle");
            double radius = Convert.ToDouble(Console.ReadLine());
            double areaOfSquare = side1 * side1;
            double areaOfRec = 2 * (length + width);
            double areaOfCircle = 2 * 3.14 * radius * radius;
            Console.WriteLine(areaOfSquare);
            Console.WriteLine(areaOfRec);
            Console.WriteLine(areaOfCircle);

            //program 6
            Console.WriteLine("enter temprature in degree");
            double degree = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("enter temprature in fahrenhit");
            double fahrenheit = Convert.ToDouble(Console.ReadLine());
            double dtof = (9 / 5 * degree) + 32;
            double ftod = 5 / 9 * (fahrenheit - 32);
            Console.WriteLine(dtof);
            Console.WriteLine(ftod);

            //program 7
            Console.WriteLine("enter principle");
            double principle = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("enter rate");
            double rate = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("enter time");
            double time = Convert.ToDouble(Console.ReadLine());
            double interest = principle * rate * time / 100;
            Console.WriteLine(interest);

            //program 8
            Console.WriteLine("enter number a and b");
            int a = Convert.ToInt32(Console.ReadLine());
            int b = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter choose operation 1:add,2:sub,3:mul,4:div");
            int c = Convert.ToInt32(Console.ReadLine());
            int ans = 0;
            if (c == 1)
            {
                ans = a + b;
            }
            else if (c == 2)
            {
                ans = a - b;
            }
            else if (c == 3)
            {
                ans = a * b;
            }
            else if (c == 4)
            {
                ans = a / b;
            }
            else
            {
                Console.WriteLine("please enter proper number");
            }
            Console.WriteLine(ans);
            //swich case
            switch (c)
            {
                case 1:
                    Console.WriteLine(a + b); break;
                case 2:
                    Console.WriteLine(a - b); break;
                case 3:
                    Console.WriteLine(a * b); break;
                case 4:
                    Console.WriteLine(a / b); break;
                default:
                    Console.WriteLine("please enter proper number");
                    break;
            }

            //program 9
            int d = Convert.ToInt32(Console.ReadLine());
            int e = Convert.ToInt32(Console.ReadLine());
            e = d + e;
            d = e - d;
            e = e - d;
            Console.WriteLine(d);
            Console.WriteLine(e);

            //program 10
            int f=Convert.ToInt32(Console.ReadLine());
            int g = Convert.ToInt32(Console.ReadLine());
            int h = Convert.ToInt32(Console.ReadLine());
            int max = f > g ? (f > h ? f : h) : (g > h ? g : h);
            Console.WriteLine("The maximum value is: " + max);
        }
    }
}
