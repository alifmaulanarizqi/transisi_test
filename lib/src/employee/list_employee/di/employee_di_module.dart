import 'package:dio/dio.dart';
import 'package:flutter_bloc_basic/src/employee/list_employee/data/remote/service/employee_service.dart';
import 'package:flutter_bloc_basic/src/employee/list_employee/data/repository/employee_repository.dart';
import 'package:flutter_bloc_basic/src/employee/list_employee/domain/usecase/list_employee_usecase.dart';
import 'package:injectable/injectable.dart';

import '../data/repository/employee_repository_impl.dart';

@module
abstract class EmployeeDiModule {
  @singleton
  EmployeeService employeeService(Dio dio) => EmployeeService(dio);

  @Singleton(as: EmployeeRepository)
  EmployeeRepositoryImpl get employeeRepository;

  @injectable
  ListEmployeeUseCase listEmployeeUseCase(EmployeeRepository repository) =>
      ListEmployeeUseCase(repository);
}