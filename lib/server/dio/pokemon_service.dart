import 'package:dio/dio.dart';
import 'package:pokedex/config/config.dart';
import 'package:pokedex/di/setup_dependencies.dart';

class PokemonService {
  final Dio _dio = Dio();

  PokemonService() {
    //set up baseurl and timeout from configs
    _dio.options.baseUrl = getIt<Config>().baseUrl;
    _dio.options.receiveTimeout = getIt<Config>().timeout;
  }

  String buildUrl(String path) => '${getIt<Config>().baseUrl}$path';

  ///[ip]/api/v2/pokemon/
  ///get list of pokemons
  Future<dynamic> getListOfPokemon(int offset, int limit) {
    String path = "/pokemon/?offset=$offset&limit=$limit";
    return _dio.get(buildUrl(path));
  }

  ///[ip]/api/v2/pokemon/[name]
  ///get list of pokemons
  Future<dynamic> getPokemonDetailByName(String pokemonName) {
    String path = "/pokemon/$pokemonName";
    return _dio.get(buildUrl(path));
  }
}
