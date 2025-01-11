using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace test
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Program 1
            Console.WriteLine("please enter range");
            int num1 = Convert.ToInt32(Console.ReadLine());
            for (int i = 1; i < num1; i++)
            {
                int count = 0;
                for (int j = 1; j < num1; j++)
                {
                    if (i % j == 0)
                    {
                        count++;
                    }
                }
                if (count == 2)
                {
                    Console.WriteLine(i + " ");
                }
            }

            //Program 2
            Student student = new Student();
            student.InputDetails();
            student.DisplayDetails();
            student.CalculateMarks();
            student.DetermineGrade();

            //Program 3
            Car car = new Car();
            car.DisplayDetail();
            Console.WriteLine("---------------------------");
            Truck truck = new Truck();
            truck.DisplayDetail();

            //Program 4
            Manager manager = new Manager();
            manager.CalculateSalary();
            manager.CalculateBonus();
            Worker worker = new Worker();
            worker.CalculateSalary();
            worker.CalculateBonus();

            //Program 5
            Console.WriteLine("enter your age");
            try
            {
                int age = Convert.ToInt32(Console.ReadLine());
                if (age < 0) throw new Exception("number is negative");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            //Program 6
            Console.WriteLine("Enter String : ");
            string str = Console.ReadLine();
            char[] s = str.ToCharArray();

            int v = 0;
            int c = 0;
            int d = 0;
            int sc = 0;
            for (int i = 0; i < str.Length; i++)
            {
                if (s[i] == 'a' || s[i] == 'e' || s[i] == 'i' || s[i] == 'o' || s[i] == 'u')
                {
                    v++;
                }
                else if (s[i] == '0' || s[i] == '1' || s[i] == '2' || s[i] == '3' || s[i] == '4' || s[i] == '5' || s[i] == '6' || s[i] == '7' || s[i] == '8' || s[i] == '9')
                {
                    d++;
                }
                else if (s[i] == '$' || s[i] == '-' || s[i] == '*' || s[i] == '&')
                {
                    sc++;
                }
                else
                {
                    c++;
                }
            }

            Console.WriteLine("Chars : " + c);
            Console.WriteLine("Digits : " + d);
            Console.WriteLine("Vowel : " + v);
            Console.WriteLine("Special : " + sc);
        }
    }
}
