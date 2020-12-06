import 'package:flutter/cupertino.dart';
import 'package:pokedex/di/setup_dependencies.dart';
import 'package:pokedex/server/repositories/pokemon_repository.dart';
import 'package:pokedex/server/repositories/pokemon_repository_impl.dart';

abstract class BaseViewModel extends ChangeNotifier {
  PokemonRepositoryImpl pokemonService = getIt<PokemonRepository>();
  bool isBusy = false;

  setBusy() {
    isBusy = true;
    notifyListeners();
  }

  setIdle() {
    isBusy = false;
    notifyListeners();
  }
}
