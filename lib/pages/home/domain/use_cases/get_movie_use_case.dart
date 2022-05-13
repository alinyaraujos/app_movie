import 'package:app_movie/pages/home/domain/entities/result_movie.dart';
import 'package:app_movie/pages/home/domain/repositories/movie_repository.dart';

abstract class GetMovieUseCase {
  Future<ResultMovie> getMovieNowPlaying(int page);
  Future<ResultMovie> getMoviePopular(int page);
  Future<ResultMovie> getMovieTopRated(int page);
  Future<ResultMovie> getMovieUpcoming(int page);
}

class GetMovieUseCaseImpl implements GetMovieUseCase {
  final MovieRepository _repository;

  GetMovieUseCaseImpl({required MovieRepository repository})
      : _repository = repository;

  @override
  Future<ResultMovie> getMovieNowPlaying(int page) {
    return _repository.getMovieNowPlaying(page);
  }

  @override
  Future<ResultMovie> getMoviePopular(int page) {
    return _repository.getMoviePopular(page);
  }

  @override
  Future<ResultMovie> getMovieTopRated(int page) {
    return _repository.getMovieTopRated(page);
  }

  @override
  Future<ResultMovie> getMovieUpcoming(int page) {
    return _repository.getMovieUpcoming(page);
  }
}
