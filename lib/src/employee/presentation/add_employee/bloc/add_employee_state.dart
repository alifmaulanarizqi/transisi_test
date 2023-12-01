part of 'add_employee_bloc.dart';

/// State data
class AddEmployeeStateData extends Equatable {
  final AddEmployeeDto addEmployeeDto;
  final ErrorDto? error;

  const AddEmployeeStateData({
    this.addEmployeeDto = const AddEmployeeDto(),
    this.error,
  });

  @override
  List<Object?> get props => [error, addEmployeeDto];

  AddEmployeeStateData copyWith({
    AddEmployeeDto? addEmployeeDto,
    ErrorDto? error,
  }) {
    return AddEmployeeStateData(
      addEmployeeDto: addEmployeeDto ?? this.addEmployeeDto,
      error: error ?? this.error,
    );
  }
}

/// State
abstract class AddEmployeeState extends Equatable {
  final AddEmployeeStateData data;

  const AddEmployeeState(this.data);

  @override
  List<Object> get props => [data];
}

class AddEmployeeInitialState extends AddEmployeeState {
  const AddEmployeeInitialState() : super(const AddEmployeeStateData());
}

class AddEmployeeLoadingState extends AddEmployeeState {
  const AddEmployeeLoadingState(super.data);
}

class AddEmployeeSuccessState extends AddEmployeeState {
  const AddEmployeeSuccessState(super.data);
}

class AddEmployeeFailedState extends AddEmployeeState {
  const AddEmployeeFailedState(super.data);
}