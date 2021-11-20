import 'package:flutter/material.dart';

class _OkButton extends StatelessWidget {
  const _OkButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: const Center(
          child: Text(
            'OK',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;

  const _ArrowButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        icon,
        size: 64,
        color: const Color(0xFF3F6DF2),
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
          borderRadius: const BorderRadius.all(
            Radius.circular(1000),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.075),
              blurRadius: 15,
            ),
          ],
        ),
        child: GridView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsetsDirectional.zero,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          children: const [
            SizedBox.shrink(),
            _ArrowButton(
              icon: Icons.arrow_drop_up_rounded,
            ),
            SizedBox.shrink(),
            _ArrowButton(
              icon: Icons.arrow_left_rounded,
            ),
            _OkButton(),
            _ArrowButton(
              icon: Icons.arrow_right_rounded,
            ),
            SizedBox.shrink(),
            _ArrowButton(
              icon: Icons.arrow_drop_down_rounded,
            ),
            SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
