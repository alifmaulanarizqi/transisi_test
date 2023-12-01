import '../../../../core/data/remote/responses/base_response.dart';
import '../../../../core/utils/typedef_util.dart';
import '../remote/response/example_response.dart';

abstract class ExampleRepository {
  FutureOrError<BaseResponse<ExampleResponse>> getUser({
    int? id
  });
}
