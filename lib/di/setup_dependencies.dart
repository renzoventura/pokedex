import 'package:get_it/get_it.dart';
import 'package:pokedex/config/config.dart';
import 'package:pokedex/config/free/free_production_config.dart';
import 'package:pokedex/config/free/free_testing_config.dart';
import 'package:pokedex/config/pro/paid_production_config.dart';
import 'package:pokedex/config/pro/paid_testing_config.dart';
import 'package:pokedex/constants/enums.dart';

GetIt getIt = GetIt.instance;

setUpDependencies(BuildFlavor flavor, Environment environment) async {
  switch (flavor) {
    case BuildFlavor.FREE:
      {
        switch (environment) {
          case Environment.TESTING:
            getIt.registerSingleton<Config>(FreeTestingConfig());
            break;
          case Environment.PRODUCTION:
            getIt.registerSingleton<Config>(FreeProductionConfig());
            break;
        }
      }

      break;
    case BuildFlavor.PAID:
      {
        switch (environment) {
          case Environment.TESTING:
            getIt.registerSingleton<Config>(PaidTestingConfig());
            break;
          case Environment.PRODUCTION:
            getIt.registerSingleton<Config>(PaidProductionConfig());
            break;
        }
      }
      break;
  }
}
