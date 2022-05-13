import 'package:app_movie/pages/home/domain/entities/result_movie.dart';

const initMovies = ResultMovie(
  page: 0,
  results: [],
  totalPages: 0,
);

abstract class HomeState {
  final ResultMovie nowPlaying;
  final ResultMovie popular;
  final ResultMovie topRated;
  final ResultMovie upcoming;

  HomeState({
    required this.nowPlaying,
    required this.popular,
    required this.topRated,
    required this.upcoming,
  });

  HomeState copyWith({
    ResultMovie? nowPlaying,
    ResultMovie? popular,
    ResultMovie? topRated,
    ResultMovie? upcoming,
  });
}

class InitHomeState extends HomeState {
  InitHomeState({
    ResultMovie nowPlaying = initMovies,
    ResultMovie popular = initMovies,
    ResultMovie topRated = initMovies,
    ResultMovie upcoming = initMovies,
  }) : super(
          nowPlaying: nowPlaying,
          popular: popular,
          topRated: topRated,
          upcoming: upcoming,
        );

  @override
  LoadedHomeState copyWith({
    ResultMovie? nowPlaying,
    ResultMovie? popular,
    ResultMovie? topRated,
    ResultMovie? upcoming,
  }) {
    return LoadedHomeState(
      nowPlaying: nowPlaying ?? this.nowPlaying,
      popular: popular ?? this.popular,
      topRated: topRated ?? this.topRated,
      upcoming: upcoming ?? this.upcoming,
    );
  }
}

class LoadedHomeState extends HomeState {
  LoadedHomeState({
    required ResultMovie nowPlaying,
    required ResultMovie popular,
    required ResultMovie topRated,
    required ResultMovie upcoming,
  }) : super(
          nowPlaying: nowPlaying,
          popular: popular,
          topRated: topRated,
          upcoming: upcoming,
        );

  @override
  LoadedHomeState copyWith({
    ResultMovie? nowPlaying,
    ResultMovie? popular,
    ResultMovie? topRated,
    ResultMovie? upcoming,
  }) {
    return LoadedHomeState(
      nowPlaying: nowPlaying ?? this.nowPlaying,
      popular: popular ?? this.popular,
      topRated: topRated ?? this.topRated,
      upcoming: upcoming ?? this.upcoming,
    );
  }
}
