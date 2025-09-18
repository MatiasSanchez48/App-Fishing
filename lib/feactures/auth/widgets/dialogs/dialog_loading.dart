import 'package:flutter/material.dart';

class DialogLoading extends StatelessWidget {
  const DialogLoading({super.key});

  static void showDialogLoading(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const DialogLoading();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(10),
      backgroundColor: Colors.transparent,
      content: SizedBox(
        height: 250,
        width: 250,
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
