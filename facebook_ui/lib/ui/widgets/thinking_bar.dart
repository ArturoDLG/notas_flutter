import 'package:flutter/material.dart';
import 'avatar.dart';

///Barra para agragar una publicacion a tu perfil de Facebook
class ThinkingBar extends StatelessWidget {
  const ThinkingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Avatar(
            size: 50,
            asset: 'assets/users/1.jpg',
          ),
          SizedBox(width: 20),
          //Agregamos un Flexible contemplando que el texto pueda ser mas largo
          Flexible(
            child: Text(
              "Que estas pensando, Lisa?",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
