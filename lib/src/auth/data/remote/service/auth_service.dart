import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_bloc_basic/src/auth/data/remote/request/auth_request.dart';
import 'package:flutter_bloc_basic/src/auth/data/remote/response/auth_response.dart';
import 'package:retrofit/http.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) => _AuthService(dio);

  @POST('/login')
  Future<AuthResponse> login(@Body() AuthRequest request);
}