part of 'bloc_social.dart';

class BlocSocialState extends Equatable {
  const BlocSocialState._();

  BlocSocialState.from(
    BlocSocialState state,
  ) : this._();

  @override
  List<Object?> get props => [];
}

class BlocSocialStateInitial extends BlocSocialState {
  const BlocSocialStateInitial() : super._();
}

class BlocSocialStateLoading extends BlocSocialState {
  BlocSocialStateLoading.from(super.state) : super.from();
}

class BlocSocialStateSuccess extends BlocSocialState {
  BlocSocialStateSuccess.from(super.state) : super.from();
}

class BlocSocialStateError extends BlocSocialState {
  BlocSocialStateError.from(
    super.state, {
    required this.errorMessage,
  }) : super.from();

  final String errorMessage;
}
