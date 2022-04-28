import 'package:app_movie/pages/home/domain/entities/movie.dart';

abstract class HomeState {
  const HomeState();
}

class InitHomeState extends HomeState {
  const InitHomeState();
}

class LoadedHomeState extends HomeState {
  final List<Movie> nowPlaying;
  final List<Movie> popular;
  final List<Movie> topRated;
  final List<Movie> upcoming;

  const LoadedHomeState({
    required this.nowPlaying,
    required this.popular,
    required this.topRated,
    required this.upcoming,
  });
}
