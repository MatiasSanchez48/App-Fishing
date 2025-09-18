import 'package:chat_flutter_supabase/feactures/auth/login/bloc/bloc_login.dart';
import 'package:chat_flutter_supabase/feactures/auth/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogForgotPassword extends StatelessWidget {
  const DialogForgotPassword({
    required this.controllerEmail,
    super.key,
  });

  ///
  final TextEditingController controllerEmail;

  void _dialogForgotPassword(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(
          context,
        ).colorScheme.surface,
        titlePadding: const EdgeInsets.only(
          top: 10,
          left: 16,
          right: 10,
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const Text(
              'Reset password',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        content: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Please enter your email address to'
                ' receive instructions on how to'
                ' reset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(
                    255,
                    99,
                    99,
                    99,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              InputEmail(controller: controllerEmail),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  ),
                  onPressed: () => context.read<BlocLogin>().add(
                    BlocLoginEventForgotPasswordEvent(
                      email: controllerEmail.text,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 45,
                        child: Center(
                          child: Text(
                            'Reset password',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () => _dialogForgotPassword(context),
          child: const Text(
            'Forget password?',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blueAccent,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
