part of 'bloc_login.dart';

@immutable
abstract class BlocLoginState extends Equatable {
  const BlocLoginState._();

  const BlocLoginState.from(
    BlocLoginState state,
  ) : this._();

  @override
  List<Object?> get props => [];
}

class BlocLoginInitial extends BlocLoginState {
  const BlocLoginInitial() : super._();
}

class BlocLoginStateSuccess extends BlocLoginState {
  const BlocLoginStateSuccess.from(super.state) : super.from();
}
class BlocLoginStateForgotPassword extends BlocLoginState {
  const BlocLoginStateForgotPassword.from(super.state) : super.from();
}

class BlocLoginStateLoading extends BlocLoginState {
  const BlocLoginStateLoading.from(super.state) : super.from();
}

class BlocLoginStateError extends BlocLoginState {
  const BlocLoginStateError.from(super.state, {required this.errorMessage})
    : super.from();

  ///
  final String errorMessage;
}
