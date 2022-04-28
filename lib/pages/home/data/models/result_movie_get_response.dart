import 'package:app_movie/pages/home/data/models/movie_get_response.dart';
import 'package:app_movie/pages/home/domain/entities/result_movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result_movie_get_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ResultMovieGetResponse {
  final int page;
  final int totalPages;
  final List<MovieGetResponse> results;

  const ResultMovieGetResponse({
    required this.page,
    required this.totalPages,
    required this.results,
  });

  factory ResultMovieGetResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultMovieGetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResultMovieGetResponseToJson(this);

  ResultMovie mapToEntity() {
    return ResultMovie(
      page: page,
      totalPages: totalPages,
      results: results.map((e) => e.mapToEntity()).toList(),
    );
  }
}
