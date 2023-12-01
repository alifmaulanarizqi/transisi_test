import '../../data/remote/response/example_response.dart';
import '../model/example_dto.dart';

extension ExampleExt on ExampleResponse? {
  ExampleDto toDto() {
    return ExampleDto(
      id: this?.id ?? 0,
      email: this?.email ?? '',
      firstName: this?.firstName ?? '',
      lastName: this?.lastName ?? '',
      avatar: this?.avatar ?? ''
    );
  }
}