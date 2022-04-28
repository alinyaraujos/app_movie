import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_movie/core/rest_client/dio_rest_client.dart';
import 'package:app_movie/pages/home/domain/use_cases/get_movie_use_case.dart';
import 'package:app_movie/pages/home/presentation/bloc/home_cubit.dart';
import 'package:app_movie/pages/home/presentation/home_page.dart';

import 'data/data_remote/data_sources/movie_remote_data_source.dart';
import 'data/repositories/movie_repository_imp.dart';
import 'domain/repositories/movie_repository.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<MovieRemoteDataSource>(
        (i) => MovieRemoteDataSource(DioRestClient.getDioCliente()),
        export: true),
    Bind.factory<MovieRepository>((i) => MovieRepositoryImpl(dataSource: i()),
        export: true),
    Bind.factory<GetMovieUseCase>((i) => GetMovieUseCaseImpl(repository: i()),
        export: true),
    Bind.singleton<HomeCubit>((i) => HomeCubit(getMovie: i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => HomePage(homeCubit: Modular.get()..getMovie()),
    ),
  ];
}
