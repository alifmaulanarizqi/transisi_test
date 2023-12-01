// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:flutter_bloc_basic/core/data/local/app_preferences.dart' as _i6;
import 'package:flutter_bloc_basic/core/data/remote/interceptors/auth_interceptor.dart'
    as _i3;
import 'package:flutter_bloc_basic/core/data/remote/interceptors/cookie_interceptor.dart'
    as _i4;
import 'package:flutter_bloc_basic/core/di/local_module.dart' as _i20;
import 'package:flutter_bloc_basic/core/di/network_module.dart' as _i19;
import 'package:flutter_bloc_basic/src/auth/data/remote/service/auth_service.dart'
    as _i10;
import 'package:flutter_bloc_basic/src/auth/data/repository/auth_repository.dart'
    as _i16;
import 'package:flutter_bloc_basic/src/auth/data/repository/auth_repository_impl.dart'
    as _i26;
import 'package:flutter_bloc_basic/src/auth/di/auth_di_module.dart' as _i25;
import 'package:flutter_bloc_basic/src/auth/domain/usecase/login_usecase.dart'
    as _i18;
import 'package:flutter_bloc_basic/src/employee/data/remote/service/employee_service.dart'
    as _i8;
import 'package:flutter_bloc_basic/src/employee/data/repository/employee_repository.dart'
    as _i11;
import 'package:flutter_bloc_basic/src/employee/data/repository/employee_repository_impl.dart'
    as _i22;
import 'package:flutter_bloc_basic/src/employee/di/employee_di_module.dart'
    as _i21;
import 'package:flutter_bloc_basic/src/employee/domain/usecase/add_employee_usecase.dart'
    as _i15;
import 'package:flutter_bloc_basic/src/employee/domain/usecase/detail_employee_usecase.dart'
    as _i17;
import 'package:flutter_bloc_basic/src/employee/domain/usecase/list_employee_usecase.dart'
    as _i14;
import 'package:flutter_bloc_basic/src/example/data/remote/service/example_service.dart'
    as _i9;
import 'package:flutter_bloc_basic/src/example/data/repository/example_repository.dart'
    as _i12;
import 'package:flutter_bloc_basic/src/example/data/repository/example_repository_impl.dart'
    as _i24;
import 'package:flutter_bloc_basic/src/example/di/example_di_module.dart'
    as _i23;
import 'package:flutter_bloc_basic/src/example/domain/usecase/example_usecase.dart'
    as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final localModule = _$LocalModule();
    final employeeDiModule = _$EmployeeDiModule(this);
    final exampleDiModule = _$ExampleDiModule(this);
    final authDiModule = _$AuthDiModule(this);
    gh.singleton<_i3.AuthInterceptor>(networkModule.authInterceptor);
    gh.singleton<_i4.CookieInterceptor>(networkModule.cookieInterceptor);
    await gh.singletonAsync<_i5.SharedPreferences>(
      () => localModule.prefs,
      preResolve: true,
    );
    gh.singleton<String>(
      networkModule.baseUrl,
      instanceName: 'base_url',
    );
    gh.singleton<_i6.AppPreferences>(
        localModule.appPreferences(gh<_i5.SharedPreferences>()));
    gh.singleton<_i7.Dio>(networkModule.dio(
      gh<String>(instanceName: 'base_url'),
      gh<_i3.AuthInterceptor>(),
      gh<_i4.CookieInterceptor>(),
    ));
    gh.singleton<_i8.EmployeeService>(
        employeeDiModule.employeeService(gh<_i7.Dio>()));
    gh.singleton<_i9.ExampleService>(
        exampleDiModule.exampleService(gh<_i7.Dio>()));
    gh.singleton<_i10.AuthService>(authDiModule.authService(gh<_i7.Dio>()));
    gh.singleton<_i11.EmployeeRepository>(employeeDiModule.employeeRepository);
    gh.singleton<_i12.ExampleRepository>(exampleDiModule.exampleRepository);
    gh.factory<_i13.ExampleUseCase>(
        () => exampleDiModule.exampleUseCase(gh<_i12.ExampleRepository>()));
    gh.factory<_i14.ListEmployeeUseCase>(() =>
        employeeDiModule.listEmployeeUseCase(gh<_i11.EmployeeRepository>()));
    gh.factory<_i15.AddEmployeeUseCase>(() =>
        employeeDiModule.addEmployeeUseCase(gh<_i11.EmployeeRepository>()));
    gh.singleton<_i16.AuthRepository>(authDiModule.authRepository);
    gh.factory<_i17.DetailEmployeeUseCase>(() =>
        employeeDiModule.detailEmployeeUseCase(gh<_i11.EmployeeRepository>()));
    gh.factory<_i18.LoginUseCase>(
        () => authDiModule.loginUseCase(gh<_i16.AuthRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i19.NetworkModule {}

class _$LocalModule extends _i20.LocalModule {}

class _$EmployeeDiModule extends _i21.EmployeeDiModule {
  _$EmployeeDiModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i22.EmployeeRepositoryImpl get employeeRepository =>
      _i22.EmployeeRepositoryImpl(_getIt<_i8.EmployeeService>());
}

class _$ExampleDiModule extends _i23.ExampleDiModule {
  _$ExampleDiModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i24.ExampleRepositoryImpl get exampleRepository =>
      _i24.ExampleRepositoryImpl(_getIt<_i9.ExampleService>());
}

class _$AuthDiModule extends _i25.AuthDiModule {
  _$AuthDiModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i26.AuthRepositoryImpl get authRepository =>
      _i26.AuthRepositoryImpl(_getIt<_i10.AuthService>());
}
