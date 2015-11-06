// Assignment
// ==========

// 1. Using the above partial code sample, complete the method for getting
//    student data.
// 2. Create a method to get information for a teacher, a course, a uprogram,
//    and a degree using a similar method as above.
// 3. Create methods to print the information to the screen for each object such
//    as static void PrintStudentDetails(...).
// 4. From within Main(), call each of the methods to prompt for input from a
//    user of your application.
// 5. Just enter enough information to show you understand how to use methods.
//    (At least three attributes each).
// 6. Assign the values that are input, to the proper variables.
// 7. Output the values of each object using the "print" methods that you
//    created.

// Exceptions
// ==========

// 1. At times, developers create method signatures early on in the development
//    process but leave the implementation until later.  This can lead to
//    methods that are not complete if a developer forgets about these empty
//    methods.  One way to help overcome the issue of not remembering to
//    complete a method is to throw an exception in that method if no
//    implementation details are present.
// 2. For this task, use MSDN to research the NotImplementedException exception.
// 3. Create a new method for validating a student's birthday.  You won't write
//    any validation code in this method, but you will throw the
//    NotImplementedException in this method
// 4. Call the method from Main() to verify your exception is thrown.

// Challenge
// =========

// (This challenge is for your own study and does not need to be submitted for
// peer review)

// Using MSDN, research the System.DateTime type.  Using the information you
// learn, modify your birth date field for the student and/or teacher to ensure
// it used a DateTime type if you did not already include that in your data for
// these objects.

// - Remove your NotImplementedException statement in the validate method you
//   created above.
// - Create a try/catch block to catch invalid date entries and display a
//   message to the user if this occurs.  (Console output)
// - Hint: Look at methods for DateTime to determine ways to check if a valid
//   date is entered.

using System;

public class Module3 {
  public static void Main()
  {
    // declare a bunch of variables
    string studentFirstName, studentLastName, teacherFirstName, teacherLastName;
    string courseName, programName, programDepartmentHead, degreeName;
	  string[] programDegrees = { String.Empty, String.Empty, String.Empty };
    DateTime studentBirthdate, teacherBirthdate;
    int courseCredits, courseDuration, degreeCredits;

    string dateToTriggerException = "this is a bad date";
    ValidateDateTime(dateToTriggerException);

    // get a bunch of info from the user
    GetPersonInfo(out studentFirstName, out studentLastName, out studentBirthdate, "student");
    GetPersonInfo(out teacherFirstName, out teacherLastName, out teacherBirthdate, "teacher");
    GetCourseInfo(out courseName, out courseCredits, out courseDuration);
    GetUProgramInfo(out programName, out programDepartmentHead, ref programDegrees);
    GetDegreeInfo(out degreeName, out degreeCredits);

    // print the info back to the console
    PrintPersonDetails(studentFirstName, studentLastName, studentBirthdate);
    PrintPersonDetails(teacherFirstName, teacherLastName, teacherBirthdate);
    PrintCourseDetails(courseName, courseCredits, courseDuration);
    PrintUProgramDetails(programName, programDepartmentHead, programDegrees);
    PrintDegreeDetails(degreeName, degreeCredits);
  }

  // -------- Person Info ----------------------------------------------------------------------------------------------

  private static void GetPersonInfo(out string firstName, out string lastName, out DateTime birthdate, string personType)
  {
    // get first name
    Console.WriteLine("Enter the {0}'s first name: ", personType);
    firstName = Console.ReadLine();

    // get last name
    Console.WriteLine("Enter the {0}'s last name: ", personType);
    lastName = Console.ReadLine();

    // get birth date, starting with year
    Console.WriteLine("Enter the {0}'s birth year (eg, 1901): ", personType);
    int year = int.Parse(Console.ReadLine());

    // month
    Console.WriteLine("Enter the {0}'s birth month (eg, 6): ", personType);
    int month = int.Parse(Console.ReadLine());

    // day
    Console.WriteLine("Enter the {0}'s birth day (eg, 24): ", personType);
    int day = int.Parse(Console.ReadLine());

    // convert to date
    birthdate = new DateTime(year, month, day);
  }

  private static void PrintPersonDetails(string first, string last, DateTime birthday)
  {
    Console.WriteLine("{0} {1} was born on: {2}", first, last, birthday);
  }

  // -------- Course Info ----------------------------------------------------------------------------------------------

  private static void GetCourseInfo(out string courseName, out int credits, out int durationInWeeks)
  {
    // get course name
    Console.WriteLine("Enter the course name: ");
    courseName = Console.ReadLine();

    // get number of credits
    Console.WriteLine("Enter the number of credits: ");
    credits = int.Parse(Console.ReadLine());

    // get duration in weeks
    Console.WriteLine("Enter the duration in weeks: ");
    durationInWeeks = int.Parse(Console.ReadLine());
  }

  private static void PrintCourseDetails(string courseName, int credits, int durationInWeeks)
  {
    Console.WriteLine("{0} is a {1}-week course for {2} credits.", courseName, durationInWeeks, credits);
  }

  // -------- UProgram Info --------------------------------------------------------------------------------------------

  private static void GetUProgramInfo(out string programName, out string departmentHead, ref string[] degrees)
  {
    // get program name
    Console.WriteLine("Enter the program name: ");
    programName = Console.ReadLine();

    // get department head
    Console.WriteLine("Enter the full name of the department head: ");
    departmentHead = Console.ReadLine();

    // get three course offerings
    Console.WriteLine("Enter 1 of 3 degree offerings: ");
    string degree1 = Console.ReadLine();
    Console.WriteLine("Enter 2 of 3 degree offerings: ");
    string degree2 = Console.ReadLine();
    Console.WriteLine("Enter 3 of 3 degree offerings: ");
    string degree3 = Console.ReadLine();

    // add offerings to array
    degrees[0] = degree1;
    degrees[1] = degree2;
    degrees[2] = degree3;
  }

  private static void PrintUProgramDetails(string programName, string departmentHead, string[] degrees)
  {
    Console.WriteLine(
      "{0} is the head of the {1} program, which offers degrees in {2}, {3}, and {4}",
      departmentHead,
      programName,
      degrees[0],
      degrees[1],
      degrees[2]
    );
  }

  // -------- Degree Info ----------------------------------------------------------------------------------------------

  private static void GetDegreeInfo(out string degreeName, out int creditsRequired)
  {
    // get degree name
    Console.WriteLine("Enter the degree name: ");
    degreeName = Console.ReadLine();

    // get number of credits required
    Console.WriteLine("Enter the number of credits required: ");
    creditsRequired = int.Parse(Console.ReadLine());
  }

  private static void PrintDegreeDetails(string degreeName, int creditsRequired)
  {
    Console.WriteLine("The {0} degree requires {1} credits.", degreeName, creditsRequired);
  }

  // -------- Validations ----------------------------------------------------------------------------------------------

  private static bool ValidateDateTime(string possibleDate)
  {
    throw new NotImplementedException("This validation method has not been implemented yet.");
  }
}
