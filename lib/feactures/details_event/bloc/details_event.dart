import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'details_event_event.dart';
part 'details_event_state.dart';

class BlocDetailsEvent
    extends Bloc<BlocDetailsEventEvent, BlocDetailsEventState> {
  BlocDetailsEvent() : super(const BlocDetailsEventStateInitial()) {
    on<BlocDetailsEventEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
