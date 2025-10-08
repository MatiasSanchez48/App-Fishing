import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_create_event_event.dart';
part 'bloc_create_event_state.dart';

class BlocCreateEvent extends Bloc<BlocCreateEvent, BlocCreateState> {
  BlocCreateEvent() : super(const BlocCreateStateInitial()) {
    on<BlocCreateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
