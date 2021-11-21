import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_remote/services/remote_signal_emitter.dart';
import 'package:flutter_remote/ui/controls/buttons.dart';
import 'package:flutter_remote/ui/controls/navigation.dart';
import 'package:flutter_remote/ui/controls/vertical_buttons.dart';
import 'package:flutter_remote/ui/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const RemoteControlApp());
}

class RemoteControlApp extends StatelessWidget {
  const RemoteControlApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, _) {
          return MaterialApp(
            theme: getTheme(context, ref.watch(appThemeProvider)),
            home: const RemoteControl(),
          );
        },
      ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FeatherIcons.sun,
                            color: Colors.grey,
                          ),
                          Switch(
                            value: ref.watch(appThemeProvider) == AppTheme.dark,
                            onChanged: (value) {
                              ref.read(appThemeProvider.notifier).toggleTheme();
                            },
                          ),
                          const Icon(
                            FeatherIcons.moon,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.translate(
                          offset: const Offset(0, 20),
                          child: ShadowedIconButton(
                            icon: const Icon(Icons.info_outline),
                            onPress: ref.read(remoteSignalEmitter).info,
                          ),
                        ),
                        ShadowedIconButton(
                          icon: const Icon(FeatherIcons.home),
                          onPress: ref.read(remoteSignalEmitter).home,
                        ),
                        Transform.translate(
                          offset: const Offset(0, 20),
                          child: TurnOnOffButton(
                            onPress: ref.read(remoteSignalEmitter).turnOnOff,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    NavigationControl(
                      onPressNavigateLeft:
                          ref.read(remoteSignalEmitter).navigateLeft,
                      onPressNavigateDown:
                          ref.read(remoteSignalEmitter).navigateDown,
                      onPressNavigateRight:
                          ref.read(remoteSignalEmitter).navigateRight,
                      onPressNavigateUp:
                          ref.read(remoteSignalEmitter).navigateUp,
                      onPressOk: ref.read(remoteSignalEmitter).ok,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShadowedIconButton(
                          icon: const Icon(Icons.exit_to_app),
                          onPress: ref.read(remoteSignalEmitter).exit,
                        ),
                        ShadowedIconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPress: ref.read(remoteSignalEmitter).back,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VerticalButtons(
                          children: [
                            ShadowedIconButton(
                              shadowOpacity: 0,
                              icon: const Icon(FeatherIcons.volume2),
                              onPress: ref.read(remoteSignalEmitter).volumeUp,
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
                              onPress: ref.read(remoteSignalEmitter).volumeDown,
                            ),
                          ],
                        ),
                        ShadowedIconButton(
                          icon: const Icon(FeatherIcons.volumeX),
                          onPress: ref.read(remoteSignalEmitter).mute,
                        ),
                        VerticalButtons(
                          children: [
                            ShadowedIconButton(
                              shadowOpacity: 0,
                              icon: const Icon(FeatherIcons.chevronUp),
                              onPress:
                                  ref.read(remoteSignalEmitter).nextChannel,
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
                              onPress:
                                  ref.read(remoteSignalEmitter).previousChannel,
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
                          onPress: ref.read(remoteSignalEmitter).backwards,
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
                          onPress: ref.read(remoteSignalEmitter).play,
                        ),
                        ShadowedIconButton(
                          padding: const EdgeInsets.all(10),
                          icon: const Icon(
                            FeatherIcons.pause,
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
                          onPress: ref.read(remoteSignalEmitter).pause,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColoredButton(
                          color: Colors.red.shade400,
                          onPress: ref.read(remoteSignalEmitter).forward,
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
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
