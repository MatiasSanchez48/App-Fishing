import 'package:auto_route/auto_route.dart';
import 'package:app_fishing/auto_route/auto_route.gr.dart';
import 'package:app_fishing/feactures/auth/register/bloc/bloc_register.dart';
import 'package:app_fishing/feactures/auth/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  bool get _isFormValid =>
      controllerPassword.text == controllerRepeatPassword.text &&
      controllerPassword.text.isNotEmpty &&
      controllerRepeatPassword.text.isNotEmpty &&
      controllerName.text.isNotEmpty &&
      controllerEmail.text.isNotEmpty;

  final _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerRepeatPassword = TextEditingController();

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerRepeatPassword.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  ///
  void _onRegister(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    return context.read<BlocRegister>().add(
      BlocRegisterEventRegister(
        name: controllerName.text,
        email: controllerEmail.text,
        password: controllerPassword.text,
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
              'Register',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text('Enter your credentials to access'),
            const SizedBox(height: 30),
            InputName(
              controller: controllerName,
              onChanged: (v) => setState(() {}),
            ),
            const SizedBox(height: 15),
            InputEmail(
              controller: controllerEmail,
              onChanged: (v) => setState(() {}),
            ),
            const SizedBox(height: 15),
            InputPassword(
              controller: controllerPassword,
              onChanged: (v) => setState(() {}),
            ),
            const SizedBox(height: 15),
            InputPassword(
              controller: controllerRepeatPassword,
              onChanged: (v) => setState(() {}),
            ),
            const SizedBox(height: 15),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: _isFormValid
                    ? Colors.black
                    : Colors.grey.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: _isFormValid ? () => _onRegister(context) : null,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () => context.pushRoute(const LoginRoute()),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
