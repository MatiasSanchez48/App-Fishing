part of 'bloc_home.dart';

@freezed
class BlocHomeState extends Equatable {
  const BlocHomeState._();

  BlocHomeState.from(
    BlocHomeState state,
  ) : this._();

  @override
  List<Object?> get props => [];
}

class BlocHomeStateInitial extends BlocHomeState {
  const BlocHomeStateInitial() : super._();
}

class BlocHomeStateLoading extends BlocHomeState {
  BlocHomeStateLoading.from(super.state) : super.from();
}

class BlocHomeStateSuccess extends BlocHomeState {
  BlocHomeStateSuccess.from(super.state) : super.from();
}

class BlocHomeStateError extends BlocHomeState {
  BlocHomeStateError.from(
    super.state, {
    required this.errorMessage,
  }) : super.from();

  final String errorMessage;
}
