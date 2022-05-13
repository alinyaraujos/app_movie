import 'package:app_movie/pages/home/domain/entities/result_movie.dart';
import 'package:bloc/bloc.dart';
import 'package:app_movie/pages/home/domain/use_cases/get_movie_use_case.dart';
import 'package:app_movie/pages/home/presentation/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetMovieUseCase _getMovie;

  HomeCubit({required GetMovieUseCase getMovie})
      : _getMovie = getMovie,
        super(InitHomeState());

  Future<void> getMovie() async {
    final nowPlaying = await _getMovie.getMovieNowPlaying(1);
    final popular = await _getMovie.getMoviePopular(1);
    final topRated = await _getMovie.getMovieTopRated(1);
    final upComing = await _getMovie.getMovieUpcoming(1);

    emit(LoadedHomeState(
      nowPlaying: nowPlaying,
      popular: popular,
      topRated: topRated,
      upcoming: upComing,
    ));
  }

  Future<void> getMovieNowPlaying() async {
    if (state.nowPlaying.page <= state.nowPlaying.totalPages) {
      final nowPlaying =
          await _getMovie.getMovieNowPlaying(state.nowPlaying.page + 1);
      final newNowPlaying = ResultMovie(
        page: nowPlaying.page,
        totalPages: nowPlaying.totalPages,
        results: [...state.nowPlaying.results, ...nowPlaying.results],
      );

      emit(state.copyWith(nowPlaying: newNowPlaying));
    }
  }

  Future<void> getMoviePopular() async {
    if (state.popular.page <= state.popular.totalPages) {
      final popular = await _getMovie.getMoviePopular(state.popular.page + 1);
      final newPopular = ResultMovie(
        page: popular.page,
        totalPages: popular.totalPages,
        results: [...state.popular.results, ...popular.results],
      );

      emit(state.copyWith(popular: newPopular));
    }
  }

  Future<void> getMovieTopRated() async {
    if (state.topRated.page <= state.topRated.totalPages) {
      final topRated =
          await _getMovie.getMovieTopRated(state.topRated.page + 1);
      final newTopRated = ResultMovie(
          page: topRated.page,
          totalPages: topRated.totalPages,
          results: [...state.topRated.results, ...topRated.results]);

      emit(state.copyWith(topRated: newTopRated));
    }
  }

  Future<void> getMovieUpComing() async {
    if (state.upcoming.page <= state.upcoming.totalPages) {
      final upcoming =
          await _getMovie.getMovieUpcoming(state.upcoming.page + 1);
      final newUpcoming = ResultMovie(
        page: upcoming.page,
        totalPages: upcoming.totalPages,
        results: [...state.upcoming.results, ...upcoming.results],
      );

      emit(state.copyWith(upcoming: newUpcoming));
    }
  }
}