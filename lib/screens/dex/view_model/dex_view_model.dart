import 'package:either_option/either_option.dart';
import 'package:pokedex/models/errors/problem.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/screens/base_view_model.dart';

class DexViewModel extends BaseViewModel {
  PokemonDetail pokemonDetail;
  init() {
    pokemonDetail = null;
  }

  getPokemon() async {
    setBusy();
    try {
      Either<Problem, PokemonDetail> response =
          await pokemonService.getPokemonDetail();
      if (response.isRight) {
        pokemonDetail = response.right.value;
      } else {
        print("Something went wrong!");
      }
    } catch (e) {} finally {
      setIdle();
    }
  }
}
