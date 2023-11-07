import '../../../../domain/repositories/movies_repository.dart';
import '../../../global/state_notifier.dart';
import 'state/movie_state.dart';

class MovieController extends StateNotifier<MovieState> {
  final MoviesRepository moviesRepository;
  final int movieId;
  MovieController(
    super.state, {
    required this.moviesRepository,
    required this.movieId,
  });

  Future<void> init() async {
    state = MovieStateLoading();
    final result = await moviesRepository.getMovieById(movieId);

    state = result.when(
      left: (_) => MovieState.failed(),
      right: (movie) => MovieState.loaded(movie),
    );
  }
}
