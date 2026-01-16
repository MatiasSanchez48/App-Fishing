import 'package:app_fishing/feactures/create_event/bloc/bloc_create_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputDescription extends StatelessWidget {
  const InputDescription({
    required this.controllerDescription,
    super.key,
  });

  ///
  final TextEditingController controllerDescription;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TextFormField(
        controller: controllerDescription,
        onChanged: (value) => context.read<BlocCreateEvent>().add(
          BlocCreateEventSaveEvent(description: value),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Ingrese una descripción';
          }
          return null;
        },
        maxLines: 5,
        decoration: InputDecoration(
          hintText: 'Descripcion',
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
