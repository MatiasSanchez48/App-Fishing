part of 'bloc_profile.dart';

@freezed
class BlocProfileState extends Equatable {
  const BlocProfileState._();

  BlocProfileState.from(
    BlocProfileState state,
  ) : this._();

  @override
  List<Object?> get props => [];
}

class BlocProfileStateInitial extends BlocProfileState {
  const BlocProfileStateInitial() : super._();
}

class BlocProfileStateLoading extends BlocProfileState {
  BlocProfileStateLoading.from(super.state) : super.from();
}

class BlocProfileStateSuccess extends BlocProfileState {
  BlocProfileStateSuccess.from(super.state) : super.from();
}

class BlocProfileStateError extends BlocProfileState {
  BlocProfileStateError.from(
    super.state, {
    required this.errorMessage,
  }) : super.from();

  final String errorMessage;
}
