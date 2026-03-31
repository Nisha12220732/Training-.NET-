using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AttributeDemo
{
    [Author("Shital")]
    public class Employee
    {
        int id;
        string name;

        public Employee()
        { }

        [Author("Shital")]
        public int EmpID { get { return id; } set { id = value; } }
        public string EmpName { get { return name; } set { name = value; } }

        [Author("Shital")]
        public void Show()
        { }
    }
}
