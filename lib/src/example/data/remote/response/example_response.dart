import 'package:json_annotation/json_annotation.dart';

part 'example_response.g.dart';

@JsonSerializable()
class ExampleResponse {
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

  ExampleResponse(
      this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.avatar,
      );

  factory ExampleResponse.fromJson(Map<String, dynamic> json) =>
      _$ExampleResponseFromJson(json);
}