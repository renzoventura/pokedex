import 'package:flutter/material.dart';
import 'package:pokedex/components/floating_button_navigator.dart';
import 'package:pokedex/config/config.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/screens/dex/screens/poke_dex_screen.dart';
import 'package:pokedex/screens/party/screens/party_screen.dart';
import 'package:pokedex/utils/image_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/data/moor_database.dart';
import 'package:pokedex/di/setup_dependencies.dart';

class MobileCurrentParty extends StatefulWidget {
  final bool isTablet;

  const MobileCurrentParty({Key key, this.isTablet = false}) : super(key: key);
  @override
  _MobileCurrentPartyState createState() => _MobileCurrentPartyState();
}

class _MobileCurrentPartyState extends State<MobileCurrentParty> {
  @override
  Widget build(BuildContext context) {
    return currentPartyList(widget.isTablet);
  }
}

StreamBuilder<List<PartyPokemon>> currentPartyList(bool isTablet) {
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

      if (isTablet) {
        return Column(
          children: [
            Expanded(
              child: Column(
                children: getPokemons(),
              ),
            ),
            FloatingButtonNavigator(

              title: PARTY_BUTTON_LABEL,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, PartyScreen.id, ModalRoute.withName(PokeDexScreen.id)),
            ),
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: getPokemons(),
        );
      }
    },
  );
}
