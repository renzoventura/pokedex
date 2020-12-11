import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/components/app_bar/mobile_app_bar.dart';
import 'package:pokedex/components/container_with_background.dart';
import 'package:pokedex/components/drawer/mobile_drawer.dart';
import 'package:pokedex/components/floating_button_navigator.dart';
import 'package:pokedex/components/pokemon_container/pokemon_id.dart';
import 'package:pokedex/components/pokemon_container/pokemon_type_widget.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/data/moor_database.dart';
import 'package:pokedex/di/setup_dependencies.dart';
import 'package:pokedex/screens/dex/screens/poke_dex_screen.dart';
import 'package:pokedex/screens/party/components/number_of_pokemon.dart';
import 'package:pokedex/screens/party/screens/party_screen.dart';
import 'package:pokedex/screens/party/view_model/party_view_model.dart';
import 'package:pokedex/utils/extensions/string_extension.dart';
import 'package:provider/provider.dart';

class PartyScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButtonNavigator(
        title: DEX_BUTTON_LABEL,
        onTap: () => Navigator.pushNamedAndRemoveUntil(
            context, PokeDexScreen.id, ModalRoute.withName(PartyScreen.id)),
      ),
      appBar: MobileAppBar(),
      endDrawer: MobileDrawer(),
      body: ContainerWithBackground(
        child: Padding(
          padding: EdgeInsets.only(
            top: kMarginXL,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kMarginXL),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ASH_PARTY,
                      style: CHOOSE_YOUR_TEAM_TEXT_STYLE,
                      textAlign: TextAlign.left,
                    ),
                    NumberOfPokemon(),
                  ],
                ),
              ),
              Expanded(
                child: _buildTaskList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

StreamBuilder<List<PartyPokemon>> _buildTaskList(BuildContext context) {
  AppDatabase database = getIt<AppDatabase>();
  return StreamBuilder(
    stream: database.watchParty(),
    builder: (context, AsyncSnapshot<List<PartyPokemon>> snapshot) {
      List<PartyPokemon> pokemonParty = snapshot.data ?? List();

      return GridView.builder(
        itemCount: pokemonParty.length,
        itemBuilder: (_, index) {
          PartyPokemon pokemon = pokemonParty[index];
          List<String> types = [];
          if (pokemon.typeOne.isNotNullAndNotEmpty) types.add(pokemon?.typeOne);
          if (pokemon.typeTwo.isNotNullAndNotEmpty) types.add(pokemon?.typeTwo);

          getTypes() {
            List<Widget> pokemonTypeWidgets = [];
            for (String type in types) {
              pokemonTypeWidgets.add(
                PokemonTypeWidget(typeName: type),
              );
            }
            return pokemonTypeWidgets;
          }

          return Column(
            children: [
              CachedNetworkImage(
                imageUrl: pokemon.image,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              PokemonId(
                pokemonId: pokemon.id,
              ),
              Text(
                pokemon.name.capitalize(),
                style: POKEMON_NAME_TEXT_STYLE,
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: kMargin,
                  left: kMargin,
                  right: kMargin,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: getTypes(),
                ),
              ),
              InkWell(
                onTap: () {
                  Provider.of<PartyViewModel>(context, listen: false)
                      .deletePokemon(pokemon);
                },
                child: Icon(
                  Icons.close,
                ),
              )
            ],
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
      );
    },
  );
}
