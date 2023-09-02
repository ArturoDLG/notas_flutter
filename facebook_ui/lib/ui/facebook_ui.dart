import 'package:facebook_ui/models/publication.dart';
import 'package:facebook_ui/ui/widgets/publication_item.dart';
import 'package:facebook_ui/ui/widgets/stories.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../icons/facebook_icons.dart';
import 'widgets/circle_button.dart';
import 'widgets/thinking_bar.dart';
import 'widgets/quick_actions.dart';

///Replica de la UI de la app de Facebook
class FacebookUI extends StatelessWidget {
  const FacebookUI({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    const reactions = Reaction.values;
    final publications = List<Publication>.generate(
      50,
      (index) {
        final random = faker.randomGenerator;
        final reactionIndex = random.integer(reactions.length - 1);

        return Publication(
          user: User(
            avatar: faker.image.image(),
            username: faker.person.name(),
          ),
          title: faker.lorem.sentence(),
          createdAt: faker.date.dateTime(),
          imageUrl: faker.image.image(),
          commentsCount: random.integer(50000),
          sharedCount: random.integer(50000),
          currentUserReaction: reactions[reactionIndex],
        );
      },
    );
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
          SizedBox(width: 10),
          CircleButton(
            icon: FacebookIcon.bell,
            color: Color(0xfff8756e),
          ),
          SizedBox(width: 10),
          CircleButton(
            icon: FacebookIcon.userFriends,
            color: Color(0xff82b8fa),
            showBadge: true,
          ),
          SizedBox(width: 10),
          CircleButton(
            icon: FacebookIcon.messenger,
            color: Color(0xff2989ea),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          const ThinkingBar(),
          const SizedBox(height: 25),
          const QuickActions(),
          const SizedBox(height: 25),
          const Stories(),
          const SizedBox(height: 25),
          ListView.builder(
            shrinkWrap: true,
            // desactivamos las fisicas para que el ListView padre las controle
            physics: const NeverScrollableScrollPhysics(),
            itemCount: publications.length,
            itemBuilder: (_, index) => PublicationItem(
              publication: publications[index],
            ),
          ),
        ],
      ),
    );
  }
}
