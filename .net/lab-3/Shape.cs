using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_3
{
    public interface Shape
    {
        double Circle(double r);
        double Triangle(double b, double h);
        double Square(double l, double b);
    }
    public class Area : Shape
    {
        public double Circle(double r)
        {
            return Math.PI * r * r;
        }
        public double Triangle(double b, double h)
        {
            return (1 / 2.0) * b * h;
        }
        public double Square(double l, double b)
        {
            return l * b;
        }
    }
}