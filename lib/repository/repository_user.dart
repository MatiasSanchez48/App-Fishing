import 'package:chat_flutter_supabase/models/models.dart';
import 'package:chat_flutter_supabase/repository/base_repository.dart';

class RepositoryUser extends BaseRepository {
  const RepositoryUser({required super.supabase});

  ///
  Future<Usuario?> getCurrentUser() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return null;

    return getUserById(userId);
  }

  ///
  Future<Usuario?> getUserById(String uuid) async {
    final response = await supabase
        .from('users')
        .select('''
        uuid,
        username,
        email,
        description,
        handle,
        avatar_url,
        created_at
      ''')
        .eq('uuid', uuid)
        .maybeSingle();

    if (response == null) return null;

    return Usuario.fromJson(response);
  }

  ///
  Future<Usuario?> updateUser({
    required String uuid,
    String? username,
    String? email,
    String? description,
    String? handle,
    String? avatarUrl,
  }) async {
    try {
      final updates = <String, dynamic>{
        if (username != null) 'username': username,
        if (email != null) 'email': email,
        if (description != null) 'description': description,
        if (handle != null) 'handle': handle,
        if (avatarUrl != null) 'avatar_url': avatarUrl,
      };

      final response = await supabase
          .from('users')
          .update(updates)
          .eq('uuid', uuid)
          .select()
          .single();

      return Usuario.fromJson(response);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
