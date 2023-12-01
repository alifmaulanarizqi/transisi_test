import 'package:flutter_bloc_basic/src/employee/domain/model/employee_dto.dart';
import '../../data/remote/response/employee_response.dart';

extension DetailEmployeeExt on EmployeeResponse? {
  EmployeeDto toDto() {
    return EmployeeDto(
        id: this?.id ?? 0,
        email: this?.email ?? '',
        firstName: this?.firstName ?? '',
        lastName: this?.lastName ?? '',
        avatar: this?.avatar ?? ''
    );
  }
}