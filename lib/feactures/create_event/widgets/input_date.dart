import 'package:flutter/material.dart';

class InputDate extends StatefulWidget {
  const InputDate({
    required this.controllerDate,
    required this.onDateSelected,
    this.hintText = 'Select Date',
    this.firstDate,
    this.isDateSelected = false,
    super.key,
  });

  ///
  final TextEditingController controllerDate;

  ///
  final void Function(DateTime date) onDateSelected;

  ///
  final DateTime? firstDate;

  ///
  final bool isDateSelected;

  ///
  final String hintText;

  @override
  State<InputDate> createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  /// Pick Date
  Future<void> _pickDate(BuildContext context) async {
    DateTime? selectedDate;

    final initialDate = selectedDate ?? widget.firstDate;
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: widget.firstDate ?? DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate = picked;

      widget.onDateSelected(selectedDate);
      widget.controllerDate.text =
          '${picked.day}/${picked.month}/${picked.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: TextFormField(
        enabled: widget.isDateSelected,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: TextInputAction.next,
        controller: widget.controllerDate,
        readOnly: true,
        onTap: () async => _pickDate(context),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a date';
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.calendar_today,
            color: Colors.grey,
          ),
          hintText: widget.hintText,
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
