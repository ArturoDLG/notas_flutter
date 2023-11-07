import '../../../../domain/enums.dart';
import '../../../../domain/repositories/trending_repository.dart';
import '../../../global/state_notifier.dart';
import 'state/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  final TrendingRepository trendingRepository;
  HomeController(
    super.state, {
    required this.trendingRepository,
  });

  Future<void> init() async {
    await loadedMovieAndSeries();
    await loadedPerformers();
  }

  Future<void> loadedMovieAndSeries({
    MoviesAndSeriesState? moviesAndSeries,
  }) async {
    if (moviesAndSeries != null) {
      state = state.copyWith(moviesAndSeries: moviesAndSeries);
    }
    final timeWindow = state.moviesAndSeries.timeWindow;
    final result = await trendingRepository.getMoviesAndSeries(
      timeWindow,
    );

    state = result.when(
      left: (failure) => state.copyWith(
        moviesAndSeries: MoviesAndSeriesState.failed(
          timeWindow,
        ),
      ),
      right: (list) => state.copyWith(
        moviesAndSeries: MoviesAndSeriesState.loaded(
          list: list,
          timeWindow: timeWindow,
        ),
      ),
    );
  }

  Future<void> loadedPerformers({
    PerformersState? performers,
  }) async {
    if (performers != null) {
      state = state.copyWith(
        performers: performers,
      );
    }
    final result = await trendingRepository.getPerformers();

    state = result.when(
      left: (failure) => state.copyWith(
        performers: const PerformersState.failed(),
      ),
      right: (list) => state.copyWith(
        performers: PerformersState.loaded(list),
      ),
    );
  }

  void onTimeWindowChanged(TimeWindow timeWindow) {
    if (state.moviesAndSeries.timeWindow != timeWindow) {
      state = state.copyWith(
        moviesAndSeries: MoviesAndSeriesState.loading(timeWindow),
      );
    }
    loadedMovieAndSeries();
  }
}
