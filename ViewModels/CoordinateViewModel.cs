using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;
using WpfApp1.Models;
using WpfApp1.Validators;
using AutoMapper;
using FluentValidation;
using FluentValidation.Results;
using System.Linq;
using System.Windows;

namespace WpfApp1.ViewModels
{
    public class CoordinateViewModel : INotifyPropertyChanged
    {
        private readonly IMapper _mapper;
        private readonly IValidator<Coordinate> _validator;
        private string _validationErrors = string.Empty;

        private double _x;
        public double X
        {
            get => _x;
            set
            {
                _x = value;
                OnPropertyChanged();
            }
        }

        private double _y;
        public double Y
        {
            get => _y;
            set
            {
                _y = value;
                OnPropertyChanged();
            }
        }

        public string ValidationErrors
        {
            get => _validationErrors;
            private set
            {
                _validationErrors = value;
                OnPropertyChanged();
            }
        }

        public ICommand SubmitCommand { get; }

        public CoordinateViewModel()
        {
            var config = new MapperConfiguration(cfg => cfg.CreateMap<CoordinateViewModel, Coordinate>());
            _mapper = config.CreateMapper();
            _validator = new CoordinateValidator();
            SubmitCommand = new RelayCommand(Submit);
        }

        public Coordinate ToModel()
        {
            return _mapper.Map<Coordinate>(this);
        }

        private void Submit(object? parameter)
        {
            var coordinate = ToModel();
            ValidationResult results = _validator.Validate(coordinate);

            if (results.IsValid)
            {
                ValidationErrors = "Valid inputs.";
                OnPropertyChanged(nameof(X));
                OnPropertyChanged(nameof(Y));
            }
            else
            {
                ValidationErrors = string.Join("\n", results.Errors.Select(e => e.ErrorMessage));
            }
        }

        public event PropertyChangedEventHandler? PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null!)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }

    public class RelayCommand : ICommand
    {
        private readonly Action<object?> _execute;
        private readonly Predicate<object?>? _canExecute;

        public RelayCommand(Action<object?> execute, Predicate<object?>? canExecute = null)
        {
            _execute = execute ?? throw new ArgumentNullException(nameof(execute));
            _canExecute = canExecute;
        }

        public bool CanExecute(object? parameter) => _canExecute?.Invoke(parameter) ?? true;

        public void Execute(object? parameter) => _execute(parameter);

        public event EventHandler? CanExecuteChanged
        {
            add => CommandManager.RequerySuggested += value;
            remove => CommandManager.RequerySuggested -= value;
        }
    }
}
