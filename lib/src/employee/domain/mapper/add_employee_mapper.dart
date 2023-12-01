import 'package:flutter_bloc_basic/src/employee/data/remote/response/add_employee_response.dart';
import 'package:flutter_bloc_basic/src/employee/domain/model/add_employee_dto.dart';

extension AddEmployeeExt on AddEmployeeResponse? {
  AddEmployeeDto toDto() {
    return AddEmployeeDto(
      name: this?.name ?? '',
      job: this?.job ?? '',
      id: this?.id ?? '',
      createdAt: this?.createdAt ?? '',
    );
  }
}