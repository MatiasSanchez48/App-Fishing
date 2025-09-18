import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/auto_route/auto_route.gr.dart';
import 'package:chat_flutter_supabase/feactures/auth/reset_password/bloc/bloc_reset_password.dart';
import 'package:chat_flutter_supabase/feactures/auth/reset_password/widgets/widgets.dart';
import 'package:chat_flutter_supabase/feactures/auth/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<BlocResetPassword, BlocResetPasswordState>(
        listener: (context, state) {
          if (state is BlocResetPasswordStateLoading) {
            DialogLoading.showDialogLoading(context);
          }
          if (state is BlocResetPasswordStateError) {
            Navigator.pop(context);
            const DialogError().showDialogError(context);
          }
          if (state is BlocResetPasswordStateSuccess) {
            Navigator.pop(context);
            DialogSuccess(
              description: 'Change password successful!',
              onOk: () => context.pushRoute(const LoginRoute()),
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
                  child: FormResetPassword(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
