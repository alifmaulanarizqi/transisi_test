// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      support: json['support'] == null
          ? null
          : SupportBaseResponse<dynamic>.fromJson(
              json['support'] as Map<String, dynamic>, (value) => value),
      page: json['page'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
      totalPages: json['total_pages'] as int?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'support': instance.support,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

SupportBaseResponse<T> _$SupportBaseResponseFromJson<T>(
        Map<String, dynamic> json) =>
    SupportBaseResponse<T>(
      url: json['url'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$SupportBaseResponseToJson<T>(
        SupportBaseResponse<T> instance) =>
    <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };
