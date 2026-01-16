import 'package:app_fishing/feactures/auth/reset_password/bloc/bloc_reset_password.dart';
import 'package:app_fishing/feactures/auth/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormResetPassword extends StatefulWidget {
  const FormResetPassword({super.key});

  @override
  State<FormResetPassword> createState() => _FormResetPasswordState();
}

class _FormResetPasswordState extends State<FormResetPassword> {
  ///
  final controllerPassword = TextEditingController();
  final controllerRepeatPassword = TextEditingController();

  ///
  final _formKey = GlobalKey<FormState>();

  ///
  bool get _isFormValid =>
      controllerPassword.text.isNotEmpty &&
      controllerRepeatPassword.text.isNotEmpty;

  @override
  void dispose() {
    controllerPassword.dispose();
    controllerRepeatPassword.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  ///
  void _onChangePassword(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    context.read<BlocResetPassword>().add(
      BlocResetPasswordEventChangePassword(
        password: controllerPassword.text,
        repeatPassword: controllerRepeatPassword.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Text(
              'Reset password',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text('Enter your new password'),
            const SizedBox(height: 30),
            InputPassword(
              controller: controllerPassword,
              onChanged: (v) => setState(() {}),
            ),
            const SizedBox(height: 15),
            InputPassword(
              controller: controllerRepeatPassword,
              onChanged: (v) => setState(() {}),
            ),
            const SizedBox(height: 30),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: _isFormValid
                    ? Colors.black
                    : Colors.grey.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: _isFormValid ? () => _onChangePassword(context) : null,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(
                        'Reset password',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
