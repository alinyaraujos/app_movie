import 'package:bloc/bloc.dart';
import 'package:app_movie/pages/home/domain/use_cases/get_movie_use_case.dart';
import 'package:app_movie/pages/home/presentation/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetMovieUseCase _getMovie;

  HomeCubit({required GetMovieUseCase getMovie})
      : _getMovie = getMovie,
        super(const InitHomeState());

  Future<void> getMovie() async {
    final nowPlaying = await _getMovie.getMovieNowPlaying();
    final popular = await _getMovie.getMoviePopular();
    final topRated = await _getMovie.getMovieTopRated();
    final upComing = await _getMovie.getMovieUpcoming();

    emit(LoadedHomeState(
      nowPlaying: nowPlaying.results,
      popular: popular.results,
      topRated: topRated.results,
      upcoming: upComing.results,
    ));
  }
}
