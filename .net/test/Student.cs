using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test
{
    public class Student
    {
        int roll = 0;
        string name = "";
        int m1 = 0;
        int m2 = 0;
        int m3 = 0;
        int m4 = 0;
        int m5 = 0;
        int ans = 0;
        public void InputDetails()
        {
            Console.WriteLine("enter your roll nunmber");
            roll=Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter name");
            name = Console.ReadLine();
            Console.WriteLine("enter 1 subject marks");
            m1 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter 2 subject marks");
            m2 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter 3 subject marks");
            m3 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter 4 subject marks");
            m4 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter 5 subject marks");
            m5 = Convert.ToInt32(Console.ReadLine());
        }
        public void DisplayDetails()
        {
            Console.WriteLine("your roll no is:-"+roll);
            Console.WriteLine("your name is:-" + name);
            Console.WriteLine("your 1 subject mark is:-" + m1);
            Console.WriteLine("your 2 subject mark is:-" + m2);
            Console.WriteLine("your 3 subject mark is:-" + m3);
            Console.WriteLine("your 4 subject mark is:-" + m4);
            Console.WriteLine("your 5 subject mark is:-" + m5);
        }
        public void CalculateMarks()
        {
            int sum=m1+m2+ m3 + m4+m5;
            Console.WriteLine("your total marks is:-" + sum);
            CalculatePersentage(sum);
        }
        public void CalculatePersentage(int sum)
        {
            ans = sum / 5;
            Console.WriteLine("you got " + ans + "%");
        }
        public void DetermineGrade()
        {
            if (ans > 90)
            {
                Console.WriteLine("you got A grade");
            }
            else if (ans >75)
            {
                Console.WriteLine("you got B grade");
            }
            else if (ans > 50)
            {
                Console.WriteLine("you got C grade");
            }
            else
            {
                Console.WriteLine("you got F grade");
            }
        }
    }
}
