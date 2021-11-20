import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_remote/ui/controls/shared.dart';

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
            color: Colors.grey,
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
        backgroundColor: backgroundColor ?? Colors.white,
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
        color: backgroundColor ?? Colors.transparent,
        child: InkWell(
          onTap: onPress,
          child: child,
        ),
      ),
    );
  }
}
