import 'package:flutter_bloc_basic/src/employee/list_employee/data/remote/response/employee_response.dart';

import '../../../../../core/data/remote/responses/base_response.dart';
import '../../../../../core/utils/typedef_util.dart';

abstract class EmployeeRepository {
  FutureOrError<BaseResponse<List<EmployeeResponse>>> getListEmployee({
    int? page,
    int? perPage,
  });
}