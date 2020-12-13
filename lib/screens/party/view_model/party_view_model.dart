import 'dart:developer';

import 'package:pokedex/config/config.dart';
import 'package:pokedex/data/moor_database.dart';
import 'package:pokedex/di/setup_dependencies.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/screens/base_view_model.dart';

class PartyViewModel extends BaseViewModel {
  List<PartyPokemon> pokemons = [];
  int currentPartySize;

  addPokemonToParty(PokemonDetails pokemonDetails) async {
    try {
      setBusy();
      int partySize = await appDatabase.getPartySize();
      bool isInParty = await appDatabase.isNotInParty(pokemonDetails.id);
      if (partySize < getIt<Config>().maxPartySize && isInParty) {
        PartyPokemon partyData = PartyPokemon(
          pokemonId: pokemonDetails.id,
          name: pokemonDetails.name,
          image: pokemonDetails.sprites.frontDefault,
          typeOne: pokemonDetails.types.first.type.name,
          typeTwo: pokemonDetails.types.length > 1
              ? pokemonDetails?.types[1]?.type?.name
              : null,
        );

        appDatabase.insertPokemonToParty(partyData);

        // for (Types type in pokemonDetails.types) {
        //   PartyType partyType = PartyType(
        //     name: type.type.name,
        //     pokemonId: pokemonDetails.id,
        //   );
        //   appDatabase.insertTag(partyType);
        // }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      currentPartySize = await appDatabase.getPartySize();
      await updatePokemon();
      setIdle();
    }
  }

  // getAllPokemons() async {
  //   try {
  //     setBusy();
  //     pokemons = await appDatabase.getAllPokemons();
  //   } catch (e) {
  //     log(e.toString());
  //   } finally {
  //     setIdle();
  //   }
  // }

  deletePokemon(PartyPokemon pokemon) async {
    try {
      setBusy();
      await appDatabase.removePokemonFromParty(pokemon);
    } catch (e) {
      log(e.toString());
    } finally {
      currentPartySize = await appDatabase.getPartySize();
      await updatePokemon();
      setIdle();
    }
  }

  updatePartySize() async {
    try {
      setBusy();
      currentPartySize = await appDatabase.getPartySize();
    } catch (e) {
      log(e.toString());
    } finally {
      setIdle();
    }
  }

  updatePokemon() async {
    pokemons = await appDatabase.getParty();
  }

  bool pokemonIsInParty(int id) {
    pokemons.forEach((element) {
      return element.id == id;
    });
    return false;
  }

  Future<bool> isNotInParty(int id) async => await appDatabase.isNotInParty(id);

  updatePokemonName(PartyPokemon partyPokemon, String name) async {
    PartyPokemon partyData = PartyPokemon(
      id: partyPokemon.id,
      pokemonId: partyPokemon.pokemonId,
      name: name,
      image: partyPokemon.image,
      typeOne: partyPokemon.typeOne,
      typeTwo: partyPokemon.typeTwo,
    );
    await getIt<AppDatabase>().updatePokemonName(partyData);
  }
}
