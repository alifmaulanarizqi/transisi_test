import 'package:dio/dio.dart';
import 'package:flutter_bloc_basic/src/employee/domain/usecase/list_employee_usecase.dart';
import 'package:injectable/injectable.dart';
import '../data/remote/service/employee_service.dart';
import '../data/repository/employee_repository.dart';
import '../data/repository/employee_repository_impl.dart';
import '../domain/usecase/add_employee_usecase.dart';
import '../domain/usecase/detail_employee_usecase.dart';

@module
abstract class EmployeeDiModule {
  @singleton
  EmployeeService employeeService(Dio dio) => EmployeeService(dio);

  @Singleton(as: EmployeeRepository)
  EmployeeRepositoryImpl get employeeRepository;

  @injectable
  ListEmployeeUseCase listEmployeeUseCase(EmployeeRepository repository) =>
      ListEmployeeUseCase(repository);

  @injectable
  DetailEmployeeUseCase detailEmployeeUseCase(EmployeeRepository repository) =>
      DetailEmployeeUseCase(repository);

  @injectable
  AddEmployeeUseCase addEmployeeUseCase(EmployeeRepository repository) =>
      AddEmployeeUseCase(repository);
}