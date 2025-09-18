import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'bloc_register_event.dart';
part 'bloc_register_state.dart';

class BlocRegister extends Bloc<BlocRegisterEvent, BlocRegisterState> {
  BlocRegister({required this.supabase}) : super(const BlocRegisterInitial()) {
    on<BlocRegisterEventRegister>(_onRegisterEvent);
  }

  /// Instancia de supabase
  final SupabaseClient supabase;

  Future<void> _onRegisterEvent(
    BlocRegisterEventRegister event,
    Emitter<BlocRegisterState> emit,
  ) async {
    try {
      emit(BlocRegisterStateLoading.from(state));
      final response = await supabase.auth.signUp(
        email: event.email,
        password: event.password,
        data: {
          'username': event.name,
        },
      );

      if (response.user != null) {
        emit(BlocRegisterStateSuccess.from(state));
      } else {
        emit(
          BlocRegisterStateError.from(
            state,
            errorMessage: 'Error al registrarse',
          ),
        );
      }
    } on Exception catch (e, st) {
      emit(
        BlocRegisterStateError.from(
          state,
          errorMessage: 'Error al registrarse: $e $st',
        ),
      );
    }
  }
}
