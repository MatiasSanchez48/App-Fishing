part of 'bloc_reset_password.dart';

sealed class BlocResetPasswordState extends Equatable {
  const BlocResetPasswordState._();

  const BlocResetPasswordState.from(
    BlocResetPasswordState state,
  ) : this._();

  @override
  List<Object> get props => [];
}

class BlocResetPasswordStateInitial extends BlocResetPasswordState {
  const BlocResetPasswordStateInitial() : super._();
}

class BlocResetPasswordStateLoading extends BlocResetPasswordState {
  const BlocResetPasswordStateLoading.from(super.state) : super.from();
}

class BlocResetPasswordStateSuccess extends BlocResetPasswordState {
  const BlocResetPasswordStateSuccess.from(super.state) : super.from();
}

class BlocResetPasswordStateError extends BlocResetPasswordState {
  const BlocResetPasswordStateError.from(
    super.state, {
    required this.errorMessage,
  }) : super.from();

  ///
  final String errorMessage;
}
