import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class Usuario with _$Usuario {
  const factory Usuario({
    required String uuid,
    required String email,
    required String username,
    String? avatarUrl,
    DateTime? createdAt,
  }) = _Usuario;

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);
}
