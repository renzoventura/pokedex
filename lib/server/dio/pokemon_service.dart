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

  ///[ip]/
}
