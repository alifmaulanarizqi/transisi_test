import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_bloc_basic/src/employee/list_employee/data/remote/response/employee_response.dart';
import 'package:retrofit/http.dart';
import '../../../../../../core/data/remote/responses/base_response.dart';

part 'employee_service.g.dart';

@RestApi()
abstract class EmployeeService {
  factory EmployeeService(Dio dio) => _EmployeeService(dio);

  @GET('/users')
  Future<BaseResponse<List<EmployeeResponse>>> getListEmployee({
    @Query('page') int? page,
    @Query('per_page') int? perPage,
  });
}