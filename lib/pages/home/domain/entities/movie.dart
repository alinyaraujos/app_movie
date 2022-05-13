class Movie {
  final String title;
  final String overview;
  final double voteAverage;
  final String? posterPath;

  Movie({
    required this.title,
    required this.overview,
    required this.voteAverage,
    this.posterPath,
  });
}
