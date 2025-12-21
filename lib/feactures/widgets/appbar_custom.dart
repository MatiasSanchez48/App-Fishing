import 'package:flutter/material.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({
    required this.title,
    this.onPressed,
    this.iconLeft,
    this.iconRight,
    super.key,
  });

  ///
  final String title;

  ///
  final VoidCallback? onPressed;

  ///
  final IconData? iconLeft;

  ///
  final IconData? iconRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (iconLeft != null)
          IconButton(
            icon: Icon(iconLeft),
            onPressed: onPressed,
          ),
        if (iconRight != null) const SizedBox(width: 50),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (iconLeft != null) const SizedBox(width: 50),
        if (iconRight != null)
          IconButton(
            icon: Icon(iconRight),
            onPressed: onPressed,
          ),
      ],
    );
  }
}
