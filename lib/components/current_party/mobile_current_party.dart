import 'package:flutter/material.dart';
import 'package:pokedex/config/config.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/utils/image_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/data/moor_database.dart';
import 'package:pokedex/di/setup_dependencies.dart';

class MobileCurrentParty extends StatefulWidget {
  @override
  _MobileCurrentPartyState createState() => _MobileCurrentPartyState();
}

class _MobileCurrentPartyState extends State<MobileCurrentParty> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMarginXL),
      child: _buildTaskList(),
    );
  }
}

StreamBuilder<List<PartyPokemon>> _buildTaskList() {
  AppDatabase database = getIt<AppDatabase>();
  return StreamBuilder(
    stream: database.watchParty(),
    builder: (context, AsyncSnapshot<List<PartyPokemon>> snapshot) {
      List<PartyPokemon> pokemonParty = snapshot.data ?? List();
      List<Widget> getPokemons() {
        List<Widget> currentParty = [];
        pokemonParty.forEach((pokemon) {
          currentParty.add(
            CachedNetworkImage(
              imageUrl: pokemon.image,
              width: CURRENT_PARTY_WIDTH,
            ),
          );
        });
        while (currentParty.length < getIt<Config>().maxPartySize) {
          currentParty.add(
            Image.asset(
              ImageUtils.PARTY_PLACEHOLDER_SMALL,
              height: CURRENT_PARTY_WIDTH,
            ),
          );
        }
        return currentParty;
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: getPokemons(),
      );
    },
  );
}
