import '../../../../../core/data/remote/responses/base_response.dart';
import '../../../../../core/utils/future_util.dart';
import '../../../../../core/utils/typedef_util.dart';
import '../remote/response/employee_response.dart';
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

  @override
  FutureOrError<BaseResponse<EmployeeResponse>> getEmployeeById({
    int? id
  }) {
    return callOrError(() => employeeService.getEmployeeById(id: id));
  }
}