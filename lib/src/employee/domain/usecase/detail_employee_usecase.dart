import 'package:either_dart/either.dart';
import 'package:flutter_bloc_basic/src/employee/domain/mapper/detail_employee_mapper.dart';
import 'package:flutter_bloc_basic/src/employee/domain/model/employee_dto.dart';

import '../../../../core/data/remote/responses/base_response.dart';
import '../../../../core/utils/typedef_util.dart';
import '../../data/repository/employee_repository.dart';

class DetailEmployeeUseCase {
  final EmployeeRepository _repository;
  DetailEmployeeUseCase(this._repository);

  FutureOrError<BaseResponse<EmployeeDto>> execute({
    int? id,
  }) {
    return _repository.getEmployeeById(
        id: id ?? 0).mapRight((response) {
      return BaseResponse(
        data: response.data?.toDto(),
        support: response.support,
      );
    });
  }
}