using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_2
{
    internal class Bank_Account
    {
        int Account_No = 0;
        string Email = string.Empty;
        string User_Name = string.Empty;
        string Account_Type = string.Empty;
        int Account_Balance = 0;

        public void GetAccountDetails()
        {
            Console.WriteLine("Enter Account_No : ");
            Account_No = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Enter Email : ");
            Email = Convert.ToString(Console.ReadLine());
            Console.WriteLine("Enter User_Name : ");
            User_Name = Convert.ToString(Console.ReadLine());
            Console.WriteLine("Enter Account_Type : ");
            User_Name = Convert.ToString(Console.ReadLine());
            Console.WriteLine("Entee Account_Balance : ");
            Account_Balance = Convert.ToInt32(Console.ReadLine());
        }

        public void DisplayAccountDetails()
        {
            Console.WriteLine("Account_No : " + Account_No);
            Console.WriteLine("Email : " + Email);
            Console.WriteLine("User_Name : " + User_Name);
            Console.WriteLine("Account_Type : " + Account_Type);
            Console.WriteLine("Account_Balance : " + Account_Balance);

        }
    }
}
