import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/auto_route/auto_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthObserver extends StatefulWidget {
  const AuthObserver({
    required this.child,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  State<AuthObserver> createState() => _AuthObserverState();
}

class _AuthObserverState extends State<AuthObserver> {
  @override
  void initState() {
    super.initState();
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      final _context = context;

      ///

      if (event == AuthChangeEvent.passwordRecovery) {
        print('reset password');
        _context.router.push(const ResetPasswordRoute());
      }

      if (event == AuthChangeEvent.signedIn) {
        context.router.replace(const HomeRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
