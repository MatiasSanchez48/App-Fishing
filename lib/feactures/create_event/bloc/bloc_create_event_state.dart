part of 'bloc_create_event.dart';

@immutable
class BlocCreateState extends Equatable {
  const BlocCreateState._();

  BlocCreateState.from(
    BlocCreateState state,
  ) : this._();

  @override
  List<Object?> get props => [];
}

class BlocCreateStateInitial extends BlocCreateState {
  const BlocCreateStateInitial() : super._();
}

class BlocCreateStateSuccess extends BlocCreateState {
  BlocCreateStateSuccess.from(
    super.state,
  ) : super.from();
}

class BlocCreateStateForgotPassword extends BlocCreateState {
  BlocCreateStateForgotPassword.from(super.state) : super.from();
}

class BlocCreateStateLoading extends BlocCreateState {
  BlocCreateStateLoading.from(super.state) : super.from();
}

class BlocCreateStateError extends BlocCreateState {
  BlocCreateStateError.from(super.state, {required this.errorMessage})
    : super.from();

  ///
  final String errorMessage;
}
