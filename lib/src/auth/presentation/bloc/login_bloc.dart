import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_basic/src/auth/data/remote/request/auth_request.dart';
import 'package:flutter_bloc_basic/src/auth/domain/model/auth_dto.dart';
import 'package:flutter_bloc_basic/src/auth/domain/usecase/login_usecase.dart';

import '../../../../core/data/local/app_preferences.dart';
import '../../../../core/domain/models/error_dto.dart';
import '../../data/remote/response/auth_response.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final AppPreferences preferences;

  var stateData = const LoginStateData();

  LoginBloc({
    required this.loginUseCase,
    required this.preferences,
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
      await preferences.setToken(authDto.token);
    });
  }
}