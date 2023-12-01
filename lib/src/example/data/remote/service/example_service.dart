import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../../../../../core/data/remote/responses/base_response.dart';
import '../response/example_response.dart';

part 'example_service.g.dart';

@RestApi()
abstract class ExampleService {
  factory ExampleService(Dio dio) => _ExampleService(dio);

  @GET('/users/{id}')
  Future<BaseResponse<ExampleResponse>> getUser({
    @Path('id') int? id,
  });
}