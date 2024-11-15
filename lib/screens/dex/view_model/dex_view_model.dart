import 'dart:developer';
import 'package:either_option/either_option.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/enums.dart';
import 'package:pokedex/models/errors/problem.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/models/pokemon_page_response.dart';
import 'package:pokedex/screens/base_view_model.dart';
import 'package:pokedex/utils/extensions/string_extension.dart';

class DexViewModel extends BaseViewModel {
  List<PokemonDetails> pokemonDetails = [];
  PokemonPageResponse pokemonPageResponse;
  SortingValues initialValue = SortingValues.ID;

  init() {
    pokemonPageResponse = null;
    if (pokemonDetails.isEmpty) getPokemons();
  }

  Future getPokemonByIdAndAdd(String pokemonName) async {
    try {
      Either<Problem, PokemonDetails> response =
          await pokemonService.getPokemonDetailByName(pokemonName);
      if (response.isRight) pokemonDetails.add(response.right.value);
    } catch (e) {
      log(e.toString());
    }
  }

  getPokemons() async {
    if (pokemonDetails.length < config.numberOfPokemons) {
      int numberOfPokemonToGet = POKEMON_LIST_LIMIT;
      if ((config.numberOfPokemons - pokemonDetails.length) <
          POKEMON_LIST_LIMIT) {
        numberOfPokemonToGet =
            (config.numberOfPokemons - pokemonDetails.length);
      }
      await getPokemonListWithDetails(numberOfPokemonToGet);
    }
  }

  getPokemonListWithDetails(int numberOfPokemons) async {
    setBusy();
    try {
      Either<Problem, PokemonPageResponse> response = await pokemonService
          .getPokemonList(pokemonDetails.length, numberOfPokemons);
      if (response.isRight) {
        pokemonPageResponse = response.right.value;
        var futures = <Future>[];
        for (Results result in pokemonPageResponse.results) {
          if ((result?.name?.isNotNullAndNotEmpty ?? false) &&
              !pokemonDetails.map((e) => e.name).contains(result.name))
            futures.add(getPokemonByIdAndAdd(result?.name));
        }
        await Future.wait(futures);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      applySorting();
      setIdle();
    }
  }

  applySorting() {
    switch (initialValue) {
      case SortingValues.ID:
        pokemonDetails.sort((a, b) => a.id.compareTo(b.id));
        break;
      case SortingValues.NAME:
        pokemonDetails.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortingValues.HEIGHT:
        pokemonDetails.sort((a, b) => a.height.compareTo(b.height));
        break;
      case SortingValues.WEIGHT:
        pokemonDetails.sort((a, b) => a.weight.compareTo(b.weight));
        break;
      case SortingValues.ORDER:
        pokemonDetails.sort((a, b) => a.order.compareTo(b.order));
        break;
    }
  }

  sortPokemon() {
    setBusy();
    try {
      applySorting();
    } catch (e) {
      log(e.toString());
    } finally {
      setIdle();
    }
  }
}
