import 'package:either_dart/either.dart';
import 'package:flutter_bloc_basic/src/auth/data/remote/request/auth_request.dart';
import 'package:flutter_bloc_basic/src/auth/domain/mapper/auth_mapper.dart';
import 'package:flutter_bloc_basic/src/auth/domain/model/auth_dto.dart';
import '../../../../core/utils/typedef_util.dart';
import '../../data/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  FutureOrError<AuthDto> execute({required AuthRequest request}) {
    return _repository
        .login(request)
        .mapRight((response) => response.toDto());
  }
}