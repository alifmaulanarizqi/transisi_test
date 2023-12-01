import 'package:flutter_bloc_basic/src/employee/data/remote/request/add_employee_request.dart';
import 'package:flutter_bloc_basic/src/employee/data/remote/response/add_employee_response.dart';
import '../../../../../core/data/remote/responses/base_response.dart';
import '../../../../../core/utils/typedef_util.dart';
import '../remote/response/employee_response.dart';

abstract class EmployeeRepository {
  FutureOrError<BaseResponse<List<EmployeeResponse>>> getListEmployee({
    int? page,
    int? perPage,
  });

  FutureOrError<BaseResponse<EmployeeResponse>> getEmployeeById({
    int? id
  });

  FutureOrError<AddEmployeeResponse> addEmployee(AddEmployeeRequest request);
}