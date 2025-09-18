import 'package:chat_flutter_supabase/auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/feactures/auth/auth_observer.dart';
import 'package:chat_flutter_supabase/feactures/auth/login/bloc/bloc_login.dart';
import 'package:chat_flutter_supabase/feactures/auth/register/bloc/bloc_register.dart';
import 'package:chat_flutter_supabase/feactures/auth/reset_password/bloc/bloc_reset_password.dart';
import 'package:chat_flutter_supabase/feactures/home/bloc/bloc_home.dart';
import 'package:chat_flutter_supabase/feactures/message/bloc/bloc_message.dart';
import 'package:chat_flutter_supabase/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class App extends StatelessWidget {
  const App({super.key});

  /// The Supabase client
  SupabaseClient get _supabase => Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return AuthObserver(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BlocLogin>(
            create: (context) => BlocLogin(
              supabase: _supabase,
            ),
          ),
          BlocProvider<BlocResetPassword>(
            create: (context) => BlocResetPassword(
              supabase: _supabase,
            ),
          ),
          BlocProvider<BlocRegister>(
            create: (context) => BlocRegister(
              supabase: _supabase,
            ),
          ),
          BlocProvider<BlocHome>(
            create: (context) => BlocHome(
              supabase: _supabase,
            ),
          ),
          BlocProvider<BlocMessage>(
            create: (context) => BlocMessage(
              supabase: _supabase,
            ),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routeInformationParser: appRouter.defaultRouteParser(),
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: appRouter.delegate(),
    );
  }
}
