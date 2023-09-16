import 'package:flutter/material.dart';
import 'package:seccion_10/utils/screen_utils.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenSize.height / 2,
            color: Colors.green,
            child: Center(
              child: Text(
                '${context.statusBarHeight}',
              ),
            ),
          )
        ],
      ),
    );
  }
}
