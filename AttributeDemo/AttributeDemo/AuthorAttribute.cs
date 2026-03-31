using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AttributeDemo
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method | AttributeTargets.Property)]
    class AuthorAttribute : Attribute
    {
        string name;

        public AuthorAttribute(string name)
        {
            this.name = name;
        }

        public string AuthorName { get { return name; } set { name = value; } }
    }
}
