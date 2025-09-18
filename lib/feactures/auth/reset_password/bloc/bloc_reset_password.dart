import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'bloc_reset_password_event.dart';
part 'bloc_reset_password_state.dart';

class BlocResetPassword
    extends Bloc<BlocResetPasswordEvent, BlocResetPasswordState> {
  BlocResetPassword({required this.supabase})
    : super(const BlocResetPasswordStateInitial()) {
    on<BlocResetPasswordEventChangePassword>(_onChangePassword);
  }

  /// Instancia de supabase
  final SupabaseClient supabase;

  Future<void> _onChangePassword(
    BlocResetPasswordEventChangePassword event,
    Emitter<BlocResetPasswordState> emit,
  ) async {
    try {
      emit(BlocResetPasswordStateLoading.from(state));
      final response = await supabase.auth.updateUser(
        UserAttributes(
          password: event.password,
        ),
      );

      if (response.user != null) {
        emit(BlocResetPasswordStateSuccess.from(state));
      } else {
        emit(
          BlocResetPasswordStateError.from(
            state,
            errorMessage: 'error al cambiar la contraseña',
          ),
        );
      }
    } on Exception catch (e, st) {
      emit(
        BlocResetPasswordStateError.from(
          state,
          errorMessage: '$e $st',
        ),
      );
    }
  }
}
