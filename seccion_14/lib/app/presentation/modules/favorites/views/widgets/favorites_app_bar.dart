import 'package:flutter/material.dart';

class FavoritesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  const FavoritesAppBar({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Favorites'),
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      bottom: TabBar(
        controller: tabController,
        padding: const EdgeInsets.symmetric(vertical: 10),
        indicator: const _Decoration(
          color: Colors.blue,
          width: 20,
        ),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: const [
          Tab(
            //icon: Icon(Icons.movie),
            text: 'Movies',
          ),
          Tab(
            //icon: Icon(Icons.tv),
            text: 'Series',
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight) * 2;
}

class _Decoration extends Decoration {
  final Color color;
  final double width;

  const _Decoration({
    required this.color,
    required this.width,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) =>
      _Painter(color: color, width: width);
}

class _Painter extends BoxPainter {
  final Color color;
  final double width;

  _Painter({
    required this.color,
    required this.width,
  });

  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration configuration,
  ) {
    final paint = Paint()..color = color;
    final size = configuration.size ?? Size.zero;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          size.width * .5 + offset.dx - width * 0.5,
          size.height * .9,
          width,
          width * 0.3,
        ),
        const Radius.circular(4),
      ),
      paint,
    );
  }
}
