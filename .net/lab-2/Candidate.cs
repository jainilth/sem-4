using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_2
{
    internal class Candidate
    {
        public int Id;
        public string Name=string.Empty;
        public int Age;
        public double Weight;
        public double Height;

        public void GetCandidateDetails()
        {
            Console.WriteLine("enter candidate id");
            this.Id=Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter candidate name");
            this.Name=Console.ReadLine();
            Console.WriteLine("enter candidate age");
            this.Age=Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter candidate weight");
            this.Weight=Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("enter candidate height");
            this.Height=Convert.ToDouble(Console.ReadLine());
        }
        public void DisplayCandidateDetails()
        {
            Console.WriteLine("id:" + Id);
            Console.WriteLine("name:" + Name);
            Console.WriteLine("Age:" + Age);
            Console.WriteLine("weight:" + Weight);
            Console.WriteLine("height:" + Height);
        }
    }
}
