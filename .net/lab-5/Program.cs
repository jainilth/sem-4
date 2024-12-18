using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_5
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Program 1
            ArrayList a1 = new ArrayList();
            a1.Add(1);
            a1.Add(2);
            a1.Add(3);
            a1.Add(4);
            a1.Add(5);
            a1.Add(6);
            foreach (object o in a1)
            {
                Console.WriteLine(o.ToString());
            }
            Console.WriteLine("-----------------------");
            a1.Remove(5);
            foreach (object o in a1)
            {
                Console.WriteLine(o.ToString());
            }
            Console.WriteLine("-----------------------");
            a1.RemoveRange(1, 2);
            foreach (object o in a1)
            {
                Console.WriteLine(o.ToString());
            }
            Console.WriteLine("-----------------------");
            a1.Clear();
            foreach (object o in a1)
            {
                Console.WriteLine(o.ToString());
            }
            Console.WriteLine("-----------------------");

            //Program 2
            List<string> StudentName = new List<string>();
            StudentName.Add("a");
            StudentName.Add("b");
            StudentName.Add("c");
            StudentName.Add("d");
            StudentName.Add("e");
            StudentName.Add("f");
            StudentName.Add("g");
            StudentName.Add("h");
            foreach (object o in StudentName)
            {
                Console.WriteLine(o.ToString());
            }
            Console.WriteLine("-----------------------");
            StudentName.Remove("c");
            foreach (object o in StudentName)
            {
                Console.WriteLine(o.ToString());
            }
            Console.WriteLine("-----------------------");
            StudentName.RemoveRange(1, 2);
            foreach (object o in StudentName)
            {
                Console.WriteLine(o.ToString());
            }
            Console.WriteLine("-----------------------");
            StudentName.Clear();
            foreach (object o in StudentName)
            {
                Console.WriteLine(o.ToString());
            }
            Console.WriteLine("-----------------------");

            //Program 3
            Stack<int> stack = new Stack<int>();
            stack.Push(1);
            stack.Push(2);
            stack.Push(3);
            stack.Push(4);
            stack.Push(5);
            stack.Push(6);
            stack.Push(7);
            stack.Push(8);
            stack.Push(9);
            stack.Push(10);
            foreach (object o in stack)
            {
                Console.WriteLine(o);
            }
            Console.WriteLine("-----------------------");
            stack.Pop();
            foreach (object o in stack)
            {
                Console.WriteLine(o);
            }
            Console.WriteLine("-----------------------");
            stack.Peek();
            stack.Contains(5);
            foreach (object o in stack)
            {
                Console.WriteLine(o);
            }
            Console.WriteLine("-----------------------");
            stack.Clear();
        }
    }
}
