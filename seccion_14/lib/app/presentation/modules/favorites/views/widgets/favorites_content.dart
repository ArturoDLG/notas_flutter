import 'package:flutter/material.dart';

import '../../../../global/controller/favorites/state/favorites_state.dart';
import 'favorites_list.dart';

class FavoritesContent extends StatelessWidget {
  final FavoritesStateLoaded state;
  final TabController tabController;
  const FavoritesContent({
    super.key,
    required this.state,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        FavoritesList(
          items: state.movies.values.toList(),
        ),
        FavoritesList(
          items: state.series.values.toList(),
        ),
      ],
    );
  }
}
