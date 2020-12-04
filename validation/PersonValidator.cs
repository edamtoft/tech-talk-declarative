using System;
using FluentValidation;

namespace Validation
{
  public sealed class PersonValidator : AbstractValidator<Person>
  {
    public PersonValidator()
    {
      RuleFor(x => x.FirstName).NotNull().NotEmpty();
      RuleFor(x => x.LastName).NotNull().NotEmpty();
      RuleFor(x => x.Email).NotNull().EmailAddress();
    }
  }
}