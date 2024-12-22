using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_3
{
    public interface Calculate
    {
        int Addition(int a, int b);
        int Substraction(int a, int b);
    }
    public class Result : Calculate
    {
        public int Addition(int a, int b)
        {
            return a + b;
        }
        public int Substraction(int a, int b)
        {
            return a - b;
        }
    }
}