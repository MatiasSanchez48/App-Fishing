part of 'bloc_register.dart';

sealed class BlocRegisterState extends Equatable {
  const BlocRegisterState._();

  const BlocRegisterState.from(
    BlocRegisterState state,
  ) : this._();

  @override
  List<Object> get props => [];
}

final class BlocRegisterInitial extends BlocRegisterState {
  const BlocRegisterInitial() : super._();
}

class BlocRegisterStateSuccess extends BlocRegisterState {
  const BlocRegisterStateSuccess.from(super.state) : super.from();
}

class BlocRegisterStateLoading extends BlocRegisterState {
  const BlocRegisterStateLoading.from(super.state) : super.from();
}

class BlocRegisterStateError extends BlocRegisterState {
  const BlocRegisterStateError.from(super.state, {required this.errorMessage})
    : super.from();

  ///
  final String errorMessage;
}
