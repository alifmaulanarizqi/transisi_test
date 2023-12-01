import 'package:json_annotation/json_annotation.dart';

part 'add_employee_request.g.dart';

@JsonSerializable()
class AddEmployeeRequest {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'job')
  String? job;

  AddEmployeeRequest({
    this.name,
    this.job,
  });

  Map<String, dynamic> toJson() => _$AddEmployeeRequestToJson(this);
}