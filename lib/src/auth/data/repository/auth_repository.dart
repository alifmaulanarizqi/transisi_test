import 'package:flutter_bloc_basic/src/auth/data/remote/request/auth_request.dart';
import '../../../../core/utils/typedef_util.dart';
import '../remote/response/auth_response.dart';

abstract class AuthRepository {
  FutureOrError<AuthResponse> login(AuthRequest request);
}