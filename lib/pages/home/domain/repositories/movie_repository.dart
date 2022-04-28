import 'package:app_movie/pages/home/domain/entities/result_movie.dart';

abstract class MovieRepository {
  Future<ResultMovie> getMovieNowPlaying();
  Future<ResultMovie> getMoviePopular();
  Future<ResultMovie> getMovieTopRated();
  Future<ResultMovie> getMovieUpcoming();
}
