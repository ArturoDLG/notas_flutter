import 'package:flutter/material.dart';
import 'package:seccion_11/pages/my_home_page_provider.dart';
import 'package:seccion_11/state_management/consumer.dart';
//import '../pages/my_home_page.dart';

class AnimatedTetx extends StatelessWidget {
  const AnimatedTetx({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final homePageState = context.findAncestorStateOfType<MyHomePageState>()!;
    //final homeProvider = MyHomePageProvider.of(context);
    return Center(
      child: Consumer<MyHomePageController>(builder: (_, controller) {
        return AnimatedSwitcher(
          duration: const Duration(
            milliseconds: 200,
          ),
          child: Text(
            //homePageState.counter.toString(),
            //homeProvider.counter.toString(),
            controller.counter.toString(),
            key: UniqueKey(),
            style: const TextStyle(
              fontSize: 45,
              color: Colors.white,
            ),
          ),
        );
      }),
    );
  }
}
