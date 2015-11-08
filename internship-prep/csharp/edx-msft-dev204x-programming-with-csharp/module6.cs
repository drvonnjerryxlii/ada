// 1. Create a Person base class with common attributes for a person.
// 2. Make your Student and Teacher classes inherit from the Person base class.
// 3. Modify your Student and Teacher classes so that they inherit the common
//    attributes from Person.
// 4. Modify your Student and Teacher classes so they include characteristics
//    specific to their type.  For example, a Teacher object might have a
//    GradeTest() method where a student might have a TakeTest() method.
// 5. Run the same code in Program.cs from Module 5 to create instances of your
//    classes so that you can setup a single course that is part of a program
//    and a degree path.  Be sure to include at least one Teacher and an array
//    of Students.
// 6. Ensure the Console.WriteLine statements you included in Homework 5, still
//    output the correct information.
// 7. Share your code for feedback and ideas with your fellow students such as:
//    - What other objects could benefit from inheritance in this code?
//    - Can you think of a different hierarchy for the Person, Teacher, and
//      Student?  What is it?
//    - Do NOT grade the answers to these two questions, they are merely for
//      discussion and thought.  Only grade the ability to implement inheritance
//      in the code.

using System;

public class Module6
{
  #region Person class
  public class Person
  {
    // properties
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public DateTime Birthdate { get; set; }
    public string AddressLine1 { get; set; }
    public string AddressLine2 { get; set; }
    public string City { get; set; }
    public string StateOrProvince { get; set; }
    public string ZipOrPostalCode { get; set; }
    public string Country { get; set; }

    // short constructor
    public Person(string firstName, string lastName, DateTime birthdate)
    {
      this.FirstName = firstName;
      this.LastName  = lastName;
      this.Birthdate = birthdate;
    }

    // long constructor
    public Person(string firstName, string lastName, DateTime birthdate,
      string addressLine1, string addressLine2, string city,
      string stateOrProvince, string zipOrPostalCode, string country)
    {
      this.FirstName       = firstName;
      this.LastName        = lastName;
      this.Birthdate       = birthdate;
      this.AddressLine1    = addressLine1;
      this.AddressLine2    = addressLine2;
      this.City            = city;
      this.StateOrProvince = stateOrProvince;
      this.Country         = country;
      this.ZipOrPostalCode = zipOrPostalCode;
    }
  }
  #endregion

  #region Student class
  public class Student : Person
  {
    public static int TotalEnrolled = 0;

    public Student(
      string firstName, string lastName, DateTime birthdate
    ) : base(firstName, lastName, birthdate)
    {
      TotalEnrolled += 1;
    }

    public Student(
      string firstName, string lastName, DateTime birthdate,
      string addressLine1, string addressLine2, string city,
      string stateOrProvince, string zipOrPostalCode, string country
    ) : base(firstName, lastName, birthdate, addressLine1, addressLine2, city,
      stateOrProvince, zipOrPostalCode, country)
    {
      TotalEnrolled += 1;
    }

    public void TakeTest()
    {
      Console.WriteLine(
        "{0} {1} took a test in classroom 20B.",
        this.FirstName,
        this.LastName
      );
    }
  }
  #endregion

  #region Teacher class
  public class Teacher : Person
  {
    public Teacher(
      string firstName, string lastName, DateTime birthdate
    ) : base(firstName, lastName, birthdate)
    {
    }

    public Teacher(
      string firstName, string lastName, DateTime birthdate,
      string addressLine1, string addressLine2, string city,
      string stateOrProvince, string zipOrPostalCode, string country
    ) : base(firstName, lastName, birthdate, addressLine1, addressLine2, city,
      stateOrProvince, zipOrPostalCode, country)
    {
    }

    public void GiveTest()
    {
      Console.WriteLine(
        "{0} {1} gave a test to the students in classroom 20B.",
        this.FirstName,
        this.LastName
      );
    }
  }
  #endregion

  #region Course class
  public class Course
  {
    public string Name { get; set; }
    public int Credits { get; set; }
    public int DurationInWeeks { get; set; }
    public Student[] Students { get; set; }
    public Teacher[] Teachers { get; set; }

    public Course(string name, int credits, int duration)
    {
      this.Name = name;
      this.Credits = credits;
      this.DurationInWeeks = duration;
    }

    public Course(string name, int credits, int duration, Student[] students,
      Teacher[] teachers)
    {
      this.Name = name;
      this.Credits = credits;
      this.DurationInWeeks = duration;
      this.Students = students;
      this.Teachers = teachers;
    }
  }
  #endregion

  #region Degree class
  public class Degree
  {
    public string Name { get; set; }
    public int CreditsRequired { get; set; }
    public Course[] Courses { get; set; }

    public Degree(string name, int credits)
    {
      this.Name = name;
      this.CreditsRequired = credits;
    }

    public Degree(string name, int credits, Course[] courses)
    {
      this.Name = name;
      this.CreditsRequired = credits;
      this.Courses = courses;
    }
  }
  #endregion

  #region UProgram class
  // rogram Name	Department Head	Degrees
  public class UProgram
  {
    public string Name { get; set; }
    public string DepartmentHead { get; set; }
    public Degree[] Degrees { get; set; }

    public UProgram(string name, string departmentHead)
    {
      this.Name = name;
      this.DepartmentHead = departmentHead;
    }

    public UProgram(string name, string departmentHead, Degree[] degrees)
    {
      this.Name = name;
      this.DepartmentHead = departmentHead;
      this.Degrees = degrees;
    }
  }
  #endregion

  #region Main()
  public static void Main()
  {
    // - Instantiate three Student objects.
    Student[] students = GenerateThreeStudents();

    // - Instantiate at least one Teacher object.
    Teacher[] teachers = GenerateThreeTeachers();

    // - Instantiate a Course object called Programming with C#.
    // - Add your three students to this Course object.
    // - Add that Teacher object to your Course object
    Course[] courses = { new Course("Programming with C#", 15, 10, students, teachers) };

    // - Instantiate a Degree object, such as Bachelor.
    // - Add your Course object to the Degree object.
    Degree[] degrees = { new Degree("Bachelor of Skience", 180, courses) };

    // - Instantiate a UProgram object called Information Technology.
    // - Add the Degree object to the UProgram object.
    var program = new UProgram("Information Technology", "The King of Pokemanz", degrees);


    // - Using Console.WriteLine statements, output the following information to
    //   the console window:
    //   - The name of the program and the degree it contains.
    Console.WriteLine(
      "The {0} program contains the {1} degree.",
      program.Name,
      program.Degrees[0].Name
    );
    //   - The name of the course in the degree.
    Console.WriteLine(
      "The {0} degree contains the course {1}.",
      degrees[0].Name,
      degrees[0].Courses[0].Name
    );
    //   - The count of the number of students in the course.
    Console.WriteLine(
      "The {0} course contains {1} student(s).",
      courses[0].Name,
      courses[0].Students.Length
    );
  }
  #endregion

  #region GenerateStudents
  private static Student[] GenerateThreeStudents()
  {
    var students = new Student[3];

    string firstName = String.Empty;
  string lastName = String.Empty;
    DateTime birthdate = new DateTime();

    for (int i = 0; i < 3; i++)
    {
      GenerateBasicPersonInfo(ref firstName, ref lastName, ref birthdate);
      students[i] = new Student(firstName, lastName, birthdate);
    }

    return students;
  }
  #endregion

  #region GenerateTeachers
  private static Teacher[] GenerateThreeTeachers()
  {
    var teachers = new Teacher[3];

    string firstName = String.Empty;
  string lastName = String.Empty;
    DateTime birthdate = new DateTime();

    for (int i = 0; i < 3; i++)
    {
      GenerateBasicPersonInfo(ref firstName, ref lastName, ref birthdate);
      teachers[i] = new Teacher(firstName, lastName, birthdate);
    }

    return teachers;
  }
  #endregion

  #region GenerateBasicPersonInfo
  private static void GenerateBasicPersonInfo(
    ref string first, ref string last, ref DateTime birthdate
  )
  {
  var random = new Random();
    string[] firsts = { "Ahmed", "Inoichi", "Umma", "Erling", "Otieno" };
    string[] lasts = { "Courier", "Times", "Helvetica", "Comic-Sans", "Serif" };
    int[] years = { 1984, 1842, 1716, 1514, 2014 };

    int year = years[random.Next(0, years.Length)];
    int month = random.Next(1, 12);
    int day = random.Next(1, 28);

    first = firsts[random.Next(0, firsts.Length)];
    last = lasts[random.Next(0, lasts.Length)];
    birthdate = new DateTime(year, month, day);
  }
  #endregion
}
