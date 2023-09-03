import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/ui/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../models/publication.dart';

class PublicationItem extends StatelessWidget {
  final Publication publication;
  const PublicationItem({
    super.key,
    required this.publication,
  });

  String _getEmojiPath(Reaction reaction) {
    // switch expression, nos permite usar una sentencia switch dentro de un
    // return. Valido a partir de Dart 3.0
    return switch (reaction) {
      Reaction.angry => 'assets/emojis/angry.svg',
      Reaction.laughing => 'assets/emojis/laughing.svg',
      Reaction.love => 'assets/emojis/heart.svg',
      Reaction.like => 'assets/emojis/like.svg',
      Reaction.sad => 'assets/emojis/sad.svg',
      Reaction.shocking => 'assets/emojis/shocked.svg',
    };
  }

  String _formatCount(int value) {
    if (value <= 1000) {
      return value.toString();
    }
    return "${(value / 1000).toStringAsFixed(1)}k";
  }

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    );
    const reactions = Reaction.values;

    return Container(
      decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(
          width: 6,
          color: Color(0xfff3f3f3),
        )),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                Avatar(
                  size: 38,
                  asset: publication.user.avatar,
                ),
                const SizedBox(width: 10),
                Text(
                  publication.user.username,
                ),
                const Spacer(),
                Text(
                  timeago.format(publication.createdAt),
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: CachedNetworkImage(
              imageUrl: publication.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: padding.copyWith(
              top: 15,
            ),
            child: Text(
              publication.title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ...List.generate(
                      reactions.length,
                      (index) {
                        final reaction = reactions[index];
                        final isActive =
                            reaction == publication.currentUserReaction;
                        return Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                _getEmojiPath(reaction),
                                width: 25,
                                height: 25,
                              ),
                              const SizedBox(height: 3),
                              Icon(
                                Icons.circle,
                                color: isActive
                                    ? Colors.redAccent
                                    : Colors.transparent,
                                size: 5,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text(
                            "${_formatCount(publication.commentsCount)} Comments",
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "${_formatCount(publication.sharedCount)} Shares",
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
