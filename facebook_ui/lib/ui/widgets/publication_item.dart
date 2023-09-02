import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/ui/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../models/publication.dart';

class PublicationItem extends StatelessWidget {
  final Publication publication;
  const PublicationItem({
    super.key,
    required this.publication,
  });

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    );
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                const Avatar(
                  size: 38,
                  asset: 'assets/users/1.jpg',
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
          CachedNetworkImage(
            imageUrl: publication.imageUrl,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: padding.copyWith(
              top: 15,
            ),
            child: Text(
              publication.title,
            ),
          ),
        ],
      ),
    );
  }
}
