import 'dart:developer';

import 'package:either_option/either_option.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/models/errors/problem.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/models/pokemon_page_response.dart';
import 'package:pokedex/screens/base_view_model.dart';
import 'package:pokedex/utils/extensions/string_extension.dart';

class DexViewModel extends BaseViewModel {
  List<PokemonDetails> pokemonDetails = [];
  PokemonPageResponse pokemonPageResponse;

  init() {
    pokemonDetails = [];
    pokemonPageResponse = null;
    getPokemonList();
  }

  getPokemonById(String pokemonName) async {
    try {
      Either<Problem, PokemonDetails> response =
          await pokemonService.getPokemonDetailByName(pokemonName);
      if (response.isRight) {
        pokemonDetails.add(response.right.value);
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }

  getPokemonList() async {
    setBusy();
    try {
      // int length = pokemonDetails.length;
      // if (length >= config.numberOfPokemons) {
      //   length = config.numberOfPokemons - length;
      // }
      Either<Problem, PokemonPageResponse> response =
          await pokemonService.getPokemonList(pokemonDetails.length, POKEMON_LIST_LIMIT);
      if (response.isRight) {
        pokemonPageResponse = response.right.value;
        for (Results result in pokemonPageResponse.results) {
          if (result?.name?.isNotNullOrNotEmpty ?? false)
            await getPokemonById(result?.name);
        }
      } else {}
    } catch (e) {
      log(e.toString());
    } finally {
      setIdle();
    }
  }
}
