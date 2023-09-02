import 'package:flutter/material.dart';

///Imagen de usuario
class Avatar extends StatelessWidget {
  final double size;
  final String asset;
  final double borderWidth;
  const Avatar({
    super.key,
    required this.size,
    required this.asset,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(asset),
        ),
        border: Border.all(
          width: borderWidth,
          color: Colors.white,
        ),
      ),
    );
  }
}
