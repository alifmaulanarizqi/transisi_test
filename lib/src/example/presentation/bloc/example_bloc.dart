import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/domain/models/error_dto.dart';
import '../../domain/model/example_dto.dart';
import '../../domain/usecase/example_usecase.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  final ExampleUseCase exampleUseCase;
  var stateData = const ExampleStateData();

  ExampleBloc({required this.exampleUseCase})
      : super(const ExampleInitialState()) {
    on<ExampleInitEvent>(_onInitExample);
  }

  void _onInitExample(
      ExampleInitEvent event,
      Emitter<ExampleState> emit,
  ) async {
    emit(ExampleLoadingState(stateData));

    print('wjdhewiu1');
    var result = await exampleUseCase.execute(
        id: event.id
    );

    print('wjdhewiu2');
    result.fold((ErrorDto error) {
      stateData = stateData.copyWith(
        exampleDto: const ExampleDto(),
        error: error,
      );
      emit( ExampleFailedState(stateData));
    }, (exampleDto) {
      stateData = stateData.copyWith(
        exampleDto: exampleDto.data,
        error: null,
      );

      emit(ExampleSuccessState(stateData));
    });
  }
}