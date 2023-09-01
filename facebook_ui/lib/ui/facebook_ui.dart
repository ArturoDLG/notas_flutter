import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../icons/facebook_icons.dart';
import 'widgets/circle_button.dart';
import 'widgets/thinking_bar.dart';

///Replica de la UI de la app de Facebook
class FacebookUI extends StatelessWidget {
  const FacebookUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: SvgPicture.asset(
          'assets/logos/facebook.svg',
          //color: Colors.blueAccent, //caracteristica obsoleta
          colorFilter: const ColorFilter.mode(
            Colors.blueAccent,
            BlendMode.srcIn,
          ),
        ),
        // ajustar el ancho de leanding
        leadingWidth: 125,
        actions: const [
          CircleButton(
            icon: FacebookIcon.search,
            color: Color(0xffbfbfbf),
          ),
          CircleButton(
            icon: FacebookIcon.bell,
            color: Color(0xfff8756e),
          ),
          CircleButton(
            icon: FacebookIcon.userFriends,
            color: Color(0xff82b8fa),
            showBadge: true,
          ),
          CircleButton(
            icon: FacebookIcon.messenger,
            color: Color(0xff2989ea),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ).copyWith(
          top: 10,
        ),
        children: const [
          ThinkingBar(),
        ],
      ),
    );
  }
}
