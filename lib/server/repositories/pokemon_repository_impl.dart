import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_option/either_option.dart';
import 'package:pokedex/di/setup_dependencies.dart';
import 'package:pokedex/models/errors/problem.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/server/dio/pokemon_service.dart';
import 'package:pokedex/server/repositories/pokemon_repository.dart';
import 'package:pokedex/utils/extensions/response_extension.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonService pokemonService = getIt<PokemonService>();
  @override
  Future<Either<Problem, Pokemon>> getPokemons() async {
    try {
      Response response = await pokemonService.getListOfPokemon();
      if (response.isSuccess) {
        return Right(Pokemon.fromJson(response.data));
      } else {
        return Left(Problem(errorMessage: response.data));
      }
    } catch (e) {
      log(e.toString());
      return Left(Problem(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Problem, PokemonDetail>> getPokemonDetailById() async {
    try {
      Response response = await pokemonService.getListOfPokemon();
      if (response.isSuccess) {
        return Right(PokemonDetail.fromJson(response.data));
      } else {
        return Left(Problem(errorMessage: response.data));
      }
    } catch (e) {
      log(e.toString());
      return Left(Problem(errorMessage: e.toString()));
    }
  }
}
