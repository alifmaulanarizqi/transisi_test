// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleResponse _$ExampleResponseFromJson(Map<String, dynamic> json) =>
    ExampleResponse(
      json['id'] as int?,
      json['email'] as String?,
      json['first_name'] as String?,
      json['last_name'] as String?,
      json['avatar'] as String?,
    );

Map<String, dynamic> _$ExampleResponseToJson(ExampleResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
    };
