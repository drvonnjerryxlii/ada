// 1. Delete the Student array in your Course object from Module 5.
// 2. Create an ArrayList to hold students inside the Course object.
// 3. Modify your code to use the ArrayList collection. In other words, when you
//    add a Student to the Course object, you will add it to the ArrayList and
//    not an array.
// 4. Create a Stack object (Grades) inside Student to store test scores.
//    NOTE: this does not make any sense. why would you want to use a stack for
//          holding grades? what's the point of popping a grade? wouldn't a list
//          be better for calculating GPA?
// 5. Create 3 student objects.
// 6. Add 5 grades to the the Stack in the each Student object. (This does not
//    have to be inside the constructor because you may not have grades for a
//    student when you create a new student.)
// 7. Add the three Student objects to the Course's Students ArrayList.
// 8. Using a foreach loop, iterate over the Students in the ArrayList and
//    output their first and last names to the console window. (For this
//    exercise you MUST cast the returned object from the ArrayList to a Student
//    object. Also, place each student name on its own line.)
// 9. Create a method inside the Course object called ListStudents() that
//    contains the foreach loop.
// X. Call the ListStudents() method from Main().


using System;
using System.Collections;

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
    // new Grades code
    private Stack _grades = new Stack();
    public Stack Grades
    {
      get
      {
        return _grades;
      }
    }

    public void AddGrade(double grade)
    {
      _grades.Push(grade);
    }

    private static int _totalEnrolled = 0;
    public static int TotalEnrolled
    {
      get
      {
        return _totalEnrolled;
      }
    }

    public Student(
      string firstName, string lastName, DateTime birthdate
    ) : base(firstName, lastName, birthdate)
    {
      _totalEnrolled += 1;
    }

    public Student(
      string firstName, string lastName, DateTime birthdate,
      string addressLine1, string addressLine2, string city,
      string stateOrProvince, string zipOrPostalCode, string country
    ) : base(firstName, lastName, birthdate, addressLine1, addressLine2, city,
      stateOrProvince, zipOrPostalCode, country)
    {
      _totalEnrolled += 1;
    }

    public void TakeTest()
    {
      Console.WriteLine(
        "{0} {1} took a test in classroom 20B.",
        this.FirstName,
        this.LastName
      );
    }

    public string FullName()
    {
      return String.Format("{0} {1}", FirstName, LastName);
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
    // new students ArrayList code
    private ArrayList _students = new ArrayList();
    public ArrayList Students
    {
      get
      {
        return _students;
      }
    }
    public void AddStudent(Student student)
    {
      _students.Add(student);
    }

    public void RemoveStudent(Student student)
    {
      _students.Remove(student);
    }

    // remaining properties
    public string Name { get; set; }
    public int Credits { get; set; }
    public int DurationInWeeks { get; set; }
    public Teacher[] Teachers { get; set; }

    public Course(string name, int credits, int duration)
    {
      this.Name = name;
      this.Credits = credits;
      this.DurationInWeeks = duration;
    }

    public Course(string name, int credits, int duration, Teacher[] teachers)
    {
      this.Name = name;
      this.Credits = credits;
      this.DurationInWeeks = duration;
      this.Teachers = teachers;
    }

    public void ListStudents()
    {
      foreach (Student student in Students)
        Console.WriteLine(student.FullName());
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
    // - Instantiate at least one Teacher object.
    Teacher[] teachers = GenerateThreeTeachers();

    // - Instantiate a Course object called Programming with C#.
    // - Add that Teacher object to your Course object
    Course[] courses = { new Course("Programming with C#", 15, 10, teachers) };

    // - Instantiate three Student objects.
    // - Add your three students to this Course object.
    GenerateThreeStudents(ref courses[0]);

    // - Instantiate a Degree object, such as Bachelor.
    // - Add your Course object to the Degree object.
    Degree[] degrees = { new Degree("Bachelor of Skience", 180, courses) };

    // - Instantiate a UProgram object called Information Technology.
    // - Add the Degree object to the UProgram object.
    UProgram program = new UProgram(
      "Information Technology",
      "The King of Pokemanz",
      degrees
    );

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
      Student.TotalEnrolled
    );

    //   - The students' first and last names.
    courses[0].ListStudents();
  }
  #endregion

  #region GenerateStudents
  private static void GenerateThreeStudents(ref Course course)
  {
    Random random = new Random();

    string firstName = String.Empty;
    string lastName = String.Empty;
    DateTime birthdate = new DateTime();

    // generate three students
    for (int i = 0; i < 3; i++)
    {
      GenerateBasicPersonInfo(ref firstName, ref lastName, ref birthdate);
      Student student = new Student(firstName, lastName, birthdate);

      // give them each five grades, as foretold by prophecy
      for (int g = 0; g < 5; g++)
      {
        double grade = random.Next(0, 100);
        student.AddGrade(grade);
      }

      course.AddStudent(student);
    }
  }
  #endregion

  #region GenerateTeachers
  private static Teacher[] GenerateThreeTeachers()
  {
    Teacher[] teachers = new Teacher[3];

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
    // declare some cool names and years
    string[] firsts = { "Ahmed", "Inoichi", "Umma", "Erling", "Otieno" };
    string[] lasts = { "Courier", "Times", "Helvetica", "Comic-Sans", "Serif" };
    int[] years = { 1984, 1842, 1716, 1514, 2014 };

    // get a random number generator
    Random random = new Random();

    // pick a random first & last name
    first = firsts[random.Next(0, firsts.Length)];
    last = lasts[random.Next(0, lasts.Length)];

    // pick some random date times
    int year = years[random.Next(0, years.Length)];
    int month = random.Next(1, 12);
    int day = random.Next(1, 28); // how many months have 28 days? >_>

    // create the birthdate from random date times
    birthdate = new DateTime(year, month, day);
  }
  #endregion
}
