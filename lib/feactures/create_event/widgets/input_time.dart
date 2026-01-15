import 'package:chat_flutter_supabase/feactures/create_event/bloc/bloc_create_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImputTime extends StatefulWidget {
  const ImputTime({
    required this.controllerTime,
    super.key,
  });

  ///
  final TextEditingController controllerTime;

  @override
  State<ImputTime> createState() => _ImputTimeState();
}

class _ImputTimeState extends State<ImputTime> {
  TimeOfDay? _selectedDateTime;

  /// Pick Time
  Future<void> _pickTime() async {
    final initialTime = _selectedDateTime ?? TimeOfDay.now();
    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (picked != null) {
      context.read<BlocCreateEvent>().add(
        BlocCreateEventSaveEvent(departureTime: picked.format(context)),
      );
      setState(() {
        _selectedDateTime = picked;
        widget.controllerTime.text = picked.format(context); // muestra en AM/PM
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: widget.controllerTime,
        readOnly: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onTap: _pickTime,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Selecciona un horario';
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.access_time,
            color: Colors.grey,
          ),
          hintText: 'Horario',
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
