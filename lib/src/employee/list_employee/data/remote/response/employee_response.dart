import 'package:json_annotation/json_annotation.dart';

part 'employee_response.g.dart';

@JsonSerializable()
class EmployeeResponse {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  @JsonKey(name: 'avatar')
  final String? avatar;

  EmployeeResponse(
      this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.avatar,
      );

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) =>
      _$EmployeeResponseFromJson(json);
}