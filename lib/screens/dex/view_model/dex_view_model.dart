import 'dart:developer';

import 'package:either_option/either_option.dart';
import 'package:pokedex/models/errors/problem.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/screens/base_view_model.dart';

class DexViewModel extends BaseViewModel {
  PokemonDetails pokemonDetail;
  init() {
    pokemonDetail = null;
  }

  getPokemon() async {
    setBusy();
    try {
      Either<Problem, PokemonDetails> response =
          await pokemonService.getPokemonDetailById();
      if (response.isRight) {
        pokemonDetail = response.right.value;
        print(response.right.value.toJson().toString());
      } else {
      }
    } catch (e) {
      log(e.toString());
    } finally {
      setIdle();
    }
  }
}
