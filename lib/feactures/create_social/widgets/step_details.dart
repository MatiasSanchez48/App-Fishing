import 'package:flutter/material.dart';

class StepDetails extends StatelessWidget {
  const StepDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'Add description',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Text(
            'Add a brief description of your activity.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Colors.grey[600],
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          autofillHints: const [AutofillHints.name],
          textInputAction: TextInputAction.next,
          // controller: controller,
          keyboardType: TextInputType.emailAddress,

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
          maxLines: 8,
          decoration: const InputDecoration(
            hintText: 'Example: Sunday fishing trip on the lake...',
            hintStyle: TextStyle(
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
