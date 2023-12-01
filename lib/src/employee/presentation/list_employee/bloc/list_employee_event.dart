part of 'list_employee_bloc.dart';

abstract class ListEmployeeEvent extends Equatable {
  const ListEmployeeEvent();
}

class ListEmployeeInitEvent extends ListEmployeeEvent {
  final int page;

  const ListEmployeeInitEvent({
    required this.page,
  });

  @override
  List<Object?> get props => [page];
}