import 'package:either_dart/either.dart';
import 'package:flutter_bloc_basic/src/employee/data/remote/request/add_employee_request.dart';
import 'package:flutter_bloc_basic/src/employee/data/repository/employee_repository.dart';
import 'package:flutter_bloc_basic/src/employee/domain/mapper/add_employee_mapper.dart';

import '../../../../core/utils/typedef_util.dart';
import '../model/add_employee_dto.dart';

class AddEmployeeUseCase {
  final EmployeeRepository _repository;

  AddEmployeeUseCase(this._repository);

  FutureOrError<AddEmployeeDto> execute({required AddEmployeeRequest request}) {
    return _repository
        .addEmployee(request)
        .mapRight((response) => response.toDto());
  }
}