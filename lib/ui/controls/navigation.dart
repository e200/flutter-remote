import 'package:flutter/material.dart';

import 'buttons.dart';

class _OkButton extends StatelessWidget {
  final VoidCallback onPress;

  const _OkButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      backgroundColor: Colors.grey.shade200,
      onPress: onPress,
      child: const Center(
        child: Center(
          child: Text(
            'OK',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;

  const _ArrowButton({
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

class NavigationControl extends StatelessWidget {
  const NavigationControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1000),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.075),
              blurRadius: 15,
            ),
          ],
        ),
        child: ClipOval(
          child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsetsDirectional.zero,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            children: [
              const SizedBox.shrink(),
              _ArrowButton(
                icon: Icons.arrow_drop_up_rounded,
                onPress: () {},
              ),
              const SizedBox.shrink(),
              _ArrowButton(
                icon: Icons.arrow_left_rounded,
                onPress: () {},
              ),
              _OkButton(
                onPress: () {},
              ),
              _ArrowButton(
                icon: Icons.arrow_right_rounded,
                onPress: () {},
              ),
              const SizedBox.shrink(),
              _ArrowButton(
                icon: Icons.arrow_drop_down_rounded,
                onPress: () {},
              ),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
