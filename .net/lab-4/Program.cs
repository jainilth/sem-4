using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using lab_4;

namespace lab_4
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Program 1
            Lab_4_1 a = new Lab_4_1();
            int ans = a.add(5, 5);
            double b = a.add(8.56, 2.65);
            Console.WriteLine(ans);
            Console.WriteLine(b);

            //Program 2
            lab_4_2 c = new lab_4_2();
            Console.WriteLine(c.Area(5));
            Console.WriteLine(c.Area(6, 5));

            //Program 3
            RBI r = new RBI();
            r.calculateInterest();

            HDFC h = new HDFC();
            h.calculateInterest();

            SBI s = new SBI();
            s.calculateInterest();

            ICIC i = new ICIC();
            i.calculateInterest();

            //Program 4

            Appolo a1 = new Appolo();
            a1.HospitalDetails();

            Wockhardt w = new Wockhardt();
            w.HospitalDetails();

            Gokul_Superspeciality g = new Gokul_Superspeciality();
            g.HospitalDetails();

            //Program 5

            lab_4_b5 shape = new lab_4_b5();
            Console.WriteLine("Square : " + shape.Area(3));
            Console.WriteLine("Rectangle : " + shape.Area(3, 4));
            Console.WriteLine("Circle : " + shape.Area(5.42));

            ////Program-6

            BankAccount b1 = new BankAccount("Nikunj Rathod", 33474);

            b1.Deposit(5000);
            b1.Withdraw(6000);
            b1.Deposit(12345, 600);
            b1.Withdraw(78965, 8000);

        }
    }
}
