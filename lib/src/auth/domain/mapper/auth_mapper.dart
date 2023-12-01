import 'package:flutter_bloc_basic/src/auth/data/remote/response/auth_response.dart';

import '../model/auth_dto.dart';

extension AuthExt on AuthResponse? {
  AuthDto toDto() {
    return AuthDto(
        id: this?.id ?? 0,
        token: this?.token ?? '',
    );
  }
}