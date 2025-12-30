import 'package:bloc/bloc.dart';
import 'package:chat_flutter_supabase/models/models.dart';
import 'package:chat_flutter_supabase/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'details_event_event.dart';
part 'details_event_state.dart';

class BlocDetailsEvent
    extends Bloc<BlocDetailsEventEvent, BlocDetailsEventState> {
  BlocDetailsEvent({required this.supabase})
    : super(const BlocDetailsEventStateInitial()) {
    on<BlocDetailsEventGetEvent>(_onGetEvent);
    on<BlocDetailsEventDeleteEvent>(_onDeleteEvent);

    on<BlocDetailsEventEnterEvent>(_onEnterEvent);
    on<BlocDetailsEventLeaveEvent>(_onLeaveEvent);
  }

  /// Instancia de supabase
  final SupabaseClient supabase;

  ///
  late final _repositoryFishingEvent = RepositoryFishingEvent(
    supabase: supabase,
  );
  late final _repositoryEventParticipant = RepositoryEventParticipant(
    supabase: supabase,
  );

  ///
  Future<void> _onGetEvent(
    BlocDetailsEventGetEvent event,
    Emitter<BlocDetailsEventState> emit,
  ) async {
    try {
      emit(BlocDetailsEventStateLoadingInitial.from(state));
      final getEvent = await _repositoryFishingEvent.getEventById(event.id);

      emit(BlocDetailsEventStateSuccess.from(state, event: getEvent));
    } on Exception catch (e, st) {
      emit(BlocDetailsEventStateError.from(state, errorMessage: '$e $st'));
    }
  }

  ///
  Future<void> _onDeleteEvent(
    BlocDetailsEventDeleteEvent event,
    Emitter<BlocDetailsEventState> emit,
  ) async {
    try {
      emit(BlocDetailsEventStateLoading.from(state));
      await _repositoryFishingEvent.deleteEvent(state.event?.id ?? 0);

      emit(BlocDetailsEventStateSuccessDeleteEvent.from(state));
    } on Exception catch (e, st) {
      emit(BlocDetailsEventStateError.from(state, errorMessage: '$e $st'));
    }
  }

  Future<void> _onEnterEvent(
    BlocDetailsEventEnterEvent event,
    Emitter<BlocDetailsEventState> emit,
  ) async {
    try {
      emit(BlocDetailsEventStateLoading.from(state));
      // Lógica para entrar al evento
      final joinEvent = await _repositoryEventParticipant.joinEvent(
        state.event!.id,
      );
      final newEvent = state.event?.copyWith(
        participants: [
          ...state.event?.participants ?? [],
          joinEvent,
        ],
      );
      
      emit(
        BlocDetailsEventStateSuccessJoinEvent.from(
          state,
          event: newEvent,
        ),
      );
    } on Exception catch (e, st) {
      emit(BlocDetailsEventStateError.from(state, errorMessage: '$e $st'));
    }
  }

  Future<void> _onLeaveEvent(
    BlocDetailsEventLeaveEvent event,
    Emitter<BlocDetailsEventState> emit,
  ) async {
    try {
      emit(BlocDetailsEventStateLoading.from(state));
      // Lógica para salir del evento
      final leaveEvent = await _repositoryEventParticipant.leaveEvent(
        state.event?.id ?? 0,
      );

      emit(
        BlocDetailsEventStateSuccessLeaveEvent.from(
          state,
          event: leaveEvent,
        ),
      );
    } on Exception catch (e, st) {
      emit(BlocDetailsEventStateError.from(state, errorMessage: '$e $st'));
    }
  }
}
