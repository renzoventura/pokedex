import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:either_option/either_option.dart';
import 'package:pokedex/di/setup_dependencies.dart';
import 'package:pokedex/models/errors/problem.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/models/pokemon_page_response.dart';
import 'package:pokedex/server/dio/pokemon_service.dart';
import 'package:pokedex/server/repositories/pokemon_repository.dart';
import 'package:pokedex/utils/extensions/response_extension.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonService pokemonService = getIt<PokemonService>();
  @override
  Future<Either<Problem, PokemonPageResponse>> getPokemonList(int offset, int limit) async {
    try {
      Response response = await pokemonService.getListOfPokemon(offset, limit);
      if (response.isSuccess) {
        // PokemonPageResponse pokemonDetails = await compute(
        //     pokemonPageResponseResponseFromJson, json.encode(response.data));
        // return Right(pokemonDetails);
        return Right(PokemonPageResponse.fromJson(response.data));
      } else {
        return Left(Problem(errorMessage: response.data));
      }
    } catch (e) {
      log(e.toString());
      return Left(Problem(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Problem, PokemonDetails>> getPokemonDetailByName(String pokemonName) async {
    try {
      Response response = await pokemonService.getPokemonDetailByName(pokemonName);
      if (response.isSuccess) {
        // PokemonDetails pokemonDetails = await compute(
        //     pokemonDetailsResponseFromJson, json.encode(response.data));
        // return Right(pokemonDetails);
        return Right(PokemonDetails.fromJson(response.data));
      } else {
        return Left(Problem(errorMessage: response.data));
      }
    } catch (e) {
      log(e.toString());
      return Left(Problem(errorMessage: e.toString()));
    }
  }
}
