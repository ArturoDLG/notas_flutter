import '../../../../domain/models/media/media.dart';
import '../../../../domain/repositories/account_repository.dart';
import '../../state_notifier.dart';
import 'state/favorites_state.dart';

class FavoritesController extends StateNotifier<FavoritesState> {
  final AccountRepository accountRepository;
  FavoritesController(
    super.state, {
    required this.accountRepository,
  });

  Future<void> init() async {
    state = FavoritesStateLoading();
    final moviesResult = await accountRepository.getFavorites(
      MediaType.movie,
    );

    state = await moviesResult.when(
      left: (_) => state = FavoritesStateFailed(),
      right: (movies) async {
        final seriesResult = await accountRepository.getFavorites(
          MediaType.tv,
        );

        return seriesResult.when(
          left: (_) => FavoritesState.failed(),
          right: (series) => FavoritesStateLoaded(
            movies: movies,
            series: series,
          ),
        );
      },
    );
  }
}
