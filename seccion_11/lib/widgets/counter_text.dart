import 'package:flutter/material.dart';
//import 'package:seccion_11/pages/my_home_page.dart';
import 'package:seccion_11/pages/my_home_page_provider.dart';
import 'package:seccion_11/state_management/consumer.dart';
//import 'package:seccion_11/pages/my_home_page.dart';

import 'animated_text.dart';

class CounterText extends StatelessWidget {
  const CounterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final homePageState = context.findAncestorStateOfType<MyHomePageState>()!;
    //final homeProvider = MyHomePageProvider.of(context);
    return Consumer<MyHomePageController>(builder: (_, controller) {
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          //color: homePageState.color,
          //color: homeProvider.color,
          color: controller.color,
        ),
        child: const AnimatedTetx(),
      );
    });
  }
}
