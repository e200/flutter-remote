import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_remote/ui/controls/buttons.dart';
import 'package:flutter_remote/ui/controls/navigation.dart';
import 'package:flutter_remote/ui/controls/vertical_buttons.dart';
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: SizedBox(
              width: 250,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transform.translate(
                        offset: const Offset(0, 20),
                        child: ShadowedIconButton(
                          icon: const Icon(Icons.info_outline),
                          onPress: () {},
                        ),
                      ),
                      ShadowedIconButton(
                        icon: const Icon(FeatherIcons.home),
                        onPress: () {},
                      ),
                      Transform.translate(
                        offset: const Offset(0, 20),
                        child: TurnOnOffButton(
                          onPress: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const NavigationControl(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VerticalButtons(
                        children: [
                          ShadowedIconButton(
                            shadowOpacity: 0,
                            icon: const Icon(FeatherIcons.volume2),
                            onPress: () {},
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'vol',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ShadowedIconButton(
                            shadowOpacity: 0,
                            icon: const Icon(FeatherIcons.volume1),
                            onPress: () {},
                          ),
                        ],
                      ),
                      ShadowedIconButton(
                        icon: const Icon(FeatherIcons.volumeX),
                        onPress: () {},
                      ),
                      VerticalButtons(
                        children: [
                          ShadowedIconButton(
                            shadowOpacity: 0,
                            icon: const Icon(FeatherIcons.chevronUp),
                            onPress: () {},
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'ch',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ShadowedIconButton(
                            shadowOpacity: 0,
                            icon: const Icon(FeatherIcons.chevronDown),
                            onPress: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShadowedIconButton(
                        padding: const EdgeInsets.all(10),
                        icon: const Icon(
                          FeatherIcons.chevronsLeft,
                          size: 24,
                        ),
                        onPress: () {},
                      ),
                      ShadowedIconButton(
                        padding: const EdgeInsets.all(10),
                        icon: Transform.translate(
                          offset: const Offset(2, 0),
                          child: const Icon(
                            FeatherIcons.play,
                            size: 24,
                          ),
                        ),
                        onPress: () {},
                      ),
                      ShadowedIconButton(
                        padding: const EdgeInsets.all(10),
                        icon: const Icon(
                          FeatherIcons.square,
                          size: 24,
                        ),
                        onPress: () {},
                      ),
                      ShadowedIconButton(
                        padding: const EdgeInsets.all(10),
                        icon: const Icon(
                          FeatherIcons.chevronsRight,
                          size: 24,
                        ),
                        onPress: () {},
                      ),
                    ],
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
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
