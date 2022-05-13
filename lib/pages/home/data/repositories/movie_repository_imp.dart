import 'package:app_movie/core/helpers/environments.dart';
import 'package:app_movie/pages/home/data/data_remote/data_sources/movie_remote_data_source.dart';
import 'package:app_movie/pages/home/domain/entities/result_movie.dart';
import 'package:app_movie/pages/home/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _dataSource;

  const MovieRepositoryImpl({
    required MovieRemoteDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<ResultMovie> getMovieNowPlaying(int page) async {
    final apiKey = Environments.param('api_key') ?? '';
    final result = await _dataSource.getMovieNowPlaying(apiKey, page);

    return result.mapToEntity();
  }

  @override
  Future<ResultMovie> getMoviePopular(int page) async {
    final apiKey = Environments.param('api_key') ?? '';
    final result = await _dataSource.getMoviePopular(apiKey, page);

    return result.mapToEntity();
  }

  @override
  Future<ResultMovie> getMovieTopRated(int page) async {
    final apiKey = Environments.param('api_key') ?? '';
    final result = await _dataSource.getMovieTopRated(apiKey, page);

    return result.mapToEntity();
  }

  @override
  Future<ResultMovie> getMovieUpcoming(int page) async {
    final apiKey = Environments.param('api_key') ?? '';
    final result = await _dataSource.getMovieUpcoming(apiKey, page);

    return result.mapToEntity();
  }
}
