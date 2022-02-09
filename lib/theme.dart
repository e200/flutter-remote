import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

enum AppTheme { dark, light }

final appThemeProvider = StateNotifierProvider<_AppThemeState, AppTheme>((ref) => _AppThemeState());

class _AppThemeState extends StateNotifier<AppTheme> {
  _AppThemeState() : super(AppTheme.light);

  void toggleTheme() {
    if (state == AppTheme.dark) {
      state = AppTheme.light;
    } else {
      state = AppTheme.dark;
    }
  }
}

ThemeData getTheme(BuildContext context, AppTheme appTheme) {
  ThemeData _theme;

  if (appTheme == AppTheme.dark) {
    _theme = ThemeData(
      canvasColor: _DarkThemeColors.canvasColor,
      scaffoldBackgroundColor: _DarkThemeColors.scaffoldBackgroundColor,
      shadowColor: ThemeData.dark().shadowColor,
      primarySwatch: Colors.deepOrange,
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.grey),
        trackColor: MaterialStateProperty.all(Colors.grey),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Colors.deepOrange,
        secondary: Colors.deepOrangeAccent,
      ),
    );
  } else if (appTheme == AppTheme.light) {
    _theme = ThemeData.light().copyWith(
      canvasColor: Colors.white,
      scaffoldBackgroundColor: _LightThemeColors.scaffoldBackgroundColor,
    );
  } else {
    _theme = ThemeData();
  }

  return _theme;
}

class _DarkThemeColors {
  static const scaffoldBackgroundColor = Color(0xff303030);
  static final canvasColor = Colors.grey[800];
}

class _LightThemeColors {
  static const scaffoldBackgroundColor = Color(0xFFF8FAFB);
}
