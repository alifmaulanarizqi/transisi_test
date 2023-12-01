import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_basic/src/auth/data/remote/request/auth_request.dart';
import 'package:flutter_bloc_basic/src/auth/domain/model/auth_dto.dart';
import 'package:flutter_bloc_basic/src/auth/domain/usecase/login_usecase.dart';
import '../../../../../core/domain/models/error_dto.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  var stateData = const LoginStateData();

  LoginBloc({
    required this.loginUseCase,
  }) : super(const LoginInitialState()) {
    on<LoginInitEvent>(_onInitAuthLogin);
  }

  void _onInitAuthLogin(
      LoginInitEvent event,
      Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState(stateData));

    var request = AuthRequest(
      email: event.email,
      password: event.password,
    );

    var result = await loginUseCase.execute(
        request: request
    );

    result.fold((ErrorDto error) {
      stateData = stateData.copyWith(
        user: const AuthDto(),
        error: error,
      );
      emit(LoginFailedState(stateData));
    }, (authDto) async {
      stateData = stateData.copyWith(
        user: authDto,
        error: null,
      );

      emit(LoginSuccessState(stateData));
    });
  }
}