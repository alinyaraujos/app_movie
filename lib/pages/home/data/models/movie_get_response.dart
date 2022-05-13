import 'package:app_movie/pages/home/domain/entities/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_get_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieGetResponse {
  final String title;
  final String overview;
  final double voteAverage;
  final String? posterPath;

  const MovieGetResponse({
    required this.title,
    required this.overview,
    required this.voteAverage,
    this.posterPath,
  });

  factory MovieGetResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieGetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieGetResponseToJson(this);

  Movie mapToEntity() {
    return Movie(
      title: title,
      overview: overview,
      voteAverage: voteAverage,
      posterPath: posterPath,
    );
  }
}
