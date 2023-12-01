import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_basic/src/employee/domain/model/employee_dto.dart';
import '../../../../../../core/domain/models/error_dto.dart';
import '../../../domain/usecase/list_employee_usecase.dart';

part 'list_employee_event.dart';
part 'list_employee_state.dart';

class ListEmployeeBloc extends Bloc<ListEmployeeEvent, ListEmployeeState> {
  final ListEmployeeUseCase listEmployeeUseCase;
  var stateData = const ListEmployeeStateData();
  bool isLoadingPagination = false;

  ListEmployeeBloc({required this.listEmployeeUseCase})
      : super(const ListEmployeeInitialState()) {
    on<ListEmployeeInitEvent>(_onInitSearch);
  }

  void _onInitSearch(
      ListEmployeeInitEvent event,
      Emitter<ListEmployeeState> emit,
  ) async {
    var hasMoreData =
        stateData.employeeDto.length < stateData.total;
    if (event.page > 1 && !hasMoreData) {
      return;
    }

    if(isLoadingPagination) {
      emit(ListEmployeePaginationLoadingState(stateData));
    } else {
      emit(ListEmployeeLoadingState(stateData));
    }

    stateData = stateData.copyWith(
      page: event.page,
    );

    await _doSearch(page: event.page);

    if (stateData.error != null) {
      emit(ListEmployeeFailedState(stateData));
    } else {
      if(stateData.employeeDto.isEmpty){
        emit(ListEmployeeEmptyState(stateData));
      } else{
        emit(ListEmployeeSuccessState(stateData));
      }
    }
  }

  Future _doSearch({
    int page = 1,
    int perPage = 10,
  }) async {
    stateData = stateData.copyWith(page: page);

    var result = await listEmployeeUseCase.execute(
      page: page,
      perPage: perPage,
    );

    result.fold((ErrorDto error) {
      if (page == 1) {
        stateData = stateData.copyWith(
          employeeDto: [],
          error: error,
        );
      } else {
        stateData = stateData.copyWith(
          error: error,
        );
      }
    }, (right) {
      if (page == 1) {
        stateData = stateData.copyWith(
          page: right.page,
          perPage: right.perPage,
          total: right.total,
          employeeDto: right.data,
          error: null,
        );
      } else {
        var previousEmployee = stateData.employeeDto;
        previousEmployee.addAll(right.data as Iterable<EmployeeDto>);

        stateData = stateData.copyWith(
          employeeDto: previousEmployee,
          error: null,
        );
      }
    });
  }
}