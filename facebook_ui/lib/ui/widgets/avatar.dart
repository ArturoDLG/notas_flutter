import 'package:cached_network_image/cached_network_image.dart';
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
    final fromNetwork =
        asset.startsWith('http://') || asset.startsWith('https://');
    final image =
        fromNetwork ? CachedNetworkImageProvider(asset) : AssetImage(asset);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: image as ImageProvider,
          fit: BoxFit.cover,
        ),
        border: Border.all(
          width: borderWidth,
          color: Colors.white,
        ),
      ),
    );
  }
}
