import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_remote/services/remote_signal_emmiter.dart';
import 'package:flutter_remote/ui/controls/buttons.dart';
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
              child: Consumer(
                builder: (context, ref, _) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 20),
                            child: ShadowedIconButton(
                              icon: const Icon(Icons.info_outline),
                              onPress: ref.read(remoteSignalEmmiter).info,
                            ),
                          ),
                          ShadowedIconButton(
                            icon: const Icon(FeatherIcons.home),
                            onPress: ref.read(remoteSignalEmmiter).home,
                          ),
                          Transform.translate(
                            offset: const Offset(0, 20),
                            child: TurnOnOffButton(
                              onPress: ref.read(remoteSignalEmmiter).turnOnOff,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CircularShadow(
                        child: ClipOval(
                          child: ColoredBox(
                            color: Theme.of(context).cardColor,
                            child: GridView(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsetsDirectional.zero,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              children: [
                                const SizedBox.shrink(),
                                ArrowButton(
                                  icon: Icons.arrow_drop_up_rounded,
                                  onPress:
                                      ref.read(remoteSignalEmmiter).navigateUp,
                                ),
                                const SizedBox.shrink(),
                                ArrowButton(
                                  icon: Icons.arrow_left_rounded,
                                  onPress: ref
                                      .read(remoteSignalEmmiter)
                                      .navigateLeft,
                                ),
                                OkButton(
                                  onPress: ref.read(remoteSignalEmmiter).ok,
                                ),
                                ArrowButton(
                                  icon: Icons.arrow_right_rounded,
                                  onPress: ref
                                      .read(remoteSignalEmmiter)
                                      .navigateRight,
                                ),
                                const SizedBox.shrink(),
                                ArrowButton(
                                  icon: Icons.arrow_drop_down_rounded,
                                  onPress: ref
                                      .read(remoteSignalEmmiter)
                                      .navigateDown,
                                ),
                                const SizedBox.shrink(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform.translate(
                            offset: const Offset(0, -20),
                            child: ShadowedIconButton(
                              icon: const Icon(Icons.exit_to_app),
                              onPress: ref.read(remoteSignalEmmiter).exit,
                            ),
                          ),
                          ShadowedIconButton(
                            icon: const Icon(FeatherIcons.volumeX),
                            onPress: ref.read(remoteSignalEmmiter).mute,
                          ),
                          Transform.translate(
                            offset: const Offset(0, -20),
                            child: ShadowedIconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPress: ref.read(remoteSignalEmmiter).back,
                            ),
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
                                onPress: ref.read(remoteSignalEmmiter).volumeUp,
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
                                onPress:
                                    ref.read(remoteSignalEmmiter).volumeDown,
                              ),
                            ],
                          ),
                          VerticalButtons(
                            children: [
                              ShadowedIconButton(
                                shadowOpacity: 0,
                                icon: const Icon(FeatherIcons.chevronUp),
                                onPress:
                                    ref.read(remoteSignalEmmiter).nextChannel,
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
                                onPress: ref
                                    .read(remoteSignalEmmiter)
                                    .previousChannel,
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
                            onPress: ref.read(remoteSignalEmmiter).backwards,
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
                            onPress: ref.read(remoteSignalEmmiter).play,
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
                            onPress: ref.read(remoteSignalEmmiter).pause,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ColoredButton(
                            color: Colors.red.shade400,
                            onPress: ref.read(remoteSignalEmmiter).red,
                          ),
                          ColoredButton(
                            color: Colors.green.shade400,
                            onPress: ref.read(remoteSignalEmmiter).green,
                          ),
                          ColoredButton(
                            color: Colors.yellow.shade400,
                            onPress: ref.read(remoteSignalEmmiter).yellow,
                          ),
                          ColoredButton(
                            color: Colors.blue.shade400,
                            onPress: ref.read(remoteSignalEmmiter).blue,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
