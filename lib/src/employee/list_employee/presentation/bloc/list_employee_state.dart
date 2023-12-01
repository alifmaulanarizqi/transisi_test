part of 'list_employee_bloc.dart';

class ListEmployeeStateData extends Equatable {
  final int page;
  final int perPage;
  final int total;
  final List<EmployeeDto> employeeDto;
  final ErrorDto? error;

  const ListEmployeeStateData({
    this.page = 1,
    this.perPage = 10,
    this.total = 0,
    this.employeeDto = const [],
    this.error
  });

  @override
  List<Object?> get props => [
    page,
    perPage,
    total,
    employeeDto,
    error
  ];

  ListEmployeeStateData copyWith({
    int? page,
    int? perPage,
    int? total,
    List<EmployeeDto>? employeeDto,
    ErrorDto? error,
  }) {
    return ListEmployeeStateData(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      employeeDto: employeeDto ?? this.employeeDto,
      error: error ?? this.error,
    );
  }
}

abstract class ListEmployeeState extends Equatable {
  final ListEmployeeStateData data;

  const ListEmployeeState(this.data);

  @override
  List<Object> get props => [];
}

class ListEmployeeInitialState extends ListEmployeeState {
  const ListEmployeeInitialState()
      : super(const ListEmployeeStateData());
}

class ListEmployeeLoadingState extends ListEmployeeState {
  const ListEmployeeLoadingState(super.data);
}

class ListEmployeePaginationLoadingState extends ListEmployeeState {
  const ListEmployeePaginationLoadingState(super.data);
}

class ListEmployeeFailedState extends ListEmployeeState {
  const ListEmployeeFailedState(super.data);
}

class ListEmployeeSuccessState extends ListEmployeeState {
  const ListEmployeeSuccessState(super.data);
}

class ListEmployeeEmptyState extends ListEmployeeState {
  const ListEmployeeEmptyState(super.data);
}