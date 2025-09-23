import 'package:bloc/bloc.dart';
import 'package:chat_flutter_supabase/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'bloc_message_event.dart';
part 'bloc_message_state.dart';

class BlocMessage extends Bloc<BlocMessageEvent, BlocMessageState> {
  BlocMessage({required this.supabase})
    : super(const BlocMessageStateInitial()) {
    on<BlocMessageHearMessagesEvent>(_onHearMessages);
    on<BlocMessageSendMessagesEvent>(_onSendMessage);
    on<BlocMessageGetMessagesEvent>(_onGetsMessage);
  }

  /// Supabase
  final SupabaseClient supabase;
  Future<void> _onSendMessage(
    BlocMessageSendMessagesEvent event,
    Emitter<BlocMessageState> emit,
  ) async {
    try {
      /// cambiar a otro estado para que parezca que estoy enviando un msj
      emit(BlocMessageStateLoading.from(state));
      final user = supabase.auth.currentUser;
      if (user == null || event.text.trim().isEmpty) return;

      await supabase.from('messages').insert({
        'text': event.text.trim(),
        'user_id': user.id,
        'receiver_id': event.idPerson,
      }).select();

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

      supabase
          .channel('messages_channel')
          .onPostgresChanges(
            event: PostgresChangeEvent.insert,
            schema: 'public',
            table: 'messages',
            callback: (payload) {
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
            },
          )
          .subscribe();
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

      final response = await supabase
          .from('messages')
          .select('id, user_id, receiver_id, text, created_at')
          .or('user_id.eq.${user.id},receiver_id.eq.${user.id}')
          .order('created_at')
          .limit(100);

      final filtrados = response
          .where(
            (msg) =>
                (msg['user_id'] == user.id &&
                    msg['receiver_id'] == event.idPerson) ||
                (msg['user_id'] == event.idPerson &&
                    msg['receiver_id'] == user.id),
          )
          .toList();

      final messages = filtrados
          .map(Message.fromJson)
          .toList()
          .reversed
          .toList();
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
