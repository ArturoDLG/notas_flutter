import 'package:flutter/material.dart';
import '../../icons/facebook_icons.dart';
import 'circle_button.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    //FittedBox escala los widgets para ajustarlo a las dimensiones del
    //dispositivo
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            _QuickButton(
              icon: FacebookIcon.photos,
              color: Color(0xffaedea6),
              label: 'Gallery',
            ),
            SizedBox(width: 10),
            _QuickButton(
              icon: FacebookIcon.userFriends,
              color: Color(0xff82b7fb),
              label: 'Tag Friends',
            ),
            SizedBox(width: 10),
            _QuickButton(
              icon: FacebookIcon.videoCamera,
              color: Color(0xfff3a597),
              label: 'Live',
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _QuickButton({
    required this.icon,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color.withOpacity(.2),
      ),
      child: Row(
        children: [
          CircleButton(
            color: color,
            icon: icon,
          ),
          const SizedBox(width: 15),
          Text(
            label,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
