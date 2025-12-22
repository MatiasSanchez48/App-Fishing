part of 'bloc_settings.dart';

class BlocSettingsState extends Equatable {
  const BlocSettingsState._();

  BlocSettingsState.from(
    BlocSettingsState state,
  ) : this._();

  @override
  List<Object?> get props => [];
}

class BlocSettingsStateInitial extends BlocSettingsState {
  const BlocSettingsStateInitial() : super._();
}

class BlocSettingsStateLoading extends BlocSettingsState {
  BlocSettingsStateLoading.from(super.state) : super.from();
}

class BlocSettingsStateSuccess extends BlocSettingsState {
  BlocSettingsStateSuccess.from(super.state) : super.from();
}

class BlocSettingsStateError extends BlocSettingsState {
  BlocSettingsStateError.from(
    super.state, {
    required this.errorMessage,
  }) : super.from();

  final String errorMessage;
}
