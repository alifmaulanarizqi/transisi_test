part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginInitEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginInitEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}