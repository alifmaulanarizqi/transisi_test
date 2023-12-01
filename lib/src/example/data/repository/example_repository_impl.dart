import '../../../../core/data/remote/responses/base_response.dart';
import '../../../../core/utils/future_util.dart';
import '../../../../core/utils/typedef_util.dart';
import '../remote/response/example_response.dart';
import '../remote/service/example_service.dart';
import 'example_repository.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  final ExampleService exampleService;

  ExampleRepositoryImpl(this.exampleService);

  @override
  FutureOrError<BaseResponse<ExampleResponse>> getUser({
    int? id
  }) {
    print('fromrepository');
    return callOrError(() => exampleService.getUser(id: id));
  }
}