import 'package:dio/dio.dart';
import 'package:flutter_bloc_basic/src/auth/data/remote/service/auth_service.dart';
import 'package:flutter_bloc_basic/src/auth/data/repository/auth_repository.dart';
import 'package:flutter_bloc_basic/src/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_bloc_basic/src/auth/domain/usecase/login_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthDiModule {
  @singleton
  AuthService authService(Dio dio) => AuthService(dio);

  @Singleton(as: AuthRepository)
  AuthRepositoryImpl get authRepository;

  @injectable
  LoginUseCase loginUseCase(AuthRepository repository) =>
      LoginUseCase(repository);
}