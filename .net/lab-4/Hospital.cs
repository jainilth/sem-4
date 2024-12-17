using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_4
{
    public class Hospital
    {
        public virtual void HospitalDetails()
        {
            Console.WriteLine("hospital details");
        }
    }
    public class Appolo:Hospital
    {
        public override void HospitalDetails()
        {
            Console.WriteLine("Appolo details");
        }
    }
    public class Wockhardt : Hospital
    {
        public override void HospitalDetails()
        {
            Console.WriteLine("Wockhardt details");
        }
    }
    public class Gokul_Superspeciality : Hospital
    {
        public override void HospitalDetails()
        {
            Console.WriteLine("Gokul_Superspeciality details");
        }
    }
}
