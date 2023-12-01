import 'package:json_annotation/json_annotation.dart';

part 'add_employee_response.g.dart';

@JsonSerializable()
class AddEmployeeResponse {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'job')
  final String? job;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  AddEmployeeResponse(
      this.name,
      this.job,
      this.id,
      this.createdAt,
      );

  factory AddEmployeeResponse.fromJson(Map<String, dynamic> json) =>
      _$AddEmployeeResponseFromJson(json);
}