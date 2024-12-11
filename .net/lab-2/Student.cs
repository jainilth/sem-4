using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_2
{
    public class Student
    {
        int Enrollment_No;
        string Student_Name;
        int semester;
        double cpi;
        double spi;
        public Student(int Enrollment_No,String Student_Name,int semester,double cpi,double spi)
        {
            this.Enrollment_No = Enrollment_No;
            this.Student_Name = Student_Name;
            this.semester = semester;
            this.cpi = cpi;
            this.spi = spi;
        }
        public void DisplayStudentDetails()
        {
            Console.WriteLine("your enrollment number is:" + Enrollment_No);
            Console.WriteLine("your name is:"+Student_Name);
            Console.WriteLine("your semester is:"+ semester);
            Console.WriteLine("your cpi is:"+cpi);
            Console.WriteLine("your spi is:" + spi);
        }
    }
}
