import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_movie/core/rest_client/dio_rest_client.dart';
import 'package:app_movie/pages/home/home_module.dart';

import 'core/rest_client/rest_client.dart';
import 'pages/details/details_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<Module> get imports => [CoreModule()];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/details', module: DetailsModule()),
  ];
}

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<RestClient>((i) => DioRestClient(), export: true),
      ];
}
