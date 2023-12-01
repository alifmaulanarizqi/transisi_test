import 'package:either_dart/either.dart';
import 'package:flutter_bloc_basic/src/example/domain/mapper/example_mapper.dart';
import '../../../../core/data/remote/responses/base_response.dart';
import '../../../../core/utils/typedef_util.dart';
import '../../data/repository/example_repository.dart';
import '../model/example_dto.dart';

class ExampleUseCase {
  final ExampleRepository _repository;
  ExampleUseCase(this._repository);

  FutureOrError<BaseResponse<ExampleDto>> execute({
    int? id,
  }) {
    return _repository.getUser(
        id: id ?? 0).mapRight((response) {
      return BaseResponse(
          data: response.data.toDto(),
          support: response.support,
      );
    });
  }
}