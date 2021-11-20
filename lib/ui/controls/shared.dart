import 'package:flutter/material.dart';

class CircularShadow extends StatelessWidget {
  final Widget child;
  final double? blur;
  final double? shadowOpacity;

  const CircularShadow({
    Key? key,
    required this.child,
    this.blur,
    this.shadowOpacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(shadowOpacity ?? .15),
            blurRadius: blur ?? 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
