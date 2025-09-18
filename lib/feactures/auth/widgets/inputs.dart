import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({
    required this.controller,
    this.onChanged,
    super.key,
  });

  ///
  final TextEditingController controller;

  final void Function(String)? onChanged;
  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        TextFormField(
          onChanged: widget.onChanged,
          autofillHints: const [AutofillHints.password],
          controller: widget.controller,
          keyboardType: TextInputType.text,
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp(r'\s'),
            ),
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            if (value.length <= 5) {
              return 'Please enter some more 5 characters';
            }
            return null;
          },
          style: const TextStyle(),
          obscureText: _isVisible,
          decoration: InputDecoration(
            hintText: '**********',
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 151, 151, 151),
            ),
            suffixIcon: InkWell(
              onTap: () => setState(
                () => _isVisible = !_isVisible,
              ),
              child: Icon(
                _isVisible
                    ? Icons.visibility_off_outlined
                    : Icons.remove_red_eye_outlined,
                color: const Color.fromARGB(
                  255,
                  151,
                  151,
                  151,
                ),
              ),
            ),
            prefixIcon: const Icon(
              Icons.lock_outlined,
              color: Color.fromARGB(255, 151, 151, 151),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(101, 151, 151, 151),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 199, 221, 3),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InputEmail extends StatelessWidget {
  const InputEmail({
    required this.controller,
    this.onChanged,
    super.key,
  });

  ///
  final TextEditingController controller;

  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        TextFormField(
          onChanged: onChanged,
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.next,
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp(r'\s'),
            ),
            FilteringTextInputFormatter.allow(
              RegExp(r'[a-zA-Z0-9@._\-]'),
            ),
          ],
          validator: (value) {
            final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
            if (!emailRegex.hasMatch(value ?? '')) {
              return 'Please enter a valid email (example@dominio.com)';
            }

            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          style: const TextStyle(),
          decoration: const InputDecoration(
            hintText: '@example.com',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 151, 151, 151),
            ),
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Color.fromARGB(255, 151, 151, 151),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(101, 151, 151, 151),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InputName extends StatelessWidget {
  const InputName({
    required this.controller,
    this.onChanged,
    super.key,
  });

  ///
  final TextEditingController controller;

  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Name',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          onChanged: onChanged,
          autofillHints: const [AutofillHints.name],
          textInputAction: TextInputAction.next,
          controller: controller,
          keyboardType: TextInputType.name,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r'[a-zA-ZáéíóúÁÉÍÓÚñÑüÜ\s]'),
            ),
            LengthLimitingTextInputFormatter(30),
          ],

          style: const TextStyle(),
          decoration: const InputDecoration(
            hintText: 'Name',
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 151, 151, 151),
            ),
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Color.fromARGB(255, 151, 151, 151),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(101, 151, 151, 151),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
