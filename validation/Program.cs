using System;

namespace Validation
{
  class Program
  {
    static void Main(string[] args)
    {
      var fname = Prompt("First Name: ");
      var lname = Prompt("Last Name: ");
      var email = Prompt("Email: ");

      var person = new Person
      { 
        FirstName = fname, 
        LastName = lname, 
        Email = email
      };

      var result = new PersonValidator().Validate(person);

      if (result.IsValid)
      {
        Console.WriteLine("Ok");
      }
      else
      {
        foreach (var error in result.Errors)
        {
          Console.WriteLine(error.ErrorMessage);
        }
      }
    }

    static string Prompt(string message)
    {
      Console.Write(message);
      return Console.ReadLine();
    }
  }
}
