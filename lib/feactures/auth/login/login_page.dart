import 'package:auto_route/auto_route.dart';
import 'package:app_fishing/auto_route/auto_route.gr.dart';
import 'package:app_fishing/feactures/auth/login/bloc/bloc_login.dart';
import 'package:app_fishing/feactures/auth/login/widgets/widgets.dart';
import 'package:app_fishing/feactures/auth/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<BlocLogin, BlocLoginState>(
        listener: (context, state) {
          if (state is BlocLoginStateLoading) {
            DialogLoading.showDialogLoading(context);
          }
          if (state is BlocLoginStateError) {
            Navigator.pop(context);
            const DialogError(
              description: 'error to login',
            ).showDialogError(context);
          }
          if (state is BlocLoginStateSuccess) {
            Navigator.pop(context);
            DialogSuccess(
              description: 'Login successful!',
              onOk: () => context.replaceRoute(const HomeRoute()),
            ).showDialogSuccess(context);
          }
          if (state is BlocLoginStateForgotPassword) {
            Navigator.pop(context);
            Navigator.pop(context);
            DialogSuccess(
              description: 'Check your email to reset your password.',
              onOk: () => Navigator.pop(context),
            ).showDialogSuccess(context);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              child: const Center(
                child: BoxForm(
                  child: FormLogin(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
