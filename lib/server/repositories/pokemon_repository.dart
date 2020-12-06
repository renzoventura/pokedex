import 'package:either_option/either_option.dart';
import 'package:pokedex/models/errors/problem.dart';
import 'file:///C:/Users/Renzo/Documents/RENZO/CV2020/pokedex/lib/models/generated/pokemon.dart';
import 'package:pokedex/models/pokemon_details.dart';

abstract class PokemonRepository {
  Future<Either<Problem,Pokemon>> getPokemons();
  Future<Either<Problem,PokemonDetails>> getPokemonDetailById();

}