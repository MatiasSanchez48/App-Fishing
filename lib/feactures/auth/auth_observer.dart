import 'dart:async';

import 'package:app_fishing/auto_route/auto_route.dart';
import 'package:app_fishing/auto_route/auto_route.gr.dart';
import 'package:app_links/app_links.dart';
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
  final _appLinks = AppLinks();
  final appRouter = AppRouter();

  late final StreamSubscription<dynamic> _linkSub;
  late final StreamSubscription<dynamic> _authSub;

  @override
  void initState() {
    super.initState();
    _linkSub = _appLinks.uriLinkStream.listen(_handleDeepLink);

    _authSub = Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      _handleAuthEvent(data.event);
    });
  }

  void _handleDeepLink(Uri uri) {
    if (uri.fragment.contains('type=recovery')) {
      appRouter.replace(const ResetPasswordRoute());
      return;
    }

    if (uri.toString().contains('auth/callback')) {
      debugPrint('Deep link verify: $uri');
    }
  }

  void _handleAuthEvent(AuthChangeEvent event) {
    if (event == AuthChangeEvent.passwordRecovery) {
      appRouter.replace(const ResetPasswordRoute());
    }

    if (event == AuthChangeEvent.signedIn) {
      appRouter.replace(const HomeRoute());
    }
  }

  @override
  void dispose() {
    _linkSub.cancel();
    _authSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
