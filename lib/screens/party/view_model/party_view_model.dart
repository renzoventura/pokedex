import 'dart:developer';

import 'package:pokedex/data/moor_database.dart';
import 'package:pokedex/models/pokemon_details.dart';
import 'package:pokedex/screens/base_view_model.dart';
import 'package:pokedex/constants/constants.dart';

class PartyViewModel extends BaseViewModel {
  List<PartyPokemon> pokemons = [];
  int currentPartySize;

  addPokemonToParty(PokemonDetails pokemonDetails) async {
    try {
      setBusy();

      int partySize = await appDatabase.getPartySize();

      if (partySize < MAXIMUM_PARTY_SIZE) {
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
      currentPartySize = await appDatabase.getPartySize();
    } catch (e) {
      log(e.toString());
    } finally {
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
      pokemons = await appDatabase.removePokemonFromParty(pokemon);
      currentPartySize = await appDatabase.getPartySize();
    } catch (e) {
      log(e.toString());
    } finally {
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
}