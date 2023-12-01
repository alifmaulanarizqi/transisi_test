// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_employee_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEmployeeResponse _$AddEmployeeResponseFromJson(Map<String, dynamic> json) =>
    AddEmployeeResponse(
      json['name'] as String?,
      json['job'] as String?,
      json['id'] as String?,
      json['createdAt'] as String?,
    );

Map<String, dynamic> _$AddEmployeeResponseToJson(
        AddEmployeeResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'job': instance.job,
      'id': instance.id,
      'createdAt': instance.createdAt,
    };
