using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Lab_2;

namespace lab_2
{
    public class Program
    {
        static void Main(string[] args)
        {
            //program 1
            Candidate c1 = new Candidate();
            c1.GetCandidateDetails();
            c1.DisplayCandidateDetails();

            //program 2
            Staff[] s = new Staff[2];
            for (int i = 0; i < s.Length; i++)
            {
                Console.WriteLine((i + 1) + "'s details");
                s[i] = new Staff();
                s[i].GetStaffDetails();
            }
            for (int i = 0; i < s.Length; i++)
            {
                if (s[i].Designation.Equals("HOD") || s[i].Designation.Equals("hod"))
                {
                    Console.WriteLine("name:" + s[i].Name);
                    Console.WriteLine("salary:" + s[i].salary);
                }
            }

            // Program 3
            Bank_Account account = new Bank_Account();
            account.GetAccountDetails();
            account.DisplayAccountDetails();

            //Program 4
            Student stu = new Student(12315, "jainil", 2, 10, 8.6);
            stu.DisplayStudentDetails();

            //Program 5
            Rectangle r = new Rectangle(5, 10);

            //Program 6
            Interest interest = new Interest();
            interest.GetAccountDetails();
            interest.CalculateAndDisplayInterest();

            //Program 7
            Console.Write("Enter Basic Salary: ");
            double basic = Convert.ToDouble(Console.ReadLine());

            Console.Write("Enter Travel Allowance (TA): ");
            double ta = Convert.ToDouble(Console.ReadLine());

            Salary empSalary = new Salary(basic, ta);

            empSalary.DisplaySalaryDetails();

            //Program-8
            Console.Write("Enter first distance: ");
            int d1 = Convert.ToInt32(Console.ReadLine());

            Console.Write("Enter second distance: ");
            int d2 = Convert.ToInt32(Console.ReadLine());

            Distance distance = new Distance(d1, d2);

            distance.calculateAddition();
            distance.DisplayDistances();

            //Program-9
            Table diningTable = new Table();

            // Set values for the table
            Console.Write("Enter the material of the table: ");
            diningTable.Material = Console.ReadLine();

            Console.Write("Enter the price of the table: ");
            diningTable.Price = Convert.ToDouble(Console.ReadLine());

            Console.Write("Enter the height of the table (in meters): ");
            diningTable.Height = Convert.ToDouble(Console.ReadLine());

            Console.Write("Enter the surface area of the table (in square meters): ");
            diningTable.SurfaceArea = Convert.ToDouble(Console.ReadLine());

            Console.WriteLine("\n--- Table Details ---");
            diningTable.DisplayFurnitureDetails();
            diningTable.DisplayTableDetails();

            //Program-10
        }
    }
}
