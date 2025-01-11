using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test
{
    public class Vehicle
    {
        public string model = "asd";
        public int year = 2020;
    }
    public class Car : Vehicle
    {
        string fuletype = "petrol";
        public void DisplayDetail()
        {
            Console.WriteLine("model is:-" + model);
            Console.WriteLine("year is:-" + year);
            Console.WriteLine("fuletype is:-" + fuletype);
        }
    }
    public class Truck : Vehicle
    {
        string loadcapicity="10000kg";
        public void DisplayDetail()
        {
            Console.WriteLine("model is:-" + model);
            Console.WriteLine("year is:-" + year);
            Console.WriteLine("loadcapicity is:-" + loadcapicity);
        }
    }
}


