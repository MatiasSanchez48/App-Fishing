import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/auto_route/auto_route.gr.dart';
import 'package:chat_flutter_supabase/feactures/auth/register/bloc/bloc_register.dart';
import 'package:chat_flutter_supabase/feactures/auth/register/widgets/widgets.dart';
import 'package:chat_flutter_supabase/feactures/auth/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<BlocRegister, BlocRegisterState>(
        listener: (context, state) {
          if (state is BlocRegisterStateLoading) {
            DialogLoading.showDialogLoading(context);
          }
          if (state is BlocRegisterStateError) {
            Navigator.pop(context);
            const DialogError().showDialogError(context);
          }
          if (state is BlocRegisterStateSuccess) {
            Navigator.pop(context);
            DialogSuccess(
              description:
                  'Register successful! '
                  '\n Check your email to verify your account',
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
                  child: FormRegister(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
