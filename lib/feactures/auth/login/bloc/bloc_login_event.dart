part of 'bloc_login.dart';

@immutable
abstract class BlocLoginEvent extends Equatable {
  const BlocLoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEventLogin extends BlocLoginEvent {
  const LoginEventLogin({
    required this.email,
    required this.password,
  }) : super();

  ///
  final String email;

  ///
  final String password;
}

class BlocLoginEventForgotPasswordEvent extends BlocLoginEvent {
  const BlocLoginEventForgotPasswordEvent({
    required this.email,
  }) : super();

  ///
  final String email;
}
