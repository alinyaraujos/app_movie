import 'package:app_movie/pages/home/domain/entities/movie.dart';

class ResultMovie {
  final int page;
  final int totalPages;
  final List<Movie> results;

  const ResultMovie({
    required this.page,
    required this.totalPages,
    required this.results,
  });
}
