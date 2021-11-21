import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';


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
            color: Theme.of(context).shadowColor.withOpacity(shadowOpacity ?? .1),
            blurRadius: blur ?? 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
