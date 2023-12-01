import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_basic/src/employee/data/remote/request/add_employee_request.dart';

import '../../../../../core/domain/models/error_dto.dart';
import '../../../domain/model/add_employee_dto.dart';
import '../../../domain/usecase/add_employee_usecase.dart';

part 'add_employee_event.dart';
part 'add_employee_state.dart';

class AddEmployeeBloc extends Bloc<AddEmployeeEvent, AddEmployeeState> {
  final AddEmployeeUseCase addEmployeeUseCase;
  var stateData = const AddEmployeeStateData();

  AddEmployeeBloc({
    required this.addEmployeeUseCase,
  }) : super(const AddEmployeeInitialState()) {
    on<AddEmployeeInitEvent>(_onInitAddEmployee);
  }

  void _onInitAddEmployee(
      AddEmployeeInitEvent event,
      Emitter<AddEmployeeState> emit,
  ) async {
    emit(AddEmployeeLoadingState(stateData));

    var request = AddEmployeeRequest(
      name: event.name,
      job: event.job,
    );

    var result = await addEmployeeUseCase.execute(
        request: request
    );

    result.fold((ErrorDto error) {
      stateData = stateData.copyWith(
        addEmployeeDto: const AddEmployeeDto(),
        error: error,
      );
      emit(AddEmployeeFailedState(stateData));
    }, (addEmployeeDto) async {
      stateData = stateData.copyWith(
        addEmployeeDto: addEmployeeDto,
        error: null,
      );

      emit(AddEmployeeSuccessState(stateData));
    });
  }
}