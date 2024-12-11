using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_2
{
    public class Rectangle
    {
        double height;
        double width;
        public Rectangle(double height,double width)
        {
            this.width = width;
            this.height = height;
            Console.WriteLine("your area is:"+(2*(height+width)));
        }
    }
}
