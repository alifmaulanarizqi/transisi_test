part of 'login_bloc.dart';

/// State data
class LoginStateData extends Equatable {
  final AuthDto user;
  final ErrorDto? error;

  const LoginStateData({
    this.user = const AuthDto(),
    this.error,
  });

  @override
  List<Object?> get props => [error, user];

  LoginStateData copyWith({
    AuthDto? user,
    ErrorDto? error,
  }) {
    return LoginStateData(
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}

/// State
abstract class LoginState extends Equatable {
  final LoginStateData data;

  const LoginState(this.data);

  @override
  List<Object> get props => [data];
}

class LoginInitialState extends LoginState {
  const LoginInitialState() : super(const LoginStateData());
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState(super.data);
}

class LoginSuccessState extends LoginState {
  const LoginSuccessState(super.data);
}

class LoginFailedState extends LoginState {
  const LoginFailedState(super.data);
}