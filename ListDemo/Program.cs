using System;
using System.Security.Cryptography.X509Certificates;
using ListDemo;

    class Program
{
    static void Main()
    {
    //     List<Student> StudentList = new List<>();
        
    //     public List<Student> AddStudents(Student st)
    // {
    //     StudentList.Add(new Student(st));
    // }

    Dictionary<int, string> dict = new Dictionary<int, string>();
    dict.Add(1,"Nisha");
    dict.Add(2,"Nia");
    dict.Add(3,"Sia");

    System.Console.WriteLine("Enter Id you want to search for");
    int s = Int32.Parse(Console.ReadLine());
    if (dict.ContainsKey(s))
    {
    Console.WriteLine("Key exists");
    System.Console.WriteLine(dict[s]);
    }
        else
        {
            System.Console.WriteLine("Student not found!!");
        }
    }
}
