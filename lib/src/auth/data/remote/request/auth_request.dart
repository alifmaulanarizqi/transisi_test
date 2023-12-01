import 'package:json_annotation/json_annotation.dart';

part 'auth_request.g.dart';

@JsonSerializable()
class AuthRequest {
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'password')
  String? password;

  AuthRequest({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}