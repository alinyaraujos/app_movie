import 'package:app_movie/pages/home/domain/entities/result_movie.dart';
import 'package:app_movie/pages/home/domain/repositories/movie_repository.dart';

abstract class GetMovieUseCase {
  Future<ResultMovie> getMovieNowPlaying();
  Future<ResultMovie> getMoviePopular();
  Future<ResultMovie> getMovieTopRated();
  Future<ResultMovie> getMovieUpcoming();
}

class GetMovieUseCaseImpl implements GetMovieUseCase {
  final MovieRepository _repository;

  GetMovieUseCaseImpl({required MovieRepository repository})
      : _repository = repository;

  @override
  Future<ResultMovie> getMovieNowPlaying() {
    return _repository.getMovieNowPlaying();
  }

  @override
  Future<ResultMovie> getMoviePopular() {
    return _repository.getMoviePopular();
  }

  @override
  Future<ResultMovie> getMovieTopRated() {
    return _repository.getMovieTopRated();
  }

  @override
  Future<ResultMovie> getMovieUpcoming() {
    return _repository.getMovieUpcoming();
  }
}
