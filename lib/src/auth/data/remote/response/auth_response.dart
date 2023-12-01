import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'token')
  final String? token;

  const AuthResponse(
      this.token,
      this.id,
  );

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}