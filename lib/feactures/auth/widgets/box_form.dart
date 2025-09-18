import 'package:flutter/material.dart';

class BoxForm extends StatelessWidget {
  const BoxForm({
    required this.child,
    super.key,
  });

  ///
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(10, 0),
          ),
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, -10),
          ),
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(-10, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: child,
      ),
    );
  }
}
