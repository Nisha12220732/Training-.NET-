using System;
namespace ListDemo
{
    public class Student
    {
        public int StudentID;
        public string StudentName;
        public string CourseName;

        public Student(int Id,string Name,string Coursename)
        {
            StudentID = Id;
            StudentName = Name;
            CourseName = Coursename;
        }

    }
}