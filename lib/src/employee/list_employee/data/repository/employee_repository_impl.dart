import 'package:flutter_bloc_basic/src/employee/list_employee/data/remote/response/employee_response.dart';

import '../../../../../core/data/remote/responses/base_response.dart';
import '../../../../../core/utils/future_util.dart';
import '../../../../../core/utils/typedef_util.dart';
import '../remote/service/employee_service.dart';
import 'employee_repository.dart';

class EmployeeRepositoryImpl extends EmployeeRepository {
  final EmployeeService employeeService;

  EmployeeRepositoryImpl(this.employeeService);

  @override
  FutureOrError<BaseResponse<List<EmployeeResponse>>> getListEmployee({
    int? page,
    int? perPage
  }) {
    return callOrError(() => employeeService.getListEmployee(
      page: page,
      perPage: perPage,
    ));
  }
}