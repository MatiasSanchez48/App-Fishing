import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_settings_event.dart';
part 'bloc_settings_state.dart';

class BlocSettingsBloc extends Bloc<BlocSettingsEvent, BlocSettingsState> {
  BlocSettingsBloc() : super(const BlocSettingsStateInitial()) {
    on<BlocSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
