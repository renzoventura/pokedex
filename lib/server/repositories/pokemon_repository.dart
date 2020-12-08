import 'package:either_option/either_option.dart';
import 'package:pokedex/models/errors/problem.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/models/pokemon_page_response.dart';

abstract class PokemonRepository {
  Future<Either<Problem, PokemonPageResponse>> getPokemonList(
      int offset, int limit);
  Future<Either<Problem, PokemonDetails>> getPokemonDetailByName(String pokemonName);
}
