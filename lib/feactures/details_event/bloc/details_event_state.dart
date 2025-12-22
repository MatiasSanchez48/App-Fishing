part of 'details_event.dart';

@immutable
abstract class BlocDetailsEventState extends Equatable {
  const BlocDetailsEventState._();

  const BlocDetailsEventState.from(
    BlocDetailsEventState state,
  ) : this._();

  @override
  List<Object?> get props => [];
}

class BlocDetailsEventStateInitial extends BlocDetailsEventState {
  const BlocDetailsEventStateInitial() : super._();
}

class BlocDetailsEventStateSuccess extends BlocDetailsEventState {
  const BlocDetailsEventStateSuccess.from(
    super.state,
  ) : super.from();
}

class BlocDetailsEventStateForgotPassword extends BlocDetailsEventState {
  const BlocDetailsEventStateForgotPassword.from(super.state) : super.from();
}

class BlocDetailsEventStateLoading extends BlocDetailsEventState {
  const BlocDetailsEventStateLoading.from(super.state) : super.from();
}

class BlocDetailsEventStateError extends BlocDetailsEventState {
  const BlocDetailsEventStateError.from(
    super.state, {
    required this.errorMessage,
  }) : super.from();

  ///
  final String errorMessage;
}
