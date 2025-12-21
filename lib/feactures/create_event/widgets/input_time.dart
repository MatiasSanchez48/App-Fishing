import 'package:flutter/material.dart';

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
        onTap: _pickTime,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.access_time,
            color: Colors.grey,
          ),
          hintText: 'Time',
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
