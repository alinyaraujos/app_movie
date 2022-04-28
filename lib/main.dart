import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_movie/app_module.dart';
import 'package:app_movie/core/helpers/application_start_config.dart';

import 'app_widget.dart';

Future<void> main() async {
  await ApplicationStartConfig().configureApp();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
