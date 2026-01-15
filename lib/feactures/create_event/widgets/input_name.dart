import 'package:flutter/material.dart';

class InputName extends StatelessWidget {
  const InputName({
    required this.controllerName,
    this.hintText = 'Nombre',
    this.onChanged,
    super.key,
  });

  ///
  final TextEditingController controllerName;

  ///
  final String hintText;

  ///
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controllerName,
        autofillHints: const [AutofillHints.name],
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) => onChanged?.call(value),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Escriba $hintText/Titulo';
          }
          return null;
        },
        keyboardType: TextInputType.name,
        maxLength: 50,
        decoration: InputDecoration(
          counterText: '',
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
        ),
      ),
    );
  }
}
