
class ShadowedIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPress;
  final Color? backgroundColor;

  const ShadowedIconButton({
    Key? key,
    required this.icon,
    required this.onPress,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowedButton(
      child: Padding(
        padding: const EdgeInsets.all(15),
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

  const ShadowedButton({
    Key? key,
    required this.child,
    required this.onPress,
    this.backgroundColor,
  }) : super(key: key);

  const ShadowedButton.icon({
    Key? key,
    required this.child,
    required this.onPress,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(1000),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 5,
          ),
        ],
      ),
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
        color: backgroundColor ?? Colors.transparent,
        child: InkWell(
          onTap: onPress,
          child: child,
        ),
      ),
    );
  }
}
