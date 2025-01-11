using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test
{
    public abstract class Employee
    {
        public abstract void CalculateSalary();
    }

    public interface Bonus
    {
        void CalculateBonus();
    }
    public class Manager : Employee, Bonus
    {
        public override void CalculateSalary()
        {
            Console.WriteLine("your salary manager");
        }
        public void CalculateBonus()
        {
            Console.WriteLine("your bonus manager");
        }
    }
    public class Worker : Employee, Bonus
    {
        public override void CalculateSalary()
        {
            Console.WriteLine("your salary Worker");
        }
        public void CalculateBonus()
        {
            Console.WriteLine("your bonus Worker");
        }
    }
}
