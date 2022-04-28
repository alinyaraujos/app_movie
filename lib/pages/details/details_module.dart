import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_movie/pages/details/details_movie_page.dart';
import 'package:app_movie/pages/home/domain/entities/movie.dart';

class DetailsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => DetailsMoviePage(movie: args.data as Movie),
    ),
  ];
}
