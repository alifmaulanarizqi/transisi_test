import 'package:flutter_bloc_basic/src/auth/data/remote/request/auth_request.dart';
import 'package:flutter_bloc_basic/src/auth/data/remote/response/auth_response.dart';
import 'package:flutter_bloc_basic/src/auth/data/remote/service/auth_service.dart';
import 'package:flutter_bloc_basic/src/auth/data/repository/auth_repository.dart';

import '../../../../core/utils/future_util.dart';
import '../../../../core/utils/typedef_util.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  FutureOrError<AuthResponse> login(
      AuthRequest request,
  ) {
    return callOrError(() => _authService.login(request));
  }
}