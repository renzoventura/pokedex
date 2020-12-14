import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_container/pokemon_detail_container.dart';
import 'package:pokedex/config/config.dart';
import 'package:pokedex/data/moor_database.dart';
import 'package:pokedex/di/setup_dependencies.dart';
import 'package:pokedex/screens/party/components/empty_pokemon_container.dart';
import 'package:pokedex/screens/party/view_model/party_view_model.dart';
import 'package:pokedex/utils/extensions/string_extension.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/constants/constants.dart';

class CurrentParty extends StatelessWidget {
  final int gridNumber;

  const CurrentParty({Key key, this.gridNumber = MINIMUM_GRID_SIZE}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _buildTaskList(context, gridNumber);
  }
}

StreamBuilder<List<PartyPokemon>> _buildTaskList(
    BuildContext context, int gridNumber) {
  AppDatabase database = getIt<AppDatabase>();
  return StreamBuilder(
    stream: database.watchParty(),
    builder: (context, AsyncSnapshot<List<PartyPokemon>> snapshot) {
      List<PartyPokemon> pokemonParty = snapshot.data ?? List();
      return GridView.builder(
        itemCount: getIt<Config>().maxPartySize,
        itemBuilder: (_, index) {
          if (pokemonParty.length <= index)
            return EmptyPokemonContainer();
          PartyPokemon pokemon = pokemonParty[index];
          List<String> types = [];
          if (pokemon.typeOne.isNotNullAndNotEmpty) types.add(pokemon?.typeOne);
          if (pokemon.typeTwo.isNotNullAndNotEmpty) types.add(pokemon?.typeTwo);

          return PokemonDetailContainer(
            updateName: (String name) {
              Provider.of<PartyViewModel>(context, listen: false)
                  .updatePokemonName(pokemon, name);
            },
            pokemonTypes: types,
            pokemonName: pokemon.name,
            pokemonId: pokemon.pokemonId,
            pokemonImage: pokemon.image,
            onRemove: () =>
                Provider.of<PartyViewModel>(context, listen: false)
                    .deletePokemon(pokemon),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridNumber,
        ),
      );
    },
  );
}
