using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_4
{
    public class RBI
    {
        public virtual void calculateInterest()
        {
            Console.WriteLine("rbi interest");
        }
    }
    public class HDFC : RBI
    {
        public override void calculateInterest()
        {
            Console.WriteLine("hdfc interest");
        }
    }
    public class SBI : RBI
    {
        public override void calculateInterest()
        {
            Console.WriteLine("sbi interest");
        }
    }
    public class ICIC : RBI
    {
        public override void calculateInterest()
        {
            Console.WriteLine("icic interest");
        }
    }
}
