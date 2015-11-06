// Assignment
// ==========

// For this assignment, complete the following tasks.  For the structs, just
// include member variables and a constructor.  Do not create properties at this
// time.  Include all the variables that you have created up to this point in
// time.

// 1. Create a struct to represent a student
// 2. Create a struct to represent a teacher
// 3. Create a struct to represent a program
// 4. Create a struct to represent a course
// 5. Create an array to hold 5 student structs.
// 6. Assign values to the fields in at least one of the student structs in the
//    array.
// 7. Using a series of Console.WriteLine() statements, output the values for
//    the student struct that you assigned in the previous step
// 8. When complete, submit your code in the peer review section.

// Challenge
// =========

// Expand on the struct array steps to complete the following:

// 1. Use an appropriate looping structure to add values to all student structs
//    in the array by prompting a user of the application to enter values for
//    fields.

//    - For example, if you created fristName, lastName, address, city fields
//      as an example, for each of the 5 students in the array, you need to
//      prompt the user for each field in the struct, for each student struct
//      in the array.

// 2. Once completed, create another loop to iterate over the array and write
//    the values to the console window

using System;

public class Module4
{
  public struct Student
  {
    public string FirstName;
    public string LastName;
    public DateTime Birthdate;
  }

  public struct Teacher
  {
    public string FirstName;
    public string LastName;
    public DateTime Birthdate;
  }

  public struct Program
  {
    public string Name;
    public string DepartmentHead;
    public string[] Degrees;
  }

  public struct Course
  {
    public string Name;
    public int Credits;
    public int Duration; // in weeks
  }

  public static void Main()
  {
    // generate & console write some students
    Student[] students = GenerateFiveStudents();
    foreach (Student s in students)
      Console.WriteLine("{0} {1} was born {2}.", s.FirstName, s.LastName, s.Birthdate);

    // // make the user create some students & then console write them
    // Student[] userStudents = UserCreateStudents(5);
    // foreach (Student s in userStudents)
    //   Console.WriteLine("{0} {1} was born {2}.", s.FirstName, s.LastName, s.Birthdate);
  }

  private static Student[] GenerateFiveStudents()
  {
    int size = 5;
    Random random = new Random();
    Student[] students = new Student[size];

    string[] firsts = { "Ahmed", "Inoichi", "Umma", "Erling", "Otieno" };
    string[] lasts = { "Courier", "Times", "Helvetica", "Comic-Sans", "Serif" };
    int[] years = { 1984, 1842, 1716, 1514, 2014 };

    for (int i = 0; i < size; i++)
    {
      int year = years[random.Next(0, size)];
      int month = random.Next(1, size);
      int day = random.Next(1, 28);
      students[i].FirstName = firsts[random.Next(0, size)];
      students[i].LastName = lasts[random.Next(0, size)];
      students[i].Birthdate = new DateTime(year, month, day);
    }

    return students;
  }

  private static Student[] UserCreateStudents(int size)
  {
    Student[] students = new Student[size];

    for (int i = 0; i < size; i++)
      students[i] = UserCreateStudent();

    return students;
  }

  private static Student UserCreateStudent()
  {
    // initialize a Student
    Student student = new Student();

    // get first name
    Console.WriteLine("Enter the student's first name: ");
    student.FirstName = Console.ReadLine();

    // get last name
    Console.WriteLine("Enter the student's last name: ");
    student.LastName = Console.ReadLine();

    // get birth date, starting with year
    Console.WriteLine("Enter the student's birth year (eg, 1901): ");
    int year = int.Parse(Console.ReadLine());

    // month
    Console.WriteLine("Enter the student's birth month (eg, 6): ");
    int month = int.Parse(Console.ReadLine());

    // day
    Console.WriteLine("Enter the student's birth day (eg, 24): ");
    int day = int.Parse(Console.ReadLine());

    // convert to date
    student.Birthdate = new DateTime(year, month, day);

    // return the student
    return student;
  }
}
