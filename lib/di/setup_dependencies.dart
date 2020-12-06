import 'package:get_it/get_it.dart';
import 'package:pokedex/config/config.dart';
import 'package:pokedex/config/free/free_production_config.dart';
import 'package:pokedex/config/free/free_testing_config.dart';
import 'package:pokedex/config/pro/paid_production_config.dart';
import 'package:pokedex/config/pro/paid_testing_config.dart';
import 'package:pokedex/constants/enums.dart';
import 'package:pokedex/server/dio/pokemon_service.dart';
import 'package:pokedex/server/repositories/pokemon_repository_impl.dart';

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

  //setup service
  getIt.registerSingleton<PokemonService>(PokemonService());
  getIt.registerSingleton<PokemonRepositoryImpl>(PokemonRepositoryImpl());
}
