import 'package:flutter/material.dart';
import 'package:flutter_remote/ui/controls/shared.dart';

class VerticalButtons extends StatelessWidget {
  final List<Widget> children;

  const VerticalButtons({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularShadow(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
