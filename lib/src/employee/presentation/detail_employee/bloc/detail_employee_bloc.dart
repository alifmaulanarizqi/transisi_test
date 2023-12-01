import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/domain/models/error_dto.dart';
import '../../../domain/model/employee_dto.dart';
import '../../../domain/usecase/detail_employee_usecase.dart';

part 'detail_employee_event.dart';
part 'detail_employee_state.dart';

class DetailEmployeeBloc extends Bloc<DetailEmployeeEvent, DetailEmployeeState> {
  final DetailEmployeeUseCase detailEmployeeUseCase;
  var stateData = const DetailEmployeeStateData();

  DetailEmployeeBloc({required this.detailEmployeeUseCase})
      : super(const DetailEmployeeInitialState()) {
    on<DetailEmployeeInitEvent>(_onInitDetailEmployee);
  }

  void _onInitDetailEmployee(
      DetailEmployeeInitEvent event,
      Emitter<DetailEmployeeState> emit,
  ) async {
    emit(DetailEmployeeLoadingState(stateData));

    var result = await detailEmployeeUseCase.execute(
        id: event.id
    );

    result.fold((ErrorDto error) {
      stateData = stateData.copyWith(
        employeeDto: const EmployeeDto(),
        error: error,
      );
      emit(DetailEmployeeFailedState(stateData));
    }, (employeeDto) {
      stateData = stateData.copyWith(
        employeeDto: employeeDto.data,
        error: null,
      );

      emit(DetailEmployeeSuccessState(stateData));
    });
  }
}