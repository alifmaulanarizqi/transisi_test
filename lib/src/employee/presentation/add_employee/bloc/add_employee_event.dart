part of 'add_employee_bloc.dart';

abstract class AddEmployeeEvent extends Equatable {
  const AddEmployeeEvent();
}

class AddEmployeeInitEvent extends AddEmployeeEvent {
  final String name;
  final String job;

  const AddEmployeeInitEvent({
    required this.name,
    required this.job,
  });

  @override
  List<Object?> get props => [name, job];
}