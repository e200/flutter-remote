import 'package:flutter/material.dart';
import 'package:flutter_remote/ui/controls/navigation.dart';
import 'package:flutter_remote/ui/theme.dart';

void main() {
  runApp(const RemoteControlApp());
}

class RemoteControlApp extends StatelessWidget {
  const RemoteControlApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getTheme(context),
      home: const RemoteControl(),
    );
  }
}

class RemoteControl extends StatelessWidget {
  const RemoteControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                NavigationControl(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
