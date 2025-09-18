import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'bloc_login_event.dart';
part 'bloc_login_state.dart';

class BlocLogin extends Bloc<BlocLoginEvent, BlocLoginState> {
  BlocLogin({required this.supabase}) : super(const BlocLoginInitial()) {
    on<LoginEventLogin>(_onLoginEvent);
    on<BlocLoginEventForgotPasswordEvent>(_onForgotPassword);
  }

  /// Instancia de supabase
  final SupabaseClient supabase;

  Future<void> _onLoginEvent(
    LoginEventLogin event,
    Emitter<BlocLoginState> emit,
  ) async {
    try {
      emit(BlocLoginStateLoading.from(state));

      final response = await supabase.auth.signInWithPassword(
        email: event.email,
        password: event.password,
      );

      if (response.user != null) {
        await supabase.auth.refreshSession();
        final user = supabase.auth.currentUser;
        if (user == null) throw Exception('No se pudo registrar el usuario');

        final userId = user.id;

        // 2. Comprobar si ya existe en la tabla `users`
        final isUserInTable = await supabase
            .from('users')
            .select()
            .eq('uuid', userId)
            .maybeSingle();

        if (isUserInTable == null) {
          // 3. Insertar si no existe
          await supabase.from('users').insert({
            'uuid': userId,
            'email': event.email,
            'username':
                user.userMetadata?['username'] ?? event.email.split('@').first,
            'avatar_url': '',
            'created_at': DateTime.now().toIso8601String(),
          });
        }

        emit(BlocLoginStateSuccess.from(state));
      } else {
        emit(
          BlocLoginStateError.from(
            state,
            errorMessage: 'Error al iniciar sesion',
          ),
        );
      }
    } on Exception catch (e, st) {
      emit(
        BlocLoginStateError.from(
          state,
          errorMessage: '$e\n$st',
        ),
      );
    }
  }

  ///
  Future<void> _onForgotPassword(
    BlocLoginEventForgotPasswordEvent event,
    Emitter<BlocLoginState> emit,
  ) async {
    try {
      emit(BlocLoginStateLoading.from(state));

      await supabase.auth.resetPasswordForEmail(
        event.email,
        // TODO : Redirigir al componente de reset password
        redirectTo: 'http://localhost:53631/#/reset-password-route',
      );

      emit(BlocLoginStateForgotPassword.from(state));
    } on Exception catch (e, st) {
      emit(
        BlocLoginStateError.from(
          state,
          errorMessage: '$e\n$st',
        ),
      );
    }
  }
}
