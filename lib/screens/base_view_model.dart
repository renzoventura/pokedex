import 'package:flutter/cupertino.dart';
import 'package:pokedex/di/setup_dependencies.dart';
import 'package:pokedex/server/dio/pokemon_service.dart';

abstract class BaseViewModel extends ChangeNotifier {
  PokemonService pokemonService = getIt<PokemonService>();
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
