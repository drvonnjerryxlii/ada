// 1.  Create a C# Console application.
//
// 2.  Within the Main() method in this application, create variables of the
//     correct data type for the information related to a student only.  The
//     other information will be used in later modules when you create class
//     files for the other objects listed:
//
// 3.  Once you have the variables created, use assignment statements to assign
//     values to one set of student variables and use the Console.WriteLine()
//     method to output the values to the console window.
//
// Investigate the .NET Framework documenation around Console.ReadLine() and
// modify your code to use this method for accepting input from a user of your
// application.  Using Console.ReadLine(), prompt a user for information about a
// student.  One prompt for each student variable you created earlier.  Use the
// appropriate code to assign the values from the user to the variables for the
// student.

using System;

public class Module1
{
  public static void Main()
  {
    // declare a bunch of variables
    string firstName;
    string lastName;
    DateTime birthdate;
    string addressLine1;
    string addressLine2;
    string city;
    string stateOrProvince;
    string postalCode;
    string country;

    // bring meaning to the variables
    // firstName = "Jarg";
    // lastName = "Jeeooorrrrb";
    // birthdate = new DateTime(1901, 1, 1); // Jan 1st 1901
    // addressLine1 = "1234 Fake St SWN"; // ahhh, the southwestnorth side of town!
    // addressLine2 = "Apt #764";
    // city = "Villagetown";
    // stateOrProvince = "TX";
    // postalCode = "60652"; // hmm, it seems this villagetown, tx is actually chicago, il
    // country = "USA";
    firstName = GetUserResponse("First Name");
    lastName = GetUserResponse("Last Name");
    int year = int.Parse(GetUserResponse("Birth Year"));
    int month = int.Parse(GetUserResponse("Birth Month"));
    int day = int.Parse(GetUserResponse("Birth Day"));
    birthdate = new DateTime(year, month, day);
    addressLine1 = GetUserResponse("Address Line 1");
    addressLine2 = GetUserResponse("Address Line 2");
    city = GetUserResponse("City");
    stateOrProvince = GetUserResponse("State / Province");
    postalCode = GetUserResponse("Zip / Postal Code");
    country = GetUserResponse("County");

    // display the contents of the variables to the user
    Console.WriteLine(String.Format("{0} {1}", firstName, lastName));
    Console.WriteLine("Est. " + birthdate);
    Console.WriteLine(addressLine1);
    Console.WriteLine(addressLine2);
    Console.WriteLine(String.Format("{0}, {1} {2}", city, stateOrProvince, postalCode));
    Console.WriteLine(country);
  }

  public static string GetUserResponse(string desiredInfo) {
    // initialize empty string
    string userResponse = String.Empty;

    // until user provides meaningful input, keep asking for desired input
    while (userResponse.Length == 0)
    {
	    Console.WriteLine(String.Format("{0}:", desiredInfo));
      userResponse = Console.ReadLine();
  	}

    // return meaningful input
    return userResponse;
  }
}
