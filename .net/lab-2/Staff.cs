using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_2
{
    internal class Staff
    {
        public string Name=string.Empty;
        public string Department = string.Empty;
        public string Designation = string.Empty;
        public int Experience = 0;
        public int salary = 0;

        public void GetStaffDetails()
        {
            Console.WriteLine("enter staff name");
            this.Name = Console.ReadLine();
            Console.WriteLine("enter staff Department");
            this.Department = Console.ReadLine();
            Console.WriteLine("enter staff Designation");
            this.Designation = Console.ReadLine();
            Console.WriteLine("enter staff experience");
            this.Experience = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter staff salary");
            this.salary = Convert.ToInt32(Console.ReadLine());
        }

        public void DisplayStaffDetails()
        {
            Console.WriteLine("name:" + Name);
            Console.WriteLine("Department:" + Department);
            Console.WriteLine("Designation:" + Designation);
            Console.WriteLine("Experience:" + Experience);
            Console.WriteLine("salary:" + salary);
        }
    }
}
//Write a program to create a class Staff having data members as Name,
//Department, Designation, Experience & Salary. Accept this data for 5
//different staffs and display only names & salary of those staff who are
//HOD.