import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_remote/ui/controls/buttons.dart';
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShadowedIconButton(
                      icon: const Icon(Icons.info_outline),
                      onPress: () {},
                    ),
                    ShadowedIconButton(
                      icon: const Icon(FeatherIcons.home),
                      onPress: () {},
                    ),
                    TurnOnOffButton(
                      onPress: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                ShadowedIconButton(
                  icon: const Icon(FeatherIcons.volumeX),
                  onPress: () {},
                ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ColoredButton(
                        color: Colors.red.shade400,
                        onPress: () {},
                      ),
                      ColoredButton(
                        color: Colors.green.shade400,
                        onPress: () {},
                      ),
                      ColoredButton(
                        color: Colors.yellow.shade400,
                        onPress: () {},
                      ),
                      ColoredButton(
                        color: Colors.blue.shade400,
                        onPress: () {},
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
