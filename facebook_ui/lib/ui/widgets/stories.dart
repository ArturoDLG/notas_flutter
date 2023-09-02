import 'package:facebook_ui/models/story.dart';
import 'avatar.dart';
import 'package:flutter/material.dart';

//lista de stories
final _stories = [
  Story(
    background: 'assets/wallpapers/1.jpeg',
    avatar: 'assets/users/1.jpg',
    userName: 'Laura',
  ),
  Story(
    background: 'assets/wallpapers/2.jpeg',
    avatar: 'assets/users/2.jpg',
    userName: 'Andrea',
  ),
  Story(
    background: 'assets/wallpapers/3.jpeg',
    avatar: 'assets/users/3.jpg',
    userName: 'Artemisa',
  ),
  Story(
    background: 'assets/wallpapers/4.jpeg',
    avatar: 'assets/users/4.jpg',
    userName: 'Elsa',
  ),
  Story(
    background: 'assets/wallpapers/5.jpeg',
    avatar: 'assets/users/5.jpg',
    userName: 'Jose',
  ),
];

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _stories.length,
        itemBuilder: (_, index) {
          final story = _stories[index];
          return _StoryItem(
            story: story,
            isFirst: index == 0,
          );
        },
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  final Story story;
  final bool isFirst;
  const _StoryItem({
    required this.story,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 90,
      margin: EdgeInsets.only(
        right: 15,
        left: isFirst ? 20 : 0,
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(story.background),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Avatar(
                    size: 30,
                    asset: story.avatar,
                    borderWidth: 2,
                  ),
                ),
              ],
            ),
          ),
          Text(
            story.userName,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
