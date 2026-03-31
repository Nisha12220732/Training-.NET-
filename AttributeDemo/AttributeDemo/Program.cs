using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AttributeDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            AuthorAttribute atr = (AuthorAttribute)Attribute.GetCustomAttribute(typeof(Employee), typeof(AuthorAttribute));

            if (atr == null)
            {
                Console.WriteLine("AuthorAttribute is not applied on Employee");
            }
            else 
            {
                Console.WriteLine("Author Name is : " + atr.AuthorName);
            }

            Console.ReadKey();
        }
    }
}
