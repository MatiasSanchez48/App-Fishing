part of 'bloc_create_social.dart';

@immutable
class BlocCreateSocialState extends Equatable {
  const BlocCreateSocialState._();

  BlocCreateSocialState.from(
    BlocCreateSocialState state,
  ) : this._();

  @override
  List<Object?> get props => [];
}

class BlocCreateSocialStateInitial extends BlocCreateSocialState {
  const BlocCreateSocialStateInitial() : super._();
}

class BlocCreateSocialStateSuccess extends BlocCreateSocialState {
  BlocCreateSocialStateSuccess.from(
    super.state,
  ) : super.from();
}

class BlocCreateSocialStateForgotPassword extends BlocCreateSocialState {
  BlocCreateSocialStateForgotPassword.from(super.state) : super.from();
}

class BlocCreateSocialStateLoading extends BlocCreateSocialState {
  BlocCreateSocialStateLoading.from(super.state) : super.from();
}

class BlocCreateSocialStateError extends BlocCreateSocialState {
  BlocCreateSocialStateError.from(super.state, {required this.errorMessage})
    : super.from();

  ///
  final String errorMessage;
}
