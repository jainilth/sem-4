using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_4
{
    public class BankAccount
    {
        public string accountHolderName;
        public int balance;

        public BankAccount(string accountHolderName, int balance)
        {
            this.accountHolderName = accountHolderName;
            this.balance = balance;
        }
        public int Deposit(int amount)
        {
            this.balance += amount;
            Console.WriteLine("After Deposit via Cash , Balance : " + this.balance);
            return this.balance;
        }
        public int Deposit(int chequeNo, int amount)
        {
            this.balance += amount;
            Console.WriteLine("After Deposit via Cheque , Balance : " + this.balance);
            return this.balance;
        }
        public int Withdraw(int amount)
        {
            this.balance -= amount;
            Console.WriteLine("After Withdraw via Cash , Balance : " + this.balance);
            return this.balance;
        }
        public int Withdraw(int chequeNo, int amount)
        {
            this.balance -= amount;
            Console.WriteLine("After Withdraw via Cheque , Balance : " + this.balance);
            return this.balance;
        }
    }
}