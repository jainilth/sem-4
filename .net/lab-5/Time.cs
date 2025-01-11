using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_5
{
    public class Time
    {
        public int hour = 0;
        public int minute=0;
        public int second=0;

        public Time(int hour, int minute, int second)
        {
            this.hour = hour;
            this.minute = minute;
            this.second = second;
        }

        public Time(Time t)
        {
            this.hour=t.hour;
            this.minute=t.minute;
            this.second=t.second;
        }
        public void getTime()
        {
            Console.WriteLine(hour);
            Console.WriteLine(minute);
            Console.WriteLine(second);
        }

        public void addTime(Time t1)
        {
            hour+=t1.hour; 
            minute+=t1.minute; 
            second+=t1.second;
        }

    }
}
