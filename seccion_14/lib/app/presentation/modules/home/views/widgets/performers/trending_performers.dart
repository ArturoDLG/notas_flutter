import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../domain/either/either.dart';
import '../../../../../../domain/failures/http_request/http_request_failure.dart';
import '../../../../../../domain/models/performer/performer.dart';
import '../../../../../global/widgets/request_failed.dart';
import '../../../controller/home_controller.dart';
import '../../../controller/state/home_state.dart';
import 'performer_tile.dart';

typedef EitherListPerformer = Either<HttpRequestFailure, List<Performer>>;

class TrendingPerformers extends StatefulWidget {
  const TrendingPerformers({super.key});

  @override
  State<TrendingPerformers> createState() => _TrendingPerformersState();
}

class _TrendingPerformersState extends State<TrendingPerformers> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller = context.watch();
    final performers = controller.state.performers;
    return Expanded(
      child: switch (performers) {
        PerformersStateLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        PerformersStateFailed() => RequestFailed(
            onRetry: () {
              controller.loadedPerformers(
                performers: const PerformersState.loading(),
              );
            },
          ),
        PerformersStateLoaded(
          list: final performers,
        ) =>
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                itemCount: performers.length,
                itemBuilder: (_, index) {
                  final performer = performers[index];
                  return PerformerTile(
                    performer: performer,
                  );
                },
              ),
              Positioned(
                bottom: 30,
                child: AnimatedBuilder(
                  animation: _pageController,
                  builder: (_, __) {
                    final int currentCard = _pageController.page?.toInt() ?? 0;
                    return Row(
                      children: List.generate(
                        performers.length,
                        (index) => Icon(
                          Icons.circle,
                          size: 15,
                          color: currentCard == index
                              ? Colors.blue
                              : Colors.white30,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
      },
    );
  }
}
