import 'package:flutter/material.dart';

class DialogSuccess extends StatelessWidget {
  const DialogSuccess({
    this.onOk,
    this.description = '',
    super.key,
  });

  ///
  final String description;

  ///
  final void Function()? onOk;

  void showDialogSuccess(BuildContext context) => showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) =>
        DialogSuccess(description: description, onOk: onOk),
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Success!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Icon(
            Icons.done_all_rounded,
            color: Colors.green,
            size: 50,
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
      actions: [
        Center(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: onOk ?? () => Navigator.of(context).pop(),
            child: const Text('OK', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
