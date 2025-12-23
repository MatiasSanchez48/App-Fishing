import 'package:chat_flutter_supabase/models/models.dart';
import 'package:chat_flutter_supabase/repository/base_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RepositoryMessage extends BaseRepository {
  const RepositoryMessage({required super.supabase});

  Future<void> addMessage(String text, String id, String receiver_id) async {
    await supabase.from('messages').insert({
      'text': text.trim(),
      'user_id': id,
      'receiver_id': receiver_id,
    }).select();
  }

  Future<void> heartMessages(
    void Function(PostgresChangePayload) callback,
  ) async {
    supabase
        .channel('messages_channel')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'messages',
          callback: callback,
        )
        .subscribe();
  }

  Future<List<Message>> getsMessages(String id, String receiver_id) async {
    final response = await supabase
        .from('messages')
        .select('id, user_id, receiver_id, text, created_at')
        .or('user_id.eq.$id,receiver_id.eq.$id')
        .order('created_at')
        .limit(100);

    final filtrados = response
        .where(
          (msg) =>
              (msg['user_id'] == id && msg['receiver_id'] == receiver_id) ||
              (msg['user_id'] == receiver_id && msg['receiver_id'] == id),
        )
        .toList();

    return filtrados.map(Message.fromJson).toList().reversed.toList();
  }
}
