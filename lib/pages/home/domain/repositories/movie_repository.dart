import 'package:app_movie/pages/home/domain/entities/result_movie.dart';

abstract class MovieRepository {
  Future<ResultMovie> getMovieNowPlaying(int page);
  Future<ResultMovie> getMoviePopular(int page);
  Future<ResultMovie> getMovieTopRated(int page);
  Future<ResultMovie> getMovieUpcoming(int page);
}
