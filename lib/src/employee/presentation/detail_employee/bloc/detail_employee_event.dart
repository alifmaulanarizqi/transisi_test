part of 'detail_employee_bloc.dart';

abstract class DetailEmployeeEvent extends Equatable {
  const DetailEmployeeEvent();
}

class DetailEmployeeInitEvent extends DetailEmployeeEvent {
  final int id;

  const DetailEmployeeInitEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}