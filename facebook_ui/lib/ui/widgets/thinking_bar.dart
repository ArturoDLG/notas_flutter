import 'package:flutter/material.dart';
import 'avatar.dart';

///Barra para agragar una publicacion a tu perfil de Facebook
class ThinkingBar extends StatelessWidget {
  const ThinkingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Avatar(
          size: 50,
          asset: 'assets/users/1.jpg',
        ),
        SizedBox(width: 20),
        Text(
          "Que estas pensando, Lisa?",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
