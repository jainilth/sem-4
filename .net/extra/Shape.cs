using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace extra
{
    public interface Shape
    {
        double CalculateAera(double r);
    }
    public class Circle : Shape
    {
        public double CalculateAera(double r)
        {
            return 3.14 * r * r;
        }
    }
}
