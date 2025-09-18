part of 'bloc_reset_password.dart';

sealed class BlocResetPasswordEvent extends Equatable {
  const BlocResetPasswordEvent();

  @override
  List<Object> get props => [];
}

class BlocResetPasswordEventChangePassword extends BlocResetPasswordEvent {
  const BlocResetPasswordEventChangePassword({
    required this.password,
    required this.repeatPassword,
  });

  ///
  final String password;

  ///
  final String repeatPassword;
}
