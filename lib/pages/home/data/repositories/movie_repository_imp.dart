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
  Future<ResultMovie> getMovieNowPlaying() async {
    final apiKey = Environments.param('api_key') ?? '';
    final result = await _dataSource.getMovieNowPlaying(apiKey);

    return result.mapToEntity();
  }

  @override
  Future<ResultMovie> getMoviePopular() async {
    final apiKey = Environments.param('api_key') ?? '';
    final result = await _dataSource.getMoviePopular(apiKey);

    return result.mapToEntity();
  }

  @override
  Future<ResultMovie> getMovieTopRated() async {
    final apiKey = Environments.param('api_key') ?? '';
    final result = await _dataSource.getMovieTopRated(apiKey);

    return result.mapToEntity();
  }

  @override
  Future<ResultMovie> getMovieUpcoming() async {
    final apiKey = Environments.param('api_key') ?? '';
    final result = await _dataSource.getMovieUpcoming(apiKey);

    return result.mapToEntity();
  }
}
