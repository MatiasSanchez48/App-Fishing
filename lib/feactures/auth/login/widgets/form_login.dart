import 'package:auto_route/auto_route.dart';
import 'package:chat_flutter_supabase/auto_route/auto_route.gr.dart';
import 'package:chat_flutter_supabase/feactures/auth/login/bloc/bloc_login.dart';
import 'package:chat_flutter_supabase/feactures/auth/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  /// Instancia de Supabase para saber sus cambios y solicitudes
  final SupabaseClient supabase = Supabase.instance.client;
  bool get _isFormValid =>
      controllerPassword.text.isNotEmpty && controllerEmail.text.isNotEmpty;

  final _formKey = GlobalKey<FormState>();

  // Controller para cada campo.
  final controllerPassword = TextEditingController(text: '12345678');

  final controllerEmail = TextEditingController(
    text: 'sanchezmati48@gmail.com',
  );
  void _onLogin(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    return context.read<BlocLogin>().add(
      LoginEventLogin(
        email: controllerEmail.text,
        password: controllerPassword.text,
      ),
    );
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
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
              'Login',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text('Enter your credentials to access'),
            const SizedBox(height: 30),
            InputEmail(
              controller: controllerEmail,
              onChanged: (v) => setState(() {}),
            ),
            const SizedBox(height: 10),
            InputPassword(
              controller: controllerPassword,
              onChanged: (v) => setState(() {}),
            ),
            const SizedBox(height: 15),
            DialogForgotPassword(controllerEmail: controllerEmail),
            const SizedBox(height: 15),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: _isFormValid ? Colors.black : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: _isFormValid ? () => _onLogin(context) : null,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45,
                    child: Center(
                      child: Text(
                        'Login',
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
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () => context.pushRoute(const RegisterRoute()),
                  child: const Text(
                    'Sign up',
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
