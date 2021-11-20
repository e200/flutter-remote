import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData getTheme(BuildContext context) {
  final _theme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: LightThemeColors.scaffoldBackgroundColor,
  );

  return _theme;
}

class LightThemeColors {
  static const scaffoldBackgroundColor = Color(0xFFF8FAFB);
}
