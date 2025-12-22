import 'package:bloc/bloc.dart';
import 'package:chat_flutter_supabase/models/models.dart';
import 'package:chat_flutter_supabase/repository/repository_message.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'bloc_message_event.dart';
part 'bloc_message_state.dart';

class BlocMessage extends Bloc<BlocMessageEvent, BlocMessageState> {
  BlocMessage({
    required this.supabase,
  }) : _repositoryMessage = RepositoryMessage(supabase: supabase),
       super(
         const BlocMessageStateInitial(),
       ) {
    on<BlocMessageHearMessagesEvent>(_onHearMessages);
    on<BlocMessageSendMessagesEvent>(_onSendMessage);
    on<BlocMessageGetMessagesEvent>(_onGetsMessage);
  }

  /// Supabase
  final SupabaseClient supabase;
  final RepositoryMessage _repositoryMessage;

  Future<void> _onSendMessage(
    BlocMessageSendMessagesEvent event,
    Emitter<BlocMessageState> emit,
  ) async {
    try {
      /// cambiar a otro estado para que parezca que estoy enviando un msj
      emit(BlocMessageStateLoading.from(state));
      final user = supabase.auth.currentUser;
      if (user == null || event.text.trim().isEmpty) return;

      await _repositoryMessage.addMessage(
        event.text.trim(),
        user.id,
        event.idPerson,
      );

      add(BlocMessageGetMessagesEvent(idPerson: event.idPerson));
    } on Exception catch (e, st) {
      emit(BlocMessageStateError.from(state, errorMessage: '$e $st'));
    }
  }

  Future<void> _onHearMessages(
    BlocMessageHearMessagesEvent event,
    Emitter<BlocMessageState> emit,
  ) async {
    try {
      emit(BlocMessageStateLoading.from(state));
      final user = supabase.auth.currentUser;

      if (user == null) {
        emit(
          BlocMessageStateError.from(
            state,
            errorMessage: 'No se Obtenerel usuario',
          ),
        );
        return;
      }
      await _repositoryMessage.heartMessages((payload) {
        final msg = payload.newRecord;
        add(BlocMessageGetMessagesEvent(idPerson: event.idPerson));

        if ((msg['user_id'] == user.id &&
                msg['receiver_id'] == event.idPerson) ||
            (msg['user_id'] == event.idPerson &&
                msg['receiver_id'] == user.id)) {
          final newMessage = Message.fromJson(msg);
          final updatedMessages = List<Message>.from(state.messages)
            ..add(newMessage);
          emit(
            BlocMessageStateSuccess.from(
              state,
              messages: updatedMessages,
            ),
          );
        }
      });
    } on Exception catch (e, st) {
      emit(BlocMessageStateError.from(state, errorMessage: '$e $st'));
    }
  }

  Future<void> _onGetsMessage(
    BlocMessageGetMessagesEvent event,
    Emitter<BlocMessageState> emit,
  ) async {
    try {
      /// cambiar a otro estado para que parezca que estoy recibiendo un nuevo
      /// msj
      final user = supabase.auth.currentUser;

      if (user == null) {
        emit(
          BlocMessageStateError.from(
            state,
            errorMessage: 'No se Obtenerel usuario',
          ),
        );

        return;
      }
      final messages = await _repositoryMessage.getsMessages(
        user.id,
        event.idPerson,
      );

      emit(BlocMessageStateSuccess.from(state, messages: messages));
    } on Exception catch (e, st) {
      emit(BlocMessageStateError.from(state, errorMessage: '$e $st'));
    }
  }

  @override
  Future<void> close() {
    supabase.removeAllChannels();
    return super.close();
  }
}
