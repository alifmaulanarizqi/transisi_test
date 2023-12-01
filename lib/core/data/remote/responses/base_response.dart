import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

///
/// {
///   "status": <bool>,
///   "code": <int>,
///   "message": <string>,
///   "data": <T>
/// }
///
@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  @JsonKey(name: 'page')
  final int? page;
  @JsonKey(name: 'per_page')
  final int? perPage;
  @JsonKey(name: 'total')
  final int? total;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: 'support')
  final SupportBaseResponse? support;
  @JsonKey(name: 'data')
  final T? data;

  BaseResponse({
    this.support,
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);
}

@JsonSerializable()
class SupportBaseResponse<T> {
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'text')
  final String? text;

  SupportBaseResponse({
    this.url,
    this.text,
  });

  factory SupportBaseResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$SupportBaseResponseFromJson(json);
}