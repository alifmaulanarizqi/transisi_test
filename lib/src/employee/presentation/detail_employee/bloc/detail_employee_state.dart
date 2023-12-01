part of 'detail_employee_bloc.dart';

class DetailEmployeeStateData extends Equatable {
  final EmployeeDto employeeDto;
  final ErrorDto? error;

  const DetailEmployeeStateData({
    this.employeeDto = const EmployeeDto(),
    this.error
  });

  @override
  List<Object?> get props => [
    employeeDto,
    error
  ];

  DetailEmployeeStateData copyWith({
    EmployeeDto? employeeDto,
    ErrorDto? error,
  }) {
    return DetailEmployeeStateData(
      employeeDto: employeeDto ?? this.employeeDto,
      error: error ?? this.error,
    );
  }
}

abstract class DetailEmployeeState extends Equatable {
  final DetailEmployeeStateData data;

  const DetailEmployeeState(this.data);

  @override
  List<Object> get props => [];
}

class DetailEmployeeInitialState extends DetailEmployeeState {
  const DetailEmployeeInitialState()
      : super(const DetailEmployeeStateData());
}

class DetailEmployeeLoadingState extends DetailEmployeeState {
  const DetailEmployeeLoadingState(super.data);
}

class DetailEmployeeFailedState extends DetailEmployeeState {
  const DetailEmployeeFailedState(super.data);
}

class DetailEmployeeSuccessState extends DetailEmployeeState {
  const DetailEmployeeSuccessState(super.data);
}