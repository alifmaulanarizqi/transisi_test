// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_employee_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEmployeeRequest _$AddEmployeeRequestFromJson(Map<String, dynamic> json) =>
    AddEmployeeRequest(
      name: json['name'] as String?,
      job: json['job'] as String?,
    );

Map<String, dynamic> _$AddEmployeeRequestToJson(AddEmployeeRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'job': instance.job,
    };
