import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_profile_event.dart';
part 'bloc_profile_state.dart';

class BlocProfile extends Bloc<BlocProfileEvent, BlocProfileState> {
  BlocProfile() : super(const BlocProfileStateInitial()) {
    on<BlocProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
