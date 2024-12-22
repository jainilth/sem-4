using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Lab_3;

namespace lab_3
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Program 1
            try
            {
                int a1 = Convert.ToInt32(Console.ReadLine());
                int b = Convert.ToInt32(Console.ReadLine());
                int ans1= a1 / b;
                Console.WriteLine(ans1);
            }
            catch (DivideByZeroException)
            {
                Console.WriteLine("Exception occured");
            }

            //Program 2
            try
            {
                int[] arr4 = new int[5];
                for (int i = 0; i < 6; i++)
                {
                    arr4[i] = Convert.ToInt32(Console.ReadLine());
                }
            }
            catch (IndexOutOfRangeException)
            {
                Console.WriteLine("occured");
            }

            //Program - 3
            //in class sum file

            //Program - 4

            Result r = new Result();
            Console.WriteLine("Sum Of Two Number = " + r.Addition(6, 5));
            Console.WriteLine("Substraction Of Two Number = " + r.Substraction(11, 5));

            //Program - 5
            String str1 = "   Hello World!  ";
            Console.WriteLine("Lower Case : " + str1.ToLower());
            Console.WriteLine("Upper Case : " + str1.ToUpper());
            Console.WriteLine("Substring : " + str1.Substring(2, 8));
            Console.WriteLine("Trim : " + str1.Trim());

            //Program - 6
            Console.WriteLine("Enter a String : ");
            String str = Console.ReadLine();
            char[] arr = str.ToCharArray();

            for (int i = 0; i < arr.Length; i++)
            {
                char temp = arr[i];
                if (temp >= 'A' && temp <= 'Z')
                {
                    arr[i] = (char)((int)temp + 32);
                }
                else if (temp >= 'a' && temp <= 'z')
                {
                    arr[i] = (char)((int)temp - 32);
                }
            }
            String ans = "";
            for (int i = 0; i < arr.Length; i++)
            {
                ans += arr[i];
            }
            Console.WriteLine(ans);

            //Program - 7

            Area a = new Area();
            Console.WriteLine("Circle = " + a.Circle(3.14));
            Console.WriteLine("Triangle = " + a.Triangle(2, 3));
            Console.WriteLine("Square = " + a.Square(5, 4));

            //Program - 8

            Console.Write("Enter a Number : ");
            try
            {
                int d = int.Parse(Console.ReadLine());
                if (d % 2 != 0) throw new Exception("Entered Number Is Odd");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            //Program - 9
            Console.Write("Enter a String : ");
            String str2 = Console.ReadLine();
            String[] strArr = str2.Split(new char[] { ' ' });
            int maxIndex = 0, maxLen = 0;
            for (int i = 0; i < strArr.Length; i++)
            {
                if (strArr[i].Length > maxLen)
                {
                    maxLen = strArr[i].Length;
                    maxIndex = i;
                }
            }
            Console.WriteLine("Longest Word Is : " + strArr[maxIndex]);

            //Program-10
            Console.Write("Enter a Character : ");
            char ch = char.Parse(Console.ReadLine());

            if (ch >= 'A' && ch <= 'Z')
            {
                ch = (char)((int)ch + 32);
            }
            else if (ch >= 'a' && ch <= 'z')
            {
                ch = (char)((int)ch - 32);
            }
            Console.WriteLine(ch);

        }
    }
}
