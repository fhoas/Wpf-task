using FluentValidation;
using WpfApp1.Models;

namespace WpfApp1.Validators
{
    public class CoordinateValidator : AbstractValidator<Coordinate>
    {
        public CoordinateValidator()
        {
            RuleFor(coordinate => coordinate.X).NotEmpty().WithMessage("X coordinate is required.");
            RuleFor(coordinate => coordinate.Y).NotEmpty().WithMessage("Y coordinate is required.");
        }
    }
}
