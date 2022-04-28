
import 'package:app_movie/core/helpers/environments.dart';

class ApplicationStartConfig {
  Future<void> configureApp() async {
    await _loadEnvs();
  }

  Future<void> _loadEnvs() => Environments.loadEnvs();
}
