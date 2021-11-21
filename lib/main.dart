import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_remote/signal_emmiter.dart';
import 'package:flutter_remote/theme.dart';
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
                              onPress: ref.read(signalEmmiter).info,
                            ),
                          ),
                          ShadowedIconButton(
                            icon: const Icon(FeatherIcons.home),
                            onPress: ref.read(signalEmmiter).home,
                          ),
                          Transform.translate(
                            offset: const Offset(0, 20),
                            child: TurnOnOffButton(
                              onPress: ref.read(signalEmmiter).turnOnOff,
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
                                      ref.read(signalEmmiter).navigateUp,
                                ),
                                const SizedBox.shrink(),
                                ArrowButton(
                                  icon: Icons.arrow_left_rounded,
                                  onPress: ref
                                      .read(signalEmmiter)
                                      .navigateLeft,
                                ),
                                OkButton(
                                  onPress: ref.read(signalEmmiter).ok,
                                ),
                                ArrowButton(
                                  icon: Icons.arrow_right_rounded,
                                  onPress: ref
                                      .read(signalEmmiter)
                                      .navigateRight,
                                ),
                                const SizedBox.shrink(),
                                ArrowButton(
                                  icon: Icons.arrow_drop_down_rounded,
                                  onPress: ref
                                      .read(signalEmmiter)
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
                              onPress: ref.read(signalEmmiter).exit,
                            ),
                          ),
                          ShadowedIconButton(
                            icon: const Icon(FeatherIcons.volumeX),
                            onPress: ref.read(signalEmmiter).mute,
                          ),
                          Transform.translate(
                            offset: const Offset(0, -20),
                            child: ShadowedIconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPress: ref.read(signalEmmiter).back,
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
                                onPress: ref.read(signalEmmiter).volumeUp,
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
                                    ref.read(signalEmmiter).volumeDown,
                              ),
                            ],
                          ),
                          VerticalButtons(
                            children: [
                              ShadowedIconButton(
                                shadowOpacity: 0,
                                icon: const Icon(FeatherIcons.chevronUp),
                                onPress:
                                    ref.read(signalEmmiter).nextChannel,
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
                                    .read(signalEmmiter)
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
                            onPress: ref.read(signalEmmiter).backwards,
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
                            onPress: ref.read(signalEmmiter).play,
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
                            onPress: ref.read(signalEmmiter).pause,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ColoredButton(
                            color: Colors.red.shade400,
                            onPress: ref.read(signalEmmiter).red,
                          ),
                          ColoredButton(
                            color: Colors.green.shade400,
                            onPress: ref.read(signalEmmiter).green,
                          ),
                          ColoredButton(
                            color: Colors.yellow.shade400,
                            onPress: ref.read(signalEmmiter).yellow,
                          ),
                          ColoredButton(
                            color: Colors.blue.shade400,
                            onPress: ref.read(signalEmmiter).blue,
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


class OkButton extends StatelessWidget {
  final VoidCallback onPress;

  const OkButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPress: onPress,
      child: Container(
        color: Colors.grey.withOpacity(.1),
        child: const Center(
          child: Text(
            'OK',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;

  const ArrowButton({
    Key? key,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPress: onPress,
      child: Icon(
        icon,
        size: 64,
        color: Colors.grey,
      ),
    );
  }
}

class TurnOnOffButton extends StatelessWidget {
  final VoidCallback onPress;
  const TurnOnOffButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowedIconButton(
      backgroundColor: Colors.red.shade300,
      onPress: onPress,
      icon: Transform.translate(
        offset: const Offset(0, -2),
        child: const Icon(
          FeatherIcons.power,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ColoredButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPress;

  const ColoredButton({
    Key? key,
    required this.color,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPress: onPress,
      child: SizedBox(
        width: 40,
        height: 40,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Opacity(
              opacity: .2,
              child: Container(
                width: 40,
                height: 40,
                color: color,
                padding: const EdgeInsets.all(5),
              ),
            ),
            ClipOval(
              child: Container(
                width: 30,
                height: 30,
                color: color,
                padding: const EdgeInsets.all(5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShadowedIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPress;
  final Color? backgroundColor;
  final double? shadowOpacity;
  final EdgeInsets? padding;

  const ShadowedIconButton({
    Key? key,
    required this.icon,
    required this.onPress,
    this.backgroundColor,
    this.shadowOpacity,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowedButton(
      shadowOpacity: shadowOpacity,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(15),
        child: IconTheme(
          data: IconTheme.of(context).copyWith(
            size: 32,
          ),
          child: icon,
        ),
      ),
      onPress: onPress,
      backgroundColor: backgroundColor,
    );
  }
}

class ShadowedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  final Color? backgroundColor;
  final double? shadowOpacity;

  const ShadowedButton({
    Key? key,
    required this.child,
    required this.onPress,
    this.backgroundColor,
    this.shadowOpacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularShadow(
      shadowOpacity: shadowOpacity,
      child: BaseButton(
        backgroundColor: backgroundColor,
        child: child,
        onPress: onPress,
      ),
    );
  }
}

class BaseButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  final Color? backgroundColor;

  const BaseButton({
    Key? key,
    required this.child,
    required this.onPress,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        shadowColor: Colors.transparent,
        color: backgroundColor,
        child: InkWell(
          onTap: onPress,
          child: child,
        ),
      ),
    );
  }
}

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
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}

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
            color:
                Theme.of(context).shadowColor.withOpacity(shadowOpacity ?? .1),
            blurRadius: blur ?? 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
