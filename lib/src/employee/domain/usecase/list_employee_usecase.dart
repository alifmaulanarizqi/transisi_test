import 'package:either_dart/either.dart';
import 'package:flutter_bloc_basic/src/employee/domain/mapper/list_employee_mapper.dart';
import 'package:flutter_bloc_basic/src/employee/domain/model/employee_dto.dart';
import '../../../../core/data/remote/responses/base_response.dart';
import '../../../../core/utils/typedef_util.dart';
import '../../data/remote/response/employee_response.dart';
import '../../data/repository/employee_repository.dart';

class ListEmployeeUseCase {
  final EmployeeRepository _repository;

  ListEmployeeUseCase(this._repository);

  FutureOrError<BaseResponse<List<EmployeeDto>>> execute({
    int? page,
    int? perPage,
  }) async {
    return _repository.getListEmployee(
      page: page,
      perPage: perPage,
    ).mapRight((response) {
      var data = response.data?.map(_mapCourse).toList() ?? [];

      return BaseResponse(
        data: data,
        page: response.page ?? 1,
        perPage: response.perPage ?? 1,
        total: response.total ?? 1,
        totalPages: response.totalPages ?? 1,
      );
    });

  }

  EmployeeDto _mapCourse(EmployeeResponse employeeResponse) {
    return employeeResponse.toDto();
  }
}