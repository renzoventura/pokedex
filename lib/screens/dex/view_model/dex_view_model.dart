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

  getPokemonByIdAndAdd(String pokemonName) async {
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
        for (Results result in pokemonPageResponse.results) {
          if (result?.name?.isNotNullAndNotEmpty ?? false)
            await getPokemonByIdAndAdd(result?.name);
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      applySorting();
      setIdle();
    }
  }

  applySorting() {
    print("APPLYING SORT");
    switch (initialValue) {
      case SortingValues.ID:
        print("APPLYING SORT: ${initialValue.toString()}");
        pokemonDetails.sort((a, b) => a.id.compareTo(b.id));
        break;
      case SortingValues.NAME:
        print("APPLYING SORT: ${initialValue.toString()}");
        pokemonDetails.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortingValues.HEIGHT:
        print("APPLYING SORT: ${initialValue.toString()}");
        pokemonDetails.sort((a, b) => a.height.compareTo(b.height));
        break;
      case SortingValues.WEIGHT:
        print("APPLYING SORT: ${initialValue.toString()}");
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
