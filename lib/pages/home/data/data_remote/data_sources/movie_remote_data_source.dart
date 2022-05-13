import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:app_movie/pages/home/data/models/result_movie_get_response.dart';

part 'movie_remote_data_source.g.dart';

@RestApi()
abstract class MovieRemoteDataSource {
  factory MovieRemoteDataSource(
    Dio dio, {
    String baseUrl,
  }) = _MovieRemoteDataSource;

  @GET('/movie/now_playing')
  @Header('Content-Type: application/json')
  Future<ResultMovieGetResponse> getMovieNowPlaying(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET('/movie/popular')
  @Header('Content-Type: application/json')
  Future<ResultMovieGetResponse> getMoviePopular(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET('/movie/top_rated')
  @Header('Content-Type: application/json')
  Future<ResultMovieGetResponse> getMovieTopRated(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );

  @GET('/movie/upcoming')
  @Header('Content-Type: application/json')
  Future<ResultMovieGetResponse> getMovieUpcoming(
    @Query('api_key') String apiKey,
    @Query('page') int page,
  );
}
