import 'package:flutter/material.dart';

class DialogConfirm extends StatelessWidget {
  const DialogConfirm({
    required this.title,
    required this.message,
    this.onConfirm,
    this.color,
    super.key,
  });

  ///
  final String title;

  ///
  final String message;

  ///
  final VoidCallback? onConfirm;

  ///
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: color ?? Colors.redAccent,
          letterSpacing: 2,
          wordSpacing: 2,
          height: 1.5,
        ),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.start,
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: const SizedBox(
            height: 50,
            child: Center(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: color ?? Colors.red.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm?.call();
          },
          child: const SizedBox(
            height: 50,
            child: Center(
              child: Text(
                'Confirm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
