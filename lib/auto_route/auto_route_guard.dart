import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/auto_route/auto_route.gr.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGuard extends AutoRouteGuard {
  const AuthGuard(this._supabaseClient);

  /// Servicio de autenticación
  final SupabaseClient _supabaseClient;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_supabaseClient.auth.currentSession != null) {
      resolver.next();
    } else {
      router.push(const LoginRoute());
    }
  }
}
